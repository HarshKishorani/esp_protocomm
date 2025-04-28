//
//  Generated code. Do not modify.
//  source: esp_local_ctrl.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LocalCtrlMsgType extends $pb.ProtobufEnum {
  static const LocalCtrlMsgType TypeCmdGetPropertyCount =
      LocalCtrlMsgType._(0, _omitEnumNames ? '' : 'TypeCmdGetPropertyCount');
  static const LocalCtrlMsgType TypeRespGetPropertyCount =
      LocalCtrlMsgType._(1, _omitEnumNames ? '' : 'TypeRespGetPropertyCount');
  static const LocalCtrlMsgType TypeCmdGetPropertyValues =
      LocalCtrlMsgType._(4, _omitEnumNames ? '' : 'TypeCmdGetPropertyValues');
  static const LocalCtrlMsgType TypeRespGetPropertyValues =
      LocalCtrlMsgType._(5, _omitEnumNames ? '' : 'TypeRespGetPropertyValues');
  static const LocalCtrlMsgType TypeCmdSetPropertyValues =
      LocalCtrlMsgType._(6, _omitEnumNames ? '' : 'TypeCmdSetPropertyValues');
  static const LocalCtrlMsgType TypeRespSetPropertyValues =
      LocalCtrlMsgType._(7, _omitEnumNames ? '' : 'TypeRespSetPropertyValues');

  static const $core.List<LocalCtrlMsgType> values = <LocalCtrlMsgType>[
    TypeCmdGetPropertyCount,
    TypeRespGetPropertyCount,
    TypeCmdGetPropertyValues,
    TypeRespGetPropertyValues,
    TypeCmdSetPropertyValues,
    TypeRespSetPropertyValues,
  ];

  static final $core.Map<$core.int, LocalCtrlMsgType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static LocalCtrlMsgType? valueOf($core.int value) => _byValue[value];

  const LocalCtrlMsgType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
