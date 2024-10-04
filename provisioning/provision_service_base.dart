import 'dart:async';
import 'dart:convert';
import '../esp/esp_security1.dart';
import '../esp/esp_session.dart';
import '../esp/esp_transport_methods.dart';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'esp_prov_api_manager.dart';

class ESPProvisioning {
  static late EspProv prov;
  bool deviceConnected = false;
  List<Map<String, dynamic>> discoveredDevices = [];
  List<Map<String, dynamic>> foundNetworks = [];

  ESPProvisioning();

  Stream<Map<String, dynamic>> scanBleDevices({required String prefix}) async* {
    await FlutterBluePlus.stopScan();
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10), withKeywords: [prefix]);
    discoveredDevices.clear();

    // Listen for the end of scanning using the isScanning stream
    FlutterBluePlus.isScanning.listen((isScanning) {
      print("Listening scanning : $isScanning");
      if (!isScanning) {
        if (discoveredDevices.isEmpty) {
          Fluttertoast.showToast(
            msg: "0 Devices Found.",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
          );
        }
        discoveredDevices.clear();
        print("BLE scan complete.");
      }
    });

    await for (List<ScanResult> scanResults in FlutterBluePlus.onScanResults) {
      for (ScanResult scanResult in scanResults) {
        BluetoothDevice device = scanResult.device;
        bool hasInTheList = false;

        print(
              "Scanned HomeMate Pro Device ${device.platformName}, RSSI ${scanResult.rssi}",
            );

        // Get and Decode Manufacturer Data
        dynamic manufacturerData;
        try {
          manufacturerData = scanResult.advertisementData.msd.isNotEmpty
              ? String.fromCharCodes(
                      scanResult.advertisementData.msd.first) // Raw mfg data into string
                  .trim()
              : null;
          assert(manufacturerData != null);
          manufacturerData = jsonDecode(manufacturerData);
          assert(manufacturerData is Map);
        } catch (e) {
          print("Cannot Process BLE Device Manufacturer Data: ${e.toString()}");
        }

        // Create and add peripheral map
        Map<String, dynamic> peripheralMap = {
          "manufacturerData": manufacturerData is Map ? manufacturerData : {},
          "name": device.platformName,
          "instance": device,
        };

        for (var obj in discoveredDevices) {
          if (obj["manufacturerData"]["device"] == peripheralMap["manufacturerData"]["device"]) {
            hasInTheList = true;
          }
        }

        if (!hasInTheList) {
          discoveredDevices.add(peripheralMap); // Store discovered devices
          yield peripheralMap; // Yielding each discovered peripheral map
        }
      }
    }
  }

  Future<bool> bleConnect({required Map<String, dynamic> item, String pop = "abcd1234"}) async {
    BluetoothDevice selectedDevice = item['instance'];
    var transport = TransportBLE(selectedDevice);
    bool result = await transport.connect();

    if (result) {
      deviceConnected = true;
      print("Device Connected.");
      bool session = await establishSession(selectedDevice: selectedDevice, pop: pop);
      return session;
    } else {
      print("Device Not Connected.");
      deviceConnected = false;
    }
    return deviceConnected;
  }

  Future<bool> establishSession(
      {required BluetoothDevice selectedDevice, required String pop}) async {
    // Initialise
    prov = EspProv(
      transport: TransportBLE(selectedDevice),
      security: Security1(pop: pop),
    );

    // Establish session
    var sessionStatus = await prov.establishSession();
    print("Session Status = $sessionStatus");
    switch (sessionStatus) {
      case EstablishSessionStatus.connected:
        return true;
      case EstablishSessionStatus.disconnected:
      case EstablishSessionStatus.keymismatch:
      default:
        return false;
    }
  }

  Future<List<Map<String, dynamic>>> scanWifiNetworks(
      {required String selectedDeviceName, required String proofOfPossession}) async {
    try {
      var listWifi = await prov.startScanWiFi();
      for (var obj in listWifi) {
        print('Scanned Wifi network: ${obj.ssid}');
        Map<String, dynamic> networksMap = {
          "ssid": obj.ssid,
          "instance": obj,
        };
        foundNetworks.add(networksMap); // Store scanned networks
      }
    } catch (e) {
      print('Error scanning WiFi networks: $e');
    }
    return foundNetworks;
  }

  Future<(bool, String)> provisionWifi(
      {required String userId, required String selectedSsid, required String passphrase}) async {
    Uint8List customAnswerBytes = await prov.sendReceiveCustomData(
      Uint8List.fromList(utf8.encode(userId)),
    );
    String customAnswer = String.fromCharCodes(customAnswerBytes);
    if (customAnswer.isNotEmpty) {
      customAnswer = customAnswer.substring(0, customAnswer.length - 1);
    }

    print("Device Id received (Size: ${customAnswer.length}, id: $customAnswer)");
    await prov.sendWifiConfig(ssid: selectedSsid, password: passphrase);
    bool provisioned = await prov.applyWifiConfig();
    return (provisioned, customAnswer);
  }
}
