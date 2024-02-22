//
//  Generated code. Do not modify.
//  source: esp_local_ctrl.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use localCtrlMsgTypeDescriptor instead')
const LocalCtrlMsgType$json = {
  '1': 'LocalCtrlMsgType',
  '2': [
    {'1': 'TypeCmdGetPropertyCount', '2': 0},
    {'1': 'TypeRespGetPropertyCount', '2': 1},
    {'1': 'TypeCmdGetPropertyValues', '2': 4},
    {'1': 'TypeRespGetPropertyValues', '2': 5},
    {'1': 'TypeCmdSetPropertyValues', '2': 6},
    {'1': 'TypeRespSetPropertyValues', '2': 7},
  ],
};

/// Descriptor for `LocalCtrlMsgType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List localCtrlMsgTypeDescriptor = $convert.base64Decode(
    'ChBMb2NhbEN0cmxNc2dUeXBlEhsKF1R5cGVDbWRHZXRQcm9wZXJ0eUNvdW50EAASHAoYVHlwZV'
    'Jlc3BHZXRQcm9wZXJ0eUNvdW50EAESHAoYVHlwZUNtZEdldFByb3BlcnR5VmFsdWVzEAQSHQoZ'
    'VHlwZVJlc3BHZXRQcm9wZXJ0eVZhbHVlcxAFEhwKGFR5cGVDbWRTZXRQcm9wZXJ0eVZhbHVlcx'
    'AGEh0KGVR5cGVSZXNwU2V0UHJvcGVydHlWYWx1ZXMQBw==');

@$core.Deprecated('Use cmdGetPropertyCountDescriptor instead')
const CmdGetPropertyCount$json = {
  '1': 'CmdGetPropertyCount',
};

/// Descriptor for `CmdGetPropertyCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdGetPropertyCountDescriptor = $convert.base64Decode(
    'ChNDbWRHZXRQcm9wZXJ0eUNvdW50');

@$core.Deprecated('Use respGetPropertyCountDescriptor instead')
const RespGetPropertyCount$json = {
  '1': 'RespGetPropertyCount',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.local_ctrl.Status', '10': 'status'},
    {'1': 'count', '3': 2, '4': 1, '5': 13, '10': 'count'},
  ],
};

/// Descriptor for `RespGetPropertyCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respGetPropertyCountDescriptor = $convert.base64Decode(
    'ChRSZXNwR2V0UHJvcGVydHlDb3VudBIqCgZzdGF0dXMYASABKA4yEi5sb2NhbF9jdHJsLlN0YX'
    'R1c1IGc3RhdHVzEhQKBWNvdW50GAIgASgNUgVjb3VudA==');

@$core.Deprecated('Use propertyInfoDescriptor instead')
const PropertyInfo$json = {
  '1': 'PropertyInfo',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.local_ctrl.Status', '10': 'status'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 13, '10': 'type'},
    {'1': 'flags', '3': 4, '4': 1, '5': 13, '10': 'flags'},
    {'1': 'value', '3': 5, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `PropertyInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List propertyInfoDescriptor = $convert.base64Decode(
    'CgxQcm9wZXJ0eUluZm8SKgoGc3RhdHVzGAEgASgOMhIubG9jYWxfY3RybC5TdGF0dXNSBnN0YX'
    'R1cxISCgRuYW1lGAIgASgJUgRuYW1lEhIKBHR5cGUYAyABKA1SBHR5cGUSFAoFZmxhZ3MYBCAB'
    'KA1SBWZsYWdzEhQKBXZhbHVlGAUgASgMUgV2YWx1ZQ==');

@$core.Deprecated('Use cmdGetPropertyValuesDescriptor instead')
const CmdGetPropertyValues$json = {
  '1': 'CmdGetPropertyValues',
  '2': [
    {'1': 'indices', '3': 1, '4': 3, '5': 13, '10': 'indices'},
  ],
};

/// Descriptor for `CmdGetPropertyValues`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdGetPropertyValuesDescriptor = $convert.base64Decode(
    'ChRDbWRHZXRQcm9wZXJ0eVZhbHVlcxIYCgdpbmRpY2VzGAEgAygNUgdpbmRpY2Vz');

@$core.Deprecated('Use respGetPropertyValuesDescriptor instead')
const RespGetPropertyValues$json = {
  '1': 'RespGetPropertyValues',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.local_ctrl.Status', '10': 'status'},
    {'1': 'props', '3': 2, '4': 3, '5': 11, '6': '.local_ctrl.PropertyInfo', '10': 'props'},
  ],
};

/// Descriptor for `RespGetPropertyValues`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respGetPropertyValuesDescriptor = $convert.base64Decode(
    'ChVSZXNwR2V0UHJvcGVydHlWYWx1ZXMSKgoGc3RhdHVzGAEgASgOMhIubG9jYWxfY3RybC5TdG'
    'F0dXNSBnN0YXR1cxIuCgVwcm9wcxgCIAMoCzIYLmxvY2FsX2N0cmwuUHJvcGVydHlJbmZvUgVw'
    'cm9wcw==');

@$core.Deprecated('Use propertyValueDescriptor instead')
const PropertyValue$json = {
  '1': 'PropertyValue',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 13, '10': 'index'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `PropertyValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List propertyValueDescriptor = $convert.base64Decode(
    'Cg1Qcm9wZXJ0eVZhbHVlEhQKBWluZGV4GAEgASgNUgVpbmRleBIUCgV2YWx1ZRgCIAEoDFIFdm'
    'FsdWU=');

@$core.Deprecated('Use cmdSetPropertyValuesDescriptor instead')
const CmdSetPropertyValues$json = {
  '1': 'CmdSetPropertyValues',
  '2': [
    {'1': 'props', '3': 1, '4': 3, '5': 11, '6': '.local_ctrl.PropertyValue', '10': 'props'},
  ],
};

/// Descriptor for `CmdSetPropertyValues`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdSetPropertyValuesDescriptor = $convert.base64Decode(
    'ChRDbWRTZXRQcm9wZXJ0eVZhbHVlcxIvCgVwcm9wcxgBIAMoCzIZLmxvY2FsX2N0cmwuUHJvcG'
    'VydHlWYWx1ZVIFcHJvcHM=');

@$core.Deprecated('Use respSetPropertyValuesDescriptor instead')
const RespSetPropertyValues$json = {
  '1': 'RespSetPropertyValues',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.local_ctrl.Status', '10': 'status'},
  ],
};

