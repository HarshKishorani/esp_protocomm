import 'package:flutter_blue_plus/flutter_blue_plus.dart';

/// Represents a discovered BLE Device.
class DeviceInfo {
  final String name;
  final Map<String, dynamic> manufacturerData;
  final BluetoothDevice device;

  DeviceInfo({
    required this.name,
    required this.manufacturerData,
    required this.device,
  });
}
