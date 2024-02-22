//
//  Generated code. Do not modify.
//  source: wifi_config.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use wiFiConfigMsgTypeDescriptor instead')
const WiFiConfigMsgType$json = {
  '1': 'WiFiConfigMsgType',
  '2': [
    {'1': 'TypeCmdGetStatus', '2': 0},
    {'1': 'TypeRespGetStatus', '2': 1},
    {'1': 'TypeCmdSetConfig', '2': 2},
    {'1': 'TypeRespSetConfig', '2': 3},
    {'1': 'TypeCmdApplyConfig', '2': 4},
    {'1': 'TypeRespApplyConfig', '2': 5},
  ],
};

/// Descriptor for `WiFiConfigMsgType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List wiFiConfigMsgTypeDescriptor = $convert.base64Decode(
    'ChFXaUZpQ29uZmlnTXNnVHlwZRIUChBUeXBlQ21kR2V0U3RhdHVzEAASFQoRVHlwZVJlc3BHZX'
    'RTdGF0dXMQARIUChBUeXBlQ21kU2V0Q29uZmlnEAISFQoRVHlwZVJlc3BTZXRDb25maWcQAxIW'
    'ChJUeXBlQ21kQXBwbHlDb25maWcQBBIXChNUeXBlUmVzcEFwcGx5Q29uZmlnEAU=');

@$core.Deprecated('Use cmdGetStatusDescriptor instead')
const CmdGetStatus$json = {
  '1': 'CmdGetStatus',
};

/// Descriptor for `CmdGetStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdGetStatusDescriptor = $convert.base64Decode(
    'CgxDbWRHZXRTdGF0dXM=');

@$core.Deprecated('Use respGetStatusDescriptor instead')
const RespGetStatus$json = {
  '1': 'RespGetStatus',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.esp.Status', '10': 'status'},
    {'1': 'sta_state', '3': 2, '4': 1, '5': 14, '6': '.esp.WifiStationState', '10': 'staState'},
    {'1': 'fail_reason', '3': 10, '4': 1, '5': 14, '6': '.esp.WifiConnectFailedReason', '9': 0, '10': 'failReason'},
    {'1': 'connected', '3': 11, '4': 1, '5': 11, '6': '.esp.WifiConnectedState', '9': 0, '10': 'connected'},
  ],
  '8': [
    {'1': 'state'},
  ],
};

/// Descriptor for `RespGetStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respGetStatusDescriptor = $convert.base64Decode(
    'Cg1SZXNwR2V0U3RhdHVzEiMKBnN0YXR1cxgBIAEoDjILLmVzcC5TdGF0dXNSBnN0YXR1cxIyCg'
    'lzdGFfc3RhdGUYAiABKA4yFS5lc3AuV2lmaVN0YXRpb25TdGF0ZVIIc3RhU3RhdGUSPwoLZmFp'
    'bF9yZWFzb24YCiABKA4yHC5lc3AuV2lmaUNvbm5lY3RGYWlsZWRSZWFzb25IAFIKZmFpbFJlYX'
    'NvbhI3Cgljb25uZWN0ZWQYCyABKAsyFy5lc3AuV2lmaUNvbm5lY3RlZFN0YXRlSABSCWNvbm5l'
    'Y3RlZEIHCgVzdGF0ZQ==');

@$core.Deprecated('Use cmdSetConfigDescriptor instead')
const CmdSetConfig$json = {
  '1': 'CmdSetConfig',
  '2': [
    {'1': 'ssid', '3': 1, '4': 1, '5': 12, '10': 'ssid'},
    {'1': 'passphrase', '3': 2, '4': 1, '5': 12, '10': 'passphrase'},
    {'1': 'bssid', '3': 3, '4': 1, '5': 12, '10': 'bssid'},
    {'1': 'channel', '3': 4, '4': 1, '5': 5, '10': 'channel'},
  ],
};

/// Descriptor for `CmdSetConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdSetConfigDescriptor = $convert.base64Decode(
    'CgxDbWRTZXRDb25maWcSEgoEc3NpZBgBIAEoDFIEc3NpZBIeCgpwYXNzcGhyYXNlGAIgASgMUg'
    'pwYXNzcGhyYXNlEhQKBWJzc2lkGAMgASgMUgVic3NpZBIYCgdjaGFubmVsGAQgASgFUgdjaGFu'
    'bmVs');

