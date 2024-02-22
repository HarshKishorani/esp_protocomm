import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';

// TODO : Implement Method channel for this in IOS : https://github.com/nicop2000/esp_provisioning_softap/tree/master/ios
class Cryptor {
  static const MethodChannel _channel = MethodChannel('esp_crypt_channel');

  Future<bool> init(Uint8List key, Uint8List iv) async {
    return await _channel.invokeMethod('init', {
      'key': key,
      'iv': iv,
    });
  }

  Future<Uint8List> crypt(Uint8List data) async {
    return await _channel.invokeMethod(
      'crypt',
      {
        'data': data,
      },
    );
  }
}
