//
//  Generated code. Do not modify.
//  source: session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use secSchemeVersionDescriptor instead')
const SecSchemeVersion$json = {
  '1': 'SecSchemeVersion',
  '2': [
    {'1': 'SecScheme0', '2': 0},
    {'1': 'SecScheme1', '2': 1},
    {'1': 'SecScheme2', '2': 2},
  ],
};

/// Descriptor for `SecSchemeVersion`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List secSchemeVersionDescriptor = $convert.base64Decode(
    'ChBTZWNTY2hlbWVWZXJzaW9uEg4KClNlY1NjaGVtZTAQABIOCgpTZWNTY2hlbWUxEAESDgoKU2'
    'VjU2NoZW1lMhAC');

@$core.Deprecated('Use sessionDataDescriptor instead')
const SessionData$json = {
  '1': 'SessionData',
  '2': [
    {
      '1': 'sec_ver',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.local_ctrl.SecSchemeVersion',
      '10': 'secVer'
    },
    {
      '1': 'sec0',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.local_ctrl.Sec0Payload',
      '9': 0,
      '10': 'sec0'
    },
    {
      '1': 'sec1',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.local_ctrl.Sec1Payload',
      '9': 0,
      '10': 'sec1'
    },
    {
      '1': 'sec2',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.local_ctrl.Sec2Payload',
      '9': 0,
      '10': 'sec2'
    },
  ],
  '8': [
    {'1': 'proto'},
  ],
};

/// Descriptor for `SessionData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDataDescriptor = $convert.base64Decode(
    'CgtTZXNzaW9uRGF0YRI1CgdzZWNfdmVyGAIgASgOMhwubG9jYWxfY3RybC5TZWNTY2hlbWVWZX'
    'JzaW9uUgZzZWNWZXISLQoEc2VjMBgKIAEoCzIXLmxvY2FsX2N0cmwuU2VjMFBheWxvYWRIAFIE'
    'c2VjMBItCgRzZWMxGAsgASgLMhcubG9jYWxfY3RybC5TZWMxUGF5bG9hZEgAUgRzZWMxEi0KBH'
    'NlYzIYDCABKAsyFy5sb2NhbF9jdHJsLlNlYzJQYXlsb2FkSABSBHNlYzJCBwoFcHJvdG8=');
