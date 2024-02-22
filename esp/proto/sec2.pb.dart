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

import 'constants.pbenum.dart' as $0;
import 'sec2.pbenum.dart';

export 'sec2.pbenum.dart';

/// Data structure of Session command0 packet
class S2SessionCmd0 extends $pb.GeneratedMessage {
  factory S2SessionCmd0({
    $core.List<$core.int>? clientUsername,
    $core.List<$core.int>? clientPubkey,
  }) {
    final $result = create();
    if (clientUsername != null) {
      $result.clientUsername = clientUsername;
    }
    if (clientPubkey != null) {
      $result.clientPubkey = clientPubkey;
    }
    return $result;
  }
  S2SessionCmd0._() : super();
  factory S2SessionCmd0.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S2SessionCmd0.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S2SessionCmd0', package: const $pb.PackageName(_omitMessageNames ? '' : 'local_ctrl'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'clientUsername', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'clientPubkey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S2SessionCmd0 clone() => S2SessionCmd0()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S2SessionCmd0 copyWith(void Function(S2SessionCmd0) updates) => super.copyWith((message) => updates(message as S2SessionCmd0)) as S2SessionCmd0;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S2SessionCmd0 create() => S2SessionCmd0._();
  S2SessionCmd0 createEmptyInstance() => create();
  static $pb.PbList<S2SessionCmd0> createRepeated() => $pb.PbList<S2SessionCmd0>();
  @$core.pragma('dart2js:noInline')
  static S2SessionCmd0 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S2SessionCmd0>(create);
  static S2SessionCmd0? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get clientUsername => $_getN(0);
  @$pb.TagNumber(1)
  set clientUsername($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get clientPubkey => $_getN(1);
  @$pb.TagNumber(2)
  set clientPubkey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientPubkey() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientPubkey() => clearField(2);
}

/// Data structure of Session response0 packet
class S2SessionResp0 extends $pb.GeneratedMessage {
  factory S2SessionResp0({
    $0.Status? status,
    $core.List<$core.int>? devicePubkey,
    $core.List<$core.int>? deviceSalt,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (devicePubkey != null) {
      $result.devicePubkey = devicePubkey;
    }
    if (deviceSalt != null) {
      $result.deviceSalt = deviceSalt;
    }
    return $result;
  }
  S2SessionResp0._() : super();
  factory S2SessionResp0.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S2SessionResp0.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S2SessionResp0', package: const $pb.PackageName(_omitMessageNames ? '' : 'local_ctrl'), createEmptyInstance: create)
    ..e<$0.Status>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'devicePubkey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'deviceSalt', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S2SessionResp0 clone() => S2SessionResp0()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S2SessionResp0 copyWith(void Function(S2SessionResp0) updates) => super.copyWith((message) => updates(message as S2SessionResp0)) as S2SessionResp0;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S2SessionResp0 create() => S2SessionResp0._();
  S2SessionResp0 createEmptyInstance() => create();
  static $pb.PbList<S2SessionResp0> createRepeated() => $pb.PbList<S2SessionResp0>();
  @$core.pragma('dart2js:noInline')
  static S2SessionResp0 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S2SessionResp0>(create);
  static S2SessionResp0? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get devicePubkey => $_getN(1);
  @$pb.TagNumber(2)
  set devicePubkey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDevicePubkey() => $_has(1);
  @$pb.TagNumber(2)
  void clearDevicePubkey() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get deviceSalt => $_getN(2);
  @$pb.TagNumber(3)
  set deviceSalt($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceSalt() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceSalt() => clearField(3);
}

/// Data structure of Session command1 packet
class S2SessionCmd1 extends $pb.GeneratedMessage {
  factory S2SessionCmd1({
    $core.List<$core.int>? clientProof,
  }) {
    final $result = create();
    if (clientProof != null) {
      $result.clientProof = clientProof;
    }
    return $result;
  }
  S2SessionCmd1._() : super();
  factory S2SessionCmd1.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S2SessionCmd1.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S2SessionCmd1', package: const $pb.PackageName(_omitMessageNames ? '' : 'local_ctrl'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'clientProof', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S2SessionCmd1 clone() => S2SessionCmd1()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S2SessionCmd1 copyWith(void Function(S2SessionCmd1) updates) => super.copyWith((message) => updates(message as S2SessionCmd1)) as S2SessionCmd1;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S2SessionCmd1 create() => S2SessionCmd1._();
  S2SessionCmd1 createEmptyInstance() => create();
  static $pb.PbList<S2SessionCmd1> createRepeated() => $pb.PbList<S2SessionCmd1>();
  @$core.pragma('dart2js:noInline')
  static S2SessionCmd1 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S2SessionCmd1>(create);
  static S2SessionCmd1? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get clientProof => $_getN(0);
  @$pb.TagNumber(1)
  set clientProof($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientProof() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientProof() => clearField(1);
}

/// Data structure of Session response1 packet
class S2SessionResp1 extends $pb.GeneratedMessage {
  factory S2SessionResp1({
    $0.Status? status,
    $core.List<$core.int>? deviceProof,
    $core.List<$core.int>? deviceNonce,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (deviceProof != null) {
      $result.deviceProof = deviceProof;
    }
    if (deviceNonce != null) {
      $result.deviceNonce = deviceNonce;
    }
    return $result;
  }
  S2SessionResp1._() : super();
  factory S2SessionResp1.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S2SessionResp1.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S2SessionResp1', package: const $pb.PackageName(_omitMessageNames ? '' : 'local_ctrl'), createEmptyInstance: create)
    ..e<$0.Status>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'deviceProof', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'deviceNonce', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S2SessionResp1 clone() => S2SessionResp1()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S2SessionResp1 copyWith(void Function(S2SessionResp1) updates) => super.copyWith((message) => updates(message as S2SessionResp1)) as S2SessionResp1;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S2SessionResp1 create() => S2SessionResp1._();
  S2SessionResp1 createEmptyInstance() => create();
  static $pb.PbList<S2SessionResp1> createRepeated() => $pb.PbList<S2SessionResp1>();
  @$core.pragma('dart2js:noInline')
  static S2SessionResp1 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S2SessionResp1>(create);
  static S2SessionResp1? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get deviceProof => $_getN(1);
  @$pb.TagNumber(2)
  set deviceProof($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceProof() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceProof() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get deviceNonce => $_getN(2);
  @$pb.TagNumber(3)
  set deviceNonce($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceNonce() => clearField(3);
}

enum Sec2Payload_Payload {
  sc0, 
  sr0, 
  sc1, 
  sr1, 
  notSet
}

/// Payload structure of session data
class Sec2Payload extends $pb.GeneratedMessage {
  factory Sec2Payload({
    Sec2MsgType? msg,
    S2SessionCmd0? sc0,
    S2SessionResp0? sr0,
    S2SessionCmd1? sc1,
    S2SessionResp1? sr1,
  }) {
    final $result = create();
    if (msg != null) {
      $result.msg = msg;
    }
    if (sc0 != null) {
      $result.sc0 = sc0;
    }
    if (sr0 != null) {
      $result.sr0 = sr0;
    }
    if (sc1 != null) {
      $result.sc1 = sc1;
    }
    if (sr1 != null) {
      $result.sr1 = sr1;
    }
    return $result;
  }
  Sec2Payload._() : super();
  factory Sec2Payload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Sec2Payload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Sec2Payload_Payload> _Sec2Payload_PayloadByTag = {
    20 : Sec2Payload_Payload.sc0,
    21 : Sec2Payload_Payload.sr0,
    22 : Sec2Payload_Payload.sc1,
    23 : Sec2Payload_Payload.sr1,
    0 : Sec2Payload_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Sec2Payload', package: const $pb.PackageName(_omitMessageNames ? '' : 'local_ctrl'), createEmptyInstance: create)
    ..oo(0, [20, 21, 22, 23])
    ..e<Sec2MsgType>(1, _omitFieldNames ? '' : 'msg', $pb.PbFieldType.OE, defaultOrMaker: Sec2MsgType.S2Session_Command0, valueOf: Sec2MsgType.valueOf, enumValues: Sec2MsgType.values)
    ..aOM<S2SessionCmd0>(20, _omitFieldNames ? '' : 'sc0', subBuilder: S2SessionCmd0.create)
    ..aOM<S2SessionResp0>(21, _omitFieldNames ? '' : 'sr0', subBuilder: S2SessionResp0.create)
    ..aOM<S2SessionCmd1>(22, _omitFieldNames ? '' : 'sc1', subBuilder: S2SessionCmd1.create)
    ..aOM<S2SessionResp1>(23, _omitFieldNames ? '' : 'sr1', subBuilder: S2SessionResp1.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Sec2Payload clone() => Sec2Payload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Sec2Payload copyWith(void Function(Sec2Payload) updates) => super.copyWith((message) => updates(message as Sec2Payload)) as Sec2Payload;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Sec2Payload create() => Sec2Payload._();
  Sec2Payload createEmptyInstance() => create();
  static $pb.PbList<Sec2Payload> createRepeated() => $pb.PbList<Sec2Payload>();
  @$core.pragma('dart2js:noInline')
  static Sec2Payload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sec2Payload>(create);
  static Sec2Payload? _defaultInstance;

  Sec2Payload_Payload whichPayload() => _Sec2Payload_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Sec2MsgType get msg => $_getN(0);
  @$pb.TagNumber(1)
  set msg(Sec2MsgType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(20)
  S2SessionCmd0 get sc0 => $_getN(1);
  @$pb.TagNumber(20)
  set sc0(S2SessionCmd0 v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasSc0() => $_has(1);
  @$pb.TagNumber(20)
  void clearSc0() => clearField(20);
  @$pb.TagNumber(20)
  S2SessionCmd0 ensureSc0() => $_ensure(1);

  @$pb.TagNumber(21)
  S2SessionResp0 get sr0 => $_getN(2);
  @$pb.TagNumber(21)
  set sr0(S2SessionResp0 v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasSr0() => $_has(2);
  @$pb.TagNumber(21)
  void clearSr0() => clearField(21);
  @$pb.TagNumber(21)
  S2SessionResp0 ensureSr0() => $_ensure(2);

  @$pb.TagNumber(22)
  S2SessionCmd1 get sc1 => $_getN(3);
  @$pb.TagNumber(22)
  set sc1(S2SessionCmd1 v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasSc1() => $_has(3);
  @$pb.TagNumber(22)
  void clearSc1() => clearField(22);
  @$pb.TagNumber(22)
  S2SessionCmd1 ensureSc1() => $_ensure(3);

  @$pb.TagNumber(23)
  S2SessionResp1 get sr1 => $_getN(4);
  @$pb.TagNumber(23)
  set sr1(S2SessionResp1 v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasSr1() => $_has(4);
  @$pb.TagNumber(23)
  void clearSr1() => clearField(23);
  @$pb.TagNumber(23)
  S2SessionResp1 ensureSr1() => $_ensure(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
