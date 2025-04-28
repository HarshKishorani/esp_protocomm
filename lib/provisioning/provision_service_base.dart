import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

import '../esp/esp_security1.dart';
import '../esp/esp_session.dart';
import '../esp/esp_transport_methods.dart';
import '../models/device_info.dart';
import '../models/wifi_network.dart';
import 'esp_prov_api_manager.dart';

/// A manager class to handle ESP device provisioning over BLE.
class ESPProvisioning {
  static late EspProv prov;
  bool deviceConnected = false;
  final List<DeviceInfo> discoveredDevices = [];
  final List<WifiNetworkInfo> foundNetworks = [];
  final Logger _logger = Logger();

  ESPProvisioning();

  /// Scans for BLE devices with the given [prefix] in their advertised name.
  ///
  /// Yields [DeviceInfo] objects when new matching devices are found.
  Stream<DeviceInfo> scanBleDevices({String prefix = "prov_"}) async* {
    await FlutterBluePlus.stopScan();
    await FlutterBluePlus.startScan(
      timeout: const Duration(seconds: 10),
      withKeywords: [prefix],
    );
    discoveredDevices.clear();

    FlutterBluePlus.isScanning.listen((isScanning) {
      _logger.i("Scanning status: $isScanning");
      if (!isScanning) {
        if (discoveredDevices.isEmpty) {
          Fluttertoast.showToast(
            msg: "0 Devices Found.",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
          );
        }
        discoveredDevices.clear();
        _logger.i("BLE scan complete.");
      }
    });

    await for (final List<ScanResult> scanResults in FlutterBluePlus.onScanResults) {
      for (final scanResult in scanResults) {
        final device = scanResult.device;
        _logger.i("Scanned Device: ${device.platformName}, RSSI: ${scanResult.rssi}");

        Map<String, dynamic> manufacturerData = {};
        try {
          final rawData = scanResult.advertisementData.msd.isNotEmpty
              ? String.fromCharCodes(scanResult.advertisementData.msd.first).trim()
              : null;
          if (rawData != null) {
            manufacturerData = jsonDecode(rawData);
          }
        } catch (e) {
          _logger.e("Failed to decode manufacturer data", error: e);
        }

        final peripheral = DeviceInfo(
          name: device.platformName,
          manufacturerData: manufacturerData,
          device: device,
        );

        final alreadyDiscovered = discoveredDevices
            .any((obj) => obj.manufacturerData["device"] == peripheral.manufacturerData["device"]);

        if (!alreadyDiscovered) {
          discoveredDevices.add(peripheral);
          yield peripheral;
        }
      }
    }
  }

  /// Connects to the given [DeviceInfo] BLE device and establishes a secure session.
  ///
  /// Optionally provide a [pop] (Proof of Possession) string.
  Future<bool> bleConnect({required DeviceInfo item, String pop = "abcd1234"}) async {
    final selectedDevice = item.device;
    final transport = TransportBLE(selectedDevice);
    final result = await transport.connect();

    if (result) {
      deviceConnected = true;
      _logger.i("Device connected successfully.");
      final sessionEstablished = await establishSession(
        selectedDevice: selectedDevice,
        pop: pop,
      );
      return sessionEstablished;
    } else {
      deviceConnected = false;
      _logger.w("Failed to connect to device.");
    }
    return deviceConnected;
  }

  /// Establishes a security session with the given [selectedDevice] using [pop].
  Future<bool> establishSession({
    required BluetoothDevice selectedDevice,
    required String pop,
  }) async {
    prov = EspProv(
      transport: TransportBLE(selectedDevice),
      security: Security1(pop: pop),
    );

    final sessionStatus = await prov.establishSession();
    _logger.i("Session status: $sessionStatus");

    switch (sessionStatus) {
      case EstablishSessionStatus.connected:
        return true;
      case EstablishSessionStatus.disconnected:
      case EstablishSessionStatus.keymismatch:
        return false;
    }
  }

  /// Scans Wi-Fi networks available for provisioning.
  Future<List<WifiNetworkInfo>> scanWifiNetworks() async {
    foundNetworks.clear();
    try {
      final listWifi = await prov.startScanWiFi();
      for (final obj in listWifi) {
        _logger.i('Found Wi-Fi network: ${obj.ssid}');
        foundNetworks.add(
          WifiNetworkInfo(
            ssid: obj.ssid,
            instance: obj,
          ),
        );
      }
    } catch (e) {
      _logger.e('Error scanning Wi-Fi networks', error: e);
    }
    return foundNetworks;
  }

  /// Provisions the device by sending [selectedSsid] and [passphrase] Wi-Fi credentials,
  /// along with the [userId] for custom binding or device identification.
  ///
  /// Returns a tuple (success status, received device ID string).
  Future<(bool, String)> provisionWifi({
    required String customData,
    required String selectedSsid,
    required String passphrase,
  }) async {
    final customAnswerBytes = await prov.sendReceiveCustomData(
      Uint8List.fromList(utf8.encode(customData)),
    );
    String customAnswer = String.fromCharCodes(customAnswerBytes);
    if (customAnswer.isNotEmpty) {
      customAnswer = customAnswer.substring(0, customAnswer.length - 1);
    }

    _logger.i("Device ID received (size: ${customAnswer.length}): $customAnswer");

    await prov.sendWifiConfig(ssid: selectedSsid, password: passphrase);
    final provisioned = await prov.applyWifiConfig();

    return (provisioned, customAnswer);
  }
}