@$core.Deprecated('Use respSetConfigDescriptor instead')
const RespSetConfig$json = {
  '1': 'RespSetConfig',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.esp.Status', '10': 'status'},
  ],
};

/// Descriptor for `RespSetConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respSetConfigDescriptor = $convert.base64Decode(
    'Cg1SZXNwU2V0Q29uZmlnEiMKBnN0YXR1cxgBIAEoDjILLmVzcC5TdGF0dXNSBnN0YXR1cw==');

@$core.Deprecated('Use cmdApplyConfigDescriptor instead')
const CmdApplyConfig$json = {
  '1': 'CmdApplyConfig',
};

/// Descriptor for `CmdApplyConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdApplyConfigDescriptor = $convert.base64Decode(
    'Cg5DbWRBcHBseUNvbmZpZw==');

@$core.Deprecated('Use respApplyConfigDescriptor instead')
const RespApplyConfig$json = {
  '1': 'RespApplyConfig',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.esp.Status', '10': 'status'},
  ],
};

/// Descriptor for `RespApplyConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respApplyConfigDescriptor = $convert.base64Decode(
    'Cg9SZXNwQXBwbHlDb25maWcSIwoGc3RhdHVzGAEgASgOMgsuZXNwLlN0YXR1c1IGc3RhdHVz');

@$core.Deprecated('Use wiFiConfigPayloadDescriptor instead')
const WiFiConfigPayload$json = {
  '1': 'WiFiConfigPayload',
  '2': [
    {'1': 'msg', '3': 1, '4': 1, '5': 14, '6': '.esp.WiFiConfigMsgType', '10': 'msg'},
    {'1': 'cmd_get_status', '3': 10, '4': 1, '5': 11, '6': '.esp.CmdGetStatus', '9': 0, '10': 'cmdGetStatus'},
    {'1': 'resp_get_status', '3': 11, '4': 1, '5': 11, '6': '.esp.RespGetStatus', '9': 0, '10': 'respGetStatus'},
    {'1': 'cmd_set_config', '3': 12, '4': 1, '5': 11, '6': '.esp.CmdSetConfig', '9': 0, '10': 'cmdSetConfig'},
    {'1': 'resp_set_config', '3': 13, '4': 1, '5': 11, '6': '.esp.RespSetConfig', '9': 0, '10': 'respSetConfig'},
    {'1': 'cmd_apply_config', '3': 14, '4': 1, '5': 11, '6': '.esp.CmdApplyConfig', '9': 0, '10': 'cmdApplyConfig'},
    {'1': 'resp_apply_config', '3': 15, '4': 1, '5': 11, '6': '.esp.RespApplyConfig', '9': 0, '10': 'respApplyConfig'},
  ],
  '8': [
    {'1': 'payload'},
  ],
};

/// Descriptor for `WiFiConfigPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wiFiConfigPayloadDescriptor = $convert.base64Decode(
    'ChFXaUZpQ29uZmlnUGF5bG9hZBIoCgNtc2cYASABKA4yFi5lc3AuV2lGaUNvbmZpZ01zZ1R5cG'
    'VSA21zZxI5Cg5jbWRfZ2V0X3N0YXR1cxgKIAEoCzIRLmVzcC5DbWRHZXRTdGF0dXNIAFIMY21k'
    'R2V0U3RhdHVzEjwKD3Jlc3BfZ2V0X3N0YXR1cxgLIAEoCzISLmVzcC5SZXNwR2V0U3RhdHVzSA'
    'BSDXJlc3BHZXRTdGF0dXMSOQoOY21kX3NldF9jb25maWcYDCABKAsyES5lc3AuQ21kU2V0Q29u'
    'ZmlnSABSDGNtZFNldENvbmZpZxI8Cg9yZXNwX3NldF9jb25maWcYDSABKAsyEi5lc3AuUmVzcF'
    'NldENvbmZpZ0gAUg1yZXNwU2V0Q29uZmlnEj8KEGNtZF9hcHBseV9jb25maWcYDiABKAsyEy5l'
    'c3AuQ21kQXBwbHlDb25maWdIAFIOY21kQXBwbHlDb25maWcSQgoRcmVzcF9hcHBseV9jb25maW'
    'cYDyABKAsyFC5lc3AuUmVzcEFwcGx5Q29uZmlnSABSD3Jlc3BBcHBseUNvbmZpZ0IJCgdwYXls'
    'b2Fk');

