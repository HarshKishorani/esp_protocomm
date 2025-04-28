import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:cryptography/cryptography.dart';

class Cryptor {
  late final AesCtr _aesCtr;
  late final SecretKey _secretKey;
  late final List<int> _iv;

  Future<bool> init(Uint8List key, Uint8List iv) async {
    _aesCtr = AesCtr.with128bits(macAlgorithm: MacAlgorithm.empty);
    _secretKey = SecretKey(key);
    _iv = iv;
    return true;
  }

  Future<Uint8List> crypt(Uint8List data) async {
    final result = await _aesCtr.encrypt(
      data,
      secretKey: _secretKey,
      nonce: _iv,
    );
    return Uint8List.fromList(result.cipherText);
  }
}
