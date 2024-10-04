// ignore_for_file: constant_identifier_names

import 'dart:typed_data';
import 'esp_transport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:http/http.dart' as http;
import 'package:string_validator/string_validator.dart';

class TransportBLE implements Transport {
  final BluetoothDevice device;
  final String serviceUUID;
  late final Map<String, String> nuLookup;
  final Map<String, String> lockupTable;

  static const PROV_BLE_SERVICE = '021a9004-0382-4aea-bff4-6b3f1c5adfb4';
  static const PROV_BLE_EP = {
    'prov-scan': 'ff50',
    'prov-session': 'ff51',
    'prov-config': 'ff52',
    'proto-ver': 'ff53',
    'custom-data': 'ff54',
  };

  TransportBLE(this.device, {this.serviceUUID = PROV_BLE_SERVICE, this.lockupTable = PROV_BLE_EP}) {
    nuLookup = {
      for (var name in lockupTable.keys)
        name: serviceUUID.substring(0, 4) +
            int.parse(lockupTable[name]!, radix: 16).toRadixString(16).padLeft(4, '0') +
            serviceUUID.substring(8)
    };
  }

  @override
  Future<bool> connect() async {
    disconnect();
    try {
      await device.connect(autoConnect: false, mtu: 256);
      print("Connected Successfully!!!");
    } catch (e) {
      print("Error: trying to connect $e");
      return false;
    }
    return device.isConnected;
  }

  @override
  Future<Uint8List> sendReceive(String? epName, Uint8List? data) async {
    if (data != null && data.isNotEmpty) {
      final service = await _getService();
      final characteristic = _getCharacteristic(service, nuLookup[epName ?? ""]!);

      // Write data to characteristic
      await characteristic.write(data);
    }

    final service = await _getService();
    final characteristic = _getCharacteristic(service, nuLookup[epName ?? ""]!);

    // Read the response
    List<int> receivedData = await characteristic.read();
    return Uint8List.fromList(receivedData);
  }

  @override
  Future<bool> disconnect() async {
    try {
      await device.disconnect();
      print("Disconnected successfully");
      return true;
    } catch (e) {
      print("Error disconnecting device: $e");
      return false;
    }
  }

  @override
  Future<bool> checkConnect() async {
    return device.isConnected;
  }

  Future<BluetoothService> _getService() async {
    List<BluetoothService> services = await device.discoverServices();
    return services.firstWhere(
      (service) => service.uuid.toString() == serviceUUID,
    );
  }

  BluetoothCharacteristic _getCharacteristic(BluetoothService service, String characteristicUUID) {
    return service.characteristics.firstWhere(
      (characteristic) => characteristic.uuid.toString() == characteristicUUID,
    );
  }

  void dispose() {
    print('dispose ble');
  }
}

class TransportHTTP implements Transport {
  String hostname;
  Duration timeout;
  Map<String, String> headers = {};
  var client = http.Client();

  TransportHTTP({required this.hostname, this.timeout = const Duration(seconds: 10)}) {
    if (!isURL(hostname)) {
      throw const FormatException('hostname should be an URL.');
    }

    headers["Content-type"] = "application/x-www-form-urlencoded";
    headers["Accept"] = "text/plain";
  }

  @override
  Future<bool> connect() async {
    return true;
  }

  @override
  Future<bool> disconnect() async {
    client.close();
    return true;
  }

  void _updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] = (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  @override
  Future<Uint8List> sendReceive(String epName, Uint8List data) async {
    try {
      print("Connecting to $hostname/$epName");
      final response = await client
          .post(
              Uri.http(
                hostname,
                "/$epName",
              ),
              headers: headers,
              body: data)
          .timeout(timeout)
          .onError((error, stackTrace) {
        print("onError");
        print(error.toString());
        print(stackTrace.toString());
        return Future.error(error!);
      });

      _updateCookie(response);
      if (response.statusCode == 200) {
        print('Connection successful');
        // client.close();
        final Uint8List bodyBytes = response.bodyBytes;
        return bodyBytes;
      } else {
        print('Connection failed – HTTP-Status ${response.statusCode}');
        throw Future.error(
            Exception("ESP Device doesn't repond. HTTP-Status ${response.statusCode}"));
      }
    } catch (e) {
      throw StateError(
          'StateError in transport_http.dart – Connection error (${e.runtimeType.toString()})$e');
    }
  }

  @override
  Future<bool> checkConnect() {
    // TODO: implement checkConnect
    return Future(() => true);
  }
}
