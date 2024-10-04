import 'dart:convert';
import 'dart:typed_data';
import '../esp/esp_transport.dart';
import '../esp/esp_session.dart';
import '../esp/proto/constants.pbenum.dart';
import '../esp/proto/esp_local_ctrl.pb.dart';
import '../esp/proto/session.pb.dart';
import '../esp/esp_security.dart';
import 'esp_local_control_base.dart';
import 'package:isolate_json/isolate_json.dart';
import 'package:protobuf/protobuf.dart';

class MDNSApiManager {
  static const String controlPath = 'esp_local_ctrl/control';
  static const String sessionPath = 'esp_local_ctrl/session';
  Transport transport;
  Security security;

  MDNSApiManager({required this.security, required this.transport});

  void dispose() async {
    await transport.disconnect();
  }

  Future<EstablishSessionStatus> establishSession() async {
    try {
      SessionData? responseData;
      await transport.connect();
      while (true) {
        var request = await security.securitySession(responseData);
        if (request == null) {
          return EstablishSessionStatus.connected;
        }
        var response = await transport.sendReceive(sessionPath, request.writeToBuffer());
        if (response.isEmpty) {
          throw Exception('Empty response');
        }
        responseData = SessionData.fromBuffer(response);
      }
    } catch (e) {
      print('-----------------------');
      print('EstablishSession Error:');
      print('$e');
      print('-----------------------');
      return EstablishSessionStatus.disconnected;
    }
  }

  Future<Map<String, dynamic>> getNodeDetails() async {
    final count = await getPropertyCount(controlPath);
    final data = await getPropertyValues(controlPath, count);
    return data['config'];
  }

  Future<Map<String, dynamic>> getParamsValues() async {
    final count = await getPropertyCount(controlPath);
    final data = await getPropertyValues(controlPath, count);
    return data['params'];
  }

  Future<void> updateParamValue(Map<String, dynamic> body) async {
    final jsonData = await JsonIsolate().encodeJson(body);
    final data = _createSetPropertyInfoRequest(jsonData);

    final encryptedData = await security.encrypt(data); //* Encrypt data

    Uint8List returnData = await transport.sendReceive(controlPath, encryptedData);

    returnData = await security.decrypt(returnData); //* Decrypt data

    final response = LocalCtrlMessage.fromBuffer(returnData);
    final status = response.respSetPropVals.status;

    if (status == Status.Success) {
      return;
    } else {
      throw const LocalControlFailed();
    }
  }

  Future<int> getPropertyCount(String controlPath) async {
    final data = _createGetPropertyCountRequest();

    final encryptedData = await security.encrypt(data); //* Encrypt data

    final returnData = await transport.sendReceive(controlPath, encryptedData);
    final count = _processGetPropertyCount(returnData);
    return count;
  }

  Future<Map<String, dynamic>> getPropertyValues(String controlPath, int count) async {
    final data = _createGetAllPropertyValuesRequest(count);

    final encryptedData = await security.encrypt(data); //* Encrypt data

    final returnData = await transport.sendReceive(controlPath, encryptedData);
    return await _processGetPropertyValue(returnData);
  }

  Uint8List _createGetPropertyCountRequest() {
    const msgType = LocalCtrlMsgType.TypeCmdGetPropertyCount;
    final msg = LocalCtrlMessage()
      ..msg = msgType
      ..cmdGetPropCount = CmdGetPropertyCount();

    return msg.writeToBuffer();
  }

  Uint8List _createSetPropertyInfoRequest(String jsonData) {
    const msgType = LocalCtrlMsgType.TypeCmdSetPropertyValues;
    final prop = PropertyValue()
      ..index = 1
      ..value = utf8.encode(jsonData);

    final payload = CmdSetPropertyValues()..props.add(prop);

    final msg = LocalCtrlMessage()
      ..msg = msgType
      ..cmdSetPropVals = payload;

    return msg.writeToBuffer();
  }

  Uint8List _createGetAllPropertyValuesRequest(int count) {
    final indices = List.generate(count, (index) => index);

    const msgType = LocalCtrlMsgType.TypeCmdGetPropertyValues;
    final payload = CmdGetPropertyValues()..indices.addAll(indices);

    final msg = LocalCtrlMessage()
      ..msg = msgType
      ..cmdGetPropVals = payload;

    return msg.writeToBuffer();
  }

  Future<int> _processGetPropertyCount(Uint8List returnData) async {
    var count = 0;

    try {
      returnData = await security.decrypt(returnData); //* Decrypt data
      final response = LocalCtrlMessage.fromBuffer(returnData);

      if (response.respGetPropCount.status == Status.Success) {
        count = response.respGetPropCount.count;
      }
    } on InvalidProtocolBufferException catch (e) {
      print(e.toString());
      throw const LocalControlFailed();
    }
    return count;
  }

  Future<Map<String, dynamic>> _processGetPropertyValue(Uint8List returnData) async {
    try {
      returnData = await security.decrypt(returnData); //* Decrypt data
      final response = LocalCtrlMessage.fromBuffer(returnData);

      if (response.respGetPropVals.status == Status.Success) {
        final propertyInfoList = response.respGetPropVals.props;

        final bundle = <String, dynamic>{};

        for (final propertyInfo in propertyInfoList) {
          final strFromBytes = utf8.decode(propertyInfo.value, allowMalformed: true);
          bundle[propertyInfo.name] = await JsonIsolate().decodeJson(strFromBytes);
        }
        return bundle;
      } else {
        throw const LocalControlFailed();
      }
    } on InvalidProtocolBufferException catch (e) {
      print(e.toString());
      throw const LocalControlFailed();
    }
  }
}
