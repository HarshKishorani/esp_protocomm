//
//  Generated code. Do not modify.
//  source: sec2.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// A message must be of type Cmd0 / Cmd1 / Resp0 / Resp1
class Sec2MsgType extends $pb.ProtobufEnum {
  static const Sec2MsgType S2Session_Command0 =
      Sec2MsgType._(0, _omitEnumNames ? '' : 'S2Session_Command0');
  static const Sec2MsgType S2Session_Response0 =
      Sec2MsgType._(1, _omitEnumNames ? '' : 'S2Session_Response0');
  static const Sec2MsgType S2Session_Command1 =
      Sec2MsgType._(2, _omitEnumNames ? '' : 'S2Session_Command1');
  static const Sec2MsgType S2Session_Response1 =
      Sec2MsgType._(3, _omitEnumNames ? '' : 'S2Session_Response1');

  static const $core.List<Sec2MsgType> values = <Sec2MsgType>[
    S2Session_Command0,
    S2Session_Response0,
    S2Session_Command1,
    S2Session_Response1,
  ];

  static final $core.Map<$core.int, Sec2MsgType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Sec2MsgType? valueOf($core.int value) => _byValue[value];

  const Sec2MsgType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
