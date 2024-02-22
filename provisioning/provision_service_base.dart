// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:aulee/device_control/esp/esp_security1.dart';
import 'package:aulee/device_control/esp/esp_session.dart';
import 'package:aulee/device_control/esp/esp_transport_methods.dart';
import 'package:aulee/device_control/provisioning/esp_prov_api_manager.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter_ble_lib_ios_15/flutter_ble_lib.dart';

class ESPProvisioning {
  static late EspProv prov;
  static BleManager bleManager = BleManager();
  bool deviceConnected = false;
  List<Map<String, dynamic>> discoveredDevices = [];
  List<Map<String, dynamic>> foundNetworks = [];

  Future<List<Map<String, dynamic>>> scanBleDevices({required String prefix}) async {
    await bleManager.createClient();
    bleManager.startPeripheralScan().listen((scanResult) {
      Peripheral peripheral = scanResult.peripheral;
      debugPrint(
        "Scanned Peripheral ${peripheral.name}, \n RSSI ${scanResult.rssi}",
      );
      Map<String, dynamic> peripheralMap = {
        "name": peripheral.name,
        "instance": peripheral,
      };
      bool hasInTheList = false;
      if (peripheral.name != null) {
        if (peripheral.name!.contains(prefix)) {
          for (var obj in discoveredDevices) {
            if (obj['name'] == peripheral.name) {
              hasInTheList = true;
            }
          }
          if (!hasInTheList) {
            discoveredDevices.add(peripheralMap); // Devices are stored in discovered devices.
          }
        }
      }
    });
    await Future.delayed(const Duration(seconds: 5));
    stopBleScan();
    return discoveredDevices;
  }

  Future<void> stopBleScan() async {
    await bleManager.stopPeripheralScan();
  }

  Future<bool> bleConnect({required Map<String, dynamic> item, String pop = "abcd1234"}) async {
    debugPrint("Trying to connect :\n$item");
    Peripheral selectedPeripheral = item['instance'];
    var transport = TransportBLE(selectedPeripheral);
    bool result = await transport.connect();
    if (result) {
      deviceConnected = true;
      debugPrint("Peripheral Connected.");
      bool session = await establishSession(selectedPeripheral: selectedPeripheral, pop: pop);
      return session;
    } else {
      debugPrint("Peripheral Not Connected.");
      deviceConnected = false;
      // Ble connection failed
    }
    return deviceConnected;
  }

  Future<bool> establishSession(
      {required Peripheral selectedPeripheral, required String pop}) async {
    // Initialise
    prov = EspProv(
      transport: TransportBLE(selectedPeripheral),
      security: Security1(
        pop: pop,
      ),
    );

    // Establish session
    var sessionStatus = await prov.establishSession();
    debugPrint("Session Status = $sessionStatus");
    switch (sessionStatus) {
      case EstablishSessionStatus.connected:
        {
          return true;
        }
      case EstablishSessionStatus.disconnected:
        {
          return false;
        }
      case EstablishSessionStatus.keymismatch:
        {
          return false;
        }
      default:
        return false;
    }
  }

  Future<List<Map<String, dynamic>>> scanWifiNetworks(
      {required String selectedDeviceName, required String proofOfPossession}) async {
    try {
      var listWifi = await prov.startScanWiFi();
      debugPrint('Found ${listWifi.length} WiFi networks');
      for (var obj in listWifi) {
        debugPrint('WiFi network: ${obj.ssid}');
        Map<String, dynamic> networksMap = {
          "ssid": obj.ssid,
          "instance": obj,
        };
        foundNetworks.add(networksMap); // All networks scanned
      }
    } catch (e) {
      debugPrint('Error scan WiFi network: $e');
    }
    return foundNetworks;
  }

  Future<(bool, String)> provisionWifi(
      {required String userId, required String selectedSsid, required String passphrase}) async {
    Uint8List customAnswerBytes = await prov.sendReceiveCustomData(
      Uint8List.fromList(
        utf8.encode(userId),
      ),
    );
    String customAnswer = String.fromCharCodes(customAnswerBytes);
    if (customAnswer.isNotEmpty) {
      customAnswer = customAnswer.substring(0, customAnswer.length - 1);
    }
    debugPrint("Device Id of size ${customAnswer.length} received....$customAnswer.");
    await prov.sendWifiConfig(ssid: selectedSsid, password: passphrase);
    bool provisioned = await prov.applyWifiConfig();
    return (provisioned, customAnswer);
  }
}
