import 'dart:typed_data';
import 'package:aulee/device_control/esp/esp_transport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_lib_ios_15/flutter_ble_lib.dart';
import 'package:http/http.dart' as http;
import 'package:string_validator/string_validator.dart';

class TransportBLE implements Transport {
  final Peripheral peripheral;
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

  TransportBLE(this.peripheral,
      {this.serviceUUID = PROV_BLE_SERVICE, this.lockupTable = PROV_BLE_EP}) {
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
      await peripheral.connect(requestMtu: 256);
      debugPrint("Connect Successfully!!!");
    } catch (e) {
      debugPrint("Error: trying to Connect $e");
    }
    try {
      await peripheral.discoverAllServicesAndCharacteristics(
          transactionId: 'discoverAllServicesAndCharacteristics');
    } catch (e) {
      debugPrint("Error: trying to DiscoverAllServicesAndCharacteristics: $e");
    }
    return await peripheral.isConnected();
  }

  @override
  Future<Uint8List> sendReceive(String? epName, Uint8List? data) async {
    if (data != null) {
      if (data.isNotEmpty) {
        await peripheral.writeCharacteristic(serviceUUID, nuLookup[epName ?? ""]!, data, true);
      }
    }
    CharacteristicWithValue receivedData = await peripheral.readCharacteristic(
        serviceUUID, nuLookup[epName ?? ""]!,
        transactionId: 'readCharacteristic');
    return receivedData.value;
  }

  @override
  Future<bool> disconnect() async {
    bool check = await peripheral.isConnected();
    if (check) {
      try {
        await peripheral.disconnectOrCancelConnection();
        return true;
      } on Exception catch (e) {
        debugPrint("Error trying to disconnect device: $e");
        return false;
      }
    } else {
      return true;
    }
  }

  @override
  Future<bool> checkConnect() async {
    return await peripheral.isConnected();
  }

  void dispose() {
    debugPrint('dispose ble');
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
      debugPrint("Connecting to $hostname/$epName");
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
        debugPrint("onError");
        debugPrint(error.toString());
        debugPrint(stackTrace.toString());
        return Future.error(error!);
      });

      _updateCookie(response);
      if (response.statusCode == 200) {
        debugPrint('Connection successful');
        // client.close();
        final Uint8List bodyBytes = response.bodyBytes;
        return bodyBytes;
      } else {
        debugPrint('Connection failed – HTTP-Status ${response.statusCode}');
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
