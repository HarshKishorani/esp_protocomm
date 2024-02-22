//
//  Generated code. Do not modify.
//  source: sec2.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sec2MsgTypeDescriptor instead')
const Sec2MsgType$json = {
  '1': 'Sec2MsgType',
  '2': [
    {'1': 'S2Session_Command0', '2': 0},
    {'1': 'S2Session_Response0', '2': 1},
    {'1': 'S2Session_Command1', '2': 2},
    {'1': 'S2Session_Response1', '2': 3},
  ],
};

/// Descriptor for `Sec2MsgType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sec2MsgTypeDescriptor = $convert.base64Decode(
    'CgtTZWMyTXNnVHlwZRIWChJTMlNlc3Npb25fQ29tbWFuZDAQABIXChNTMlNlc3Npb25fUmVzcG'
    '9uc2UwEAESFgoSUzJTZXNzaW9uX0NvbW1hbmQxEAISFwoTUzJTZXNzaW9uX1Jlc3BvbnNlMRAD');

@$core.Deprecated('Use s2SessionCmd0Descriptor instead')
const S2SessionCmd0$json = {
  '1': 'S2SessionCmd0',
  '2': [
    {'1': 'client_username', '3': 1, '4': 1, '5': 12, '10': 'clientUsername'},
    {'1': 'client_pubkey', '3': 2, '4': 1, '5': 12, '10': 'clientPubkey'},
  ],
};

/// Descriptor for `S2SessionCmd0`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2SessionCmd0Descriptor = $convert.base64Decode(
    'Cg1TMlNlc3Npb25DbWQwEicKD2NsaWVudF91c2VybmFtZRgBIAEoDFIOY2xpZW50VXNlcm5hbW'
    'USIwoNY2xpZW50X3B1YmtleRgCIAEoDFIMY2xpZW50UHVia2V5');

@$core.Deprecated('Use s2SessionResp0Descriptor instead')
const S2SessionResp0$json = {
  '1': 'S2SessionResp0',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.local_ctrl.Status', '10': 'status'},
    {'1': 'device_pubkey', '3': 2, '4': 1, '5': 12, '10': 'devicePubkey'},
    {'1': 'device_salt', '3': 3, '4': 1, '5': 12, '10': 'deviceSalt'},
  ],
};

/// Descriptor for `S2SessionResp0`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2SessionResp0Descriptor = $convert.base64Decode(
    'Cg5TMlNlc3Npb25SZXNwMBIqCgZzdGF0dXMYASABKA4yEi5sb2NhbF9jdHJsLlN0YXR1c1IGc3'
    'RhdHVzEiMKDWRldmljZV9wdWJrZXkYAiABKAxSDGRldmljZVB1YmtleRIfCgtkZXZpY2Vfc2Fs'
    'dBgDIAEoDFIKZGV2aWNlU2FsdA==');

@$core.Deprecated('Use s2SessionCmd1Descriptor instead')
const S2SessionCmd1$json = {
  '1': 'S2SessionCmd1',
  '2': [
    {'1': 'client_proof', '3': 1, '4': 1, '5': 12, '10': 'clientProof'},
  ],
};

/// Descriptor for `S2SessionCmd1`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2SessionCmd1Descriptor = $convert.base64Decode(
    'Cg1TMlNlc3Npb25DbWQxEiEKDGNsaWVudF9wcm9vZhgBIAEoDFILY2xpZW50UHJvb2Y=');

@$core.Deprecated('Use s2SessionResp1Descriptor instead')
const S2SessionResp1$json = {
  '1': 'S2SessionResp1',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.local_ctrl.Status', '10': 'status'},
    {'1': 'device_proof', '3': 2, '4': 1, '5': 12, '10': 'deviceProof'},
    {'1': 'device_nonce', '3': 3, '4': 1, '5': 12, '10': 'deviceNonce'},
  ],
};

/// Descriptor for `S2SessionResp1`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2SessionResp1Descriptor = $convert.base64Decode(
    'Cg5TMlNlc3Npb25SZXNwMRIqCgZzdGF0dXMYASABKA4yEi5sb2NhbF9jdHJsLlN0YXR1c1IGc3'
    'RhdHVzEiEKDGRldmljZV9wcm9vZhgCIAEoDFILZGV2aWNlUHJvb2YSIQoMZGV2aWNlX25vbmNl'
    'GAMgASgMUgtkZXZpY2VOb25jZQ==');

@$core.Deprecated('Use sec2PayloadDescriptor instead')
const Sec2Payload$json = {
  '1': 'Sec2Payload',
  '2': [
    {'1': 'msg', '3': 1, '4': 1, '5': 14, '6': '.local_ctrl.Sec2MsgType', '10': 'msg'},
    {'1': 'sc0', '3': 20, '4': 1, '5': 11, '6': '.local_ctrl.S2SessionCmd0', '9': 0, '10': 'sc0'},
    {'1': 'sr0', '3': 21, '4': 1, '5': 11, '6': '.local_ctrl.S2SessionResp0', '9': 0, '10': 'sr0'},
    {'1': 'sc1', '3': 22, '4': 1, '5': 11, '6': '.local_ctrl.S2SessionCmd1', '9': 0, '10': 'sc1'},
    {'1': 'sr1', '3': 23, '4': 1, '5': 11, '6': '.local_ctrl.S2SessionResp1', '9': 0, '10': 'sr1'},
  ],
  '8': [
    {'1': 'payload'},
  ],
};

/// Descriptor for `Sec2Payload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sec2PayloadDescriptor = $convert.base64Decode(
    'CgtTZWMyUGF5bG9hZBIpCgNtc2cYASABKA4yFy5sb2NhbF9jdHJsLlNlYzJNc2dUeXBlUgNtc2'
    'cSLQoDc2MwGBQgASgLMhkubG9jYWxfY3RybC5TMlNlc3Npb25DbWQwSABSA3NjMBIuCgNzcjAY'
    'FSABKAsyGi5sb2NhbF9jdHJsLlMyU2Vzc2lvblJlc3AwSABSA3NyMBItCgNzYzEYFiABKAsyGS'
    '5sb2NhbF9jdHJsLlMyU2Vzc2lvbkNtZDFIAFIDc2MxEi4KA3NyMRgXIAEoCzIaLmxvY2FsX2N0'
    'cmwuUzJTZXNzaW9uUmVzcDFIAFIDc3IxQgkKB3BheWxvYWQ=');

