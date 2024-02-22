import 'dart:async';
import 'dart:io';

import 'package:aulee/device_control/esp/esp_session.dart';
import 'package:aulee/device_control/esp_local_ctrl/esp_local_control_api_manager.dart';
import 'package:aulee/device_control/esp/esp_security1.dart';
import 'package:aulee/device_control/esp/esp_transport_methods.dart';
import 'package:flutter/material.dart';
import 'package:multicast_dns/multicast_dns.dart';

/// Entry point for local control.
class LocalControl {
  static const String _serviceType = '_esp_local_ctrl._tcp.local';

  final MDnsClient _client = MDnsClient(rawDatagramSocketFactory: (dynamic host, int port,
      {bool reuseAddress = true, bool reusePort = false, int ttl = 1}) {
    return RawDatagramSocket.bind(host, port, reuseAddress: true, reusePort: false, ttl: ttl);
  });

  /// Rainmaker ID of the device to locally control.
  final String deviceId;

  /// The IP address and port number of the device once
  /// discovered.
  IPAndPort? get deviceAddress {
    return _ipAndPort;
  }

  IPAndPort? _ipAndPort;
  late final Timer _checkingTimer;
  late final Future<void> _clientStart;

  late MDNSApiManager _apiManager;

  /// Creates object for local control and starts polling timer.
  ///
  /// The [scanningPeriod] is how often the service will try to find
  /// the Rainmaker device. If [stopScanOnSuccess] is true, the polling
  /// will stop upon first successfully finding the IP and port.
  LocalControl(this.deviceId,
      [Duration scanningPeriod = const Duration(seconds: 15), bool stopScanOnSuccess = true]) {
    _clientStart = _client.start();

    _checkingTimer = Timer.periodic(scanningPeriod, (timer) async {
      final tmpIp = await _getDeviceIP();
      //debugPrint(tmpIp);
      if (tmpIp != null) {
        _ipAndPort = tmpIp;

        if (stopScanOnSuccess) {
          timer.cancel();
          _client.stop();
        }
      }
    });
  }

  /// Releases resources used by this object.
  void dispose() {
    _checkingTimer.cancel();
    _client.stop();
    _apiManager.dispose();
  }

  Future<IPAndPort?> _getDeviceIP() async {
    try {
      await _clientStart;
      debugPrint('Starting..... $_serviceType.');

      await for (PtrResourceRecord ptr
          in _client.lookup<PtrResourceRecord>(ResourceRecordQuery.serverPointer(_serviceType))) {
        await for (SrvResourceRecord srv
            in _client.lookup<SrvResourceRecord>(ResourceRecordQuery.service(ptr.domainName))) {
          // TODO : Lool for deviceId
          debugPrint('ESP Local found at ${srv.target}:${srv.port} for "${ptr.domainName}".');
          await for (IPAddressResourceRecord ip in _client
              .lookup<IPAddressResourceRecord>(ResourceRecordQuery.addressIPv4(srv.target))) {
            _client.stop();
            debugPrint(ip.address.address);
            return IPAndPort(
              ip: ip.address.address,
              port: srv.port,
            );
          }
        }
      }
    } catch (e) {
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
      throw LocalControlUnavailable();
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
      throw LocalControlUnavailable();
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
      throw LocalControlUnavailable();
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
