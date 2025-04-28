import 'dart:async';
import 'dart:io';

import '../esp/esp_security1.dart';
import '../esp/esp_session.dart';
import '../esp/esp_transport_methods.dart';
import 'esp_local_control_api_manager.dart';
import 'package:flutter/material.dart';
import 'package:multicast_dns/multicast_dns.dart';

/// Entry point for local control.
class LocalControl {
  static const String _serviceType = '_esp_local_ctrl._tcp.local';

  final MDnsClient _client = MDnsClient(rawDatagramSocketFactory: (dynamic host, int port,
      {bool reuseAddress = true, bool reusePort = false, int ttl = 1}) {
    return RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
  });

  final String deviceId;

  /// The IP address and port number of the device once
  /// discovered.
  IPAndPort? get deviceAddress {
    return _ipAndPort;
  }

  IPAndPort? _ipAndPort;
  late Timer _checkingTimer;
  EstablishSessionStatus localControlSessionStatus = EstablishSessionStatus.disconnected;
  late MDNSApiManager _apiManager;

  /// Creates object for local control and starts polling timer.
  ///
  /// The [scanningPeriod] is how often the service will try to find
  /// the Rainmaker device. If [stopScanOnSuccess] is true, the polling
  /// will stop upon first successfully finding the IP and port.
  LocalControl(this.deviceId);

  void startService(
      [Duration scanningPeriod = const Duration(seconds: 15),
      bool stopScanOnSuccess = true]) async {
    localControlSessionStatus = EstablishSessionStatus.disconnected;
    _checkingTimer = Timer.periodic(scanningPeriod, (timer) async {
      final tmpIp = await _getDeviceIP();
      if (tmpIp != null) {
        _ipAndPort = tmpIp;

        if (stopScanOnSuccess) {
          timer.cancel();
          _client.stop();
        }

        // Establish session after the device is found.
        localControlSessionStatus = await establishSession();
        if (localControlSessionStatus != EstablishSessionStatus.connected) {
          startService();
        } else {
          // ref.notifyListeners();
          // Handle Connected success
        }
      }
    });
  }

  /// Releases resources used by this object.
  void dispose() {
    localControlSessionStatus = EstablishSessionStatus.disconnected;

    try {
      _checkingTimer.cancel();
    } catch (e) {
      print("Error disposing local control for $deviceId, $e");
    }

    try {
      _client.stop();
    } catch (e) {
      print("Error disposing local control for $deviceId, $e");
    }

    try {
      _apiManager.dispose();
    } catch (e) {
      print("Error disposing local control for $deviceId, $e");
    }
  }

  Future<IPAndPort?> _getDeviceIP() async {
    try {
      // await _clientStart;
      await _client.start();

      print('Searching..... $_serviceType. device ID : $deviceId');

      await for (PtrResourceRecord ptr
          in _client.lookup<PtrResourceRecord>(ResourceRecordQuery.serverPointer(_serviceType))) {
        await for (SrvResourceRecord srv
            in _client.lookup<SrvResourceRecord>(ResourceRecordQuery.service(ptr.domainName))) {
          if (deviceId == srv.target.split('.').first) {
            print(
                'ESP Local found for device ID : $deviceId at ${srv.target}:${srv.port} for "${ptr.domainName}".');
            await for (IPAddressResourceRecord ip in _client
                .lookup<IPAddressResourceRecord>(ResourceRecordQuery.addressIPv4(srv.target))) {
              _client.stop();
              return IPAndPort(
                ip: ip.address.address,
                port: srv.port,
              );
            }
          } else {
            print('Could\'nt find ESP Local found for device ID : $deviceId. Retrying.......');
          }
        }
      }
    } catch (e) {
      print('Error while Searching for Device : $e');
      return null;
    }
    return null;
  }

  /// Establishes session with the Device.
  ///
  /// If [forceDeviceCheck] is set to true the function will forcibly poll
  /// for the device regardless of whether it was previously
  /// discovered.
  ///
  /// Throws a `LocalControlUnavailable` exception if the device address
  /// if not known.
  Future<EstablishSessionStatus> establishSession([bool forceDeviceCheck = false]) async {
    if (forceDeviceCheck) {
      final tmpIp = await _getDeviceIP();
      if (tmpIp != null) {
        _ipAndPort = tmpIp;
      }
    }
    if (_ipAndPort == null) {
      throw const LocalControlUnavailable();
    }
    final ip = _ipAndPort!.ip;
    final port = _ipAndPort!.port;
    _apiManager = MDNSApiManager(
        transport: TransportHTTP(hostname: '$ip:$port'), security: Security1(pop: "abcd1234"));
    return await _apiManager.establishSession();
  }

  /// Obtains the node configuration.
  ///
  /// If [forceDeviceCheck] is set to true the function will forcibly poll
  /// for the device regardless of whether it was previously
  /// discovered.
  ///
  /// Throws a `LocalControlUnavailable` exception if the device address
  /// if not known.
  Future<Map<String, dynamic>> getNodeDetails([bool forceDeviceCheck = false]) async {
    if (forceDeviceCheck) {
      final tmpIp = await _getDeviceIP();
      if (tmpIp != null) {
        _ipAndPort = tmpIp;
      }
    }

    if (_ipAndPort == null) {
      throw const LocalControlUnavailable();
    }

    return _apiManager.getNodeDetails();
  }

  /// Obtains the device parameters.
  ///
  /// If [forceDeviceCheck] is set to true the function will forcibly poll
  /// for the device regardless of whether it was previously
  /// discovered.
  ///
  /// Throws a `LocalControlUnavailable` exception if the device address
  /// if not known.
  Future<Map<String, dynamic>> getParamsValues([bool forceDeviceCheck = false]) async {
    if (forceDeviceCheck) {
      final tmpIp = await _getDeviceIP();
      if (tmpIp != null) {
        _ipAndPort = tmpIp;
      }
    }

    if (_ipAndPort == null) {
      throw const LocalControlUnavailable();
    }

    return _apiManager.getParamsValues();
  }

  /// Sets the device parameters.
  ///
  /// If [forceDeviceCheck] is set to true the function will forcibly poll
  /// for the device regardless of whether it was previously
  /// discovered.
  ///
  /// Throws a `LocalControlUnavailable` exception if the device address
  /// if not known.
  Future<void> updateParamValue(Map<String, dynamic> body, [bool forceDeviceCheck = false]) async {
    if (forceDeviceCheck) {
      final tmpIp = await _getDeviceIP();
      if (tmpIp != null) {
        _ipAndPort = tmpIp;
      }
    }

    if (_ipAndPort == null) {
      throw const LocalControlUnavailable();
    }

    return _apiManager.updateParamValue(body);
  }
}

@immutable
class IPAndPort {
  /// The IP address of the device.
  final String ip;

  /// The port number of the device.
  final int port;

  const IPAndPort({
    required this.ip,
    required this.port,
  });

  String get baseUrl {
    return 'http://$ip:$port';
  }

  @override
  String toString() {
    return 'IPAndPort{IP: $ip, Port: $port}';
  }
}

abstract class LocalControlException implements Exception {
  final String frontFacingText;

  const LocalControlException(this.frontFacingText);

  @override
  String toString();
}

class LocalControlUnavailable extends LocalControlException {
  const LocalControlUnavailable() : super('No local device found');

  @override
  String toString() => 'LocalControlUnavailable: ${super.frontFacingText}';
}

class LocalControlFailed extends LocalControlException {
  const LocalControlFailed() : super('There was a problem with local control');

  @override
  String toString() => 'LocalControlFailed: ${super.frontFacingText}';
}