/// Descriptor for `RespSetPropertyValues`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respSetPropertyValuesDescriptor = $convert.base64Decode(
    'ChVSZXNwU2V0UHJvcGVydHlWYWx1ZXMSKgoGc3RhdHVzGAEgASgOMhIubG9jYWxfY3RybC5TdG'
    'F0dXNSBnN0YXR1cw==');

@$core.Deprecated('Use localCtrlMessageDescriptor instead')
const LocalCtrlMessage$json = {
  '1': 'LocalCtrlMessage',
  '2': [
    {'1': 'msg', '3': 1, '4': 1, '5': 14, '6': '.local_ctrl.LocalCtrlMsgType', '10': 'msg'},
    {'1': 'cmd_get_prop_count', '3': 10, '4': 1, '5': 11, '6': '.local_ctrl.CmdGetPropertyCount', '9': 0, '10': 'cmdGetPropCount'},
    {'1': 'resp_get_prop_count', '3': 11, '4': 1, '5': 11, '6': '.local_ctrl.RespGetPropertyCount', '9': 0, '10': 'respGetPropCount'},
    {'1': 'cmd_get_prop_vals', '3': 12, '4': 1, '5': 11, '6': '.local_ctrl.CmdGetPropertyValues', '9': 0, '10': 'cmdGetPropVals'},
    {'1': 'resp_get_prop_vals', '3': 13, '4': 1, '5': 11, '6': '.local_ctrl.RespGetPropertyValues', '9': 0, '10': 'respGetPropVals'},
    {'1': 'cmd_set_prop_vals', '3': 14, '4': 1, '5': 11, '6': '.local_ctrl.CmdSetPropertyValues', '9': 0, '10': 'cmdSetPropVals'},
    {'1': 'resp_set_prop_vals', '3': 15, '4': 1, '5': 11, '6': '.local_ctrl.RespSetPropertyValues', '9': 0, '10': 'respSetPropVals'},
  ],
  '8': [
    {'1': 'payload'},
  ],
};

/// Descriptor for `LocalCtrlMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List localCtrlMessageDescriptor = $convert.base64Decode(
    'ChBMb2NhbEN0cmxNZXNzYWdlEi4KA21zZxgBIAEoDjIcLmxvY2FsX2N0cmwuTG9jYWxDdHJsTX'
    'NnVHlwZVIDbXNnEk4KEmNtZF9nZXRfcHJvcF9jb3VudBgKIAEoCzIfLmxvY2FsX2N0cmwuQ21k'
    'R2V0UHJvcGVydHlDb3VudEgAUg9jbWRHZXRQcm9wQ291bnQSUQoTcmVzcF9nZXRfcHJvcF9jb3'
    'VudBgLIAEoCzIgLmxvY2FsX2N0cmwuUmVzcEdldFByb3BlcnR5Q291bnRIAFIQcmVzcEdldFBy'
    'b3BDb3VudBJNChFjbWRfZ2V0X3Byb3BfdmFscxgMIAEoCzIgLmxvY2FsX2N0cmwuQ21kR2V0UH'
    'JvcGVydHlWYWx1ZXNIAFIOY21kR2V0UHJvcFZhbHMSUAoScmVzcF9nZXRfcHJvcF92YWxzGA0g'
    'ASgLMiEubG9jYWxfY3RybC5SZXNwR2V0UHJvcGVydHlWYWx1ZXNIAFIPcmVzcEdldFByb3BWYW'
    'xzEk0KEWNtZF9zZXRfcHJvcF92YWxzGA4gASgLMiAubG9jYWxfY3RybC5DbWRTZXRQcm9wZXJ0'
    'eVZhbHVlc0gAUg5jbWRTZXRQcm9wVmFscxJQChJyZXNwX3NldF9wcm9wX3ZhbHMYDyABKAsyIS'
    '5sb2NhbF9jdHJsLlJlc3BTZXRQcm9wZXJ0eVZhbHVlc0gAUg9yZXNwU2V0UHJvcFZhbHNCCQoH'
    'cGF5bG9hZA==');

