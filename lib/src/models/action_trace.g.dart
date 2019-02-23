// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_trace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionTrace _$ActionTraceFromJson(Map<String, dynamic> json) {
  return ActionTrace()
    ..receipt = json['receipt'] == null
        ? null
        : Receipt.fromJson(json['receipt'] as Map<String, dynamic>)
    ..act = json['act'] == null
        ? null
        : Act.fromJson(json['act'] as Map<String, dynamic>)
    ..contextFree = json['context_free'] as bool
    ..elapsed = json['elapsed'] as int
    ..console = json['console'] as String
    ..trxId = json['trx_id'] as String
    ..blockNum = json['block_num'] as int
    ..blockTime = json['block_time'] == null
        ? null
        : DateTime.parse(json['block_time'] as String)
    ..producerBlockId = json['producer_block_id'] as String
    ..accountRamDeltas = json['account_ram_deltas'] as List
    ..except = json['except']
    ..inlineTraces = (json['inline_traces'] as List)
        ?.map((e) =>
            e == null ? null : ActionTrace.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ActionTraceToJson(ActionTrace instance) =>
    <String, dynamic>{
      'receipt': instance.receipt,
      'act': instance.act,
      'context_free': instance.contextFree,
      'elapsed': instance.elapsed,
      'console': instance.console,
      'trx_id': instance.trxId,
      'block_num': instance.blockNum,
      'block_time': instance.blockTime?.toIso8601String(),
      'producer_block_id': instance.producerBlockId,
      'account_ram_deltas': instance.accountRamDeltas,
      'except': instance.except,
      'inline_traces': instance.inlineTraces
    };

Receipt _$ReceiptFromJson(Map<String, dynamic> json) {
  return Receipt()
    ..receiver = json['receiver'] as String
    ..actDigest = json['act_digest'] as String
    ..globalSequence = json['global_sequence'] as String
    ..receiveSequence = json['recv_sequence'] as int
    ..authSequence = json['auth_sequence'] as List
    ..codeSequence = json['code_sequence'] as int
    ..abiSequence = json['abi_sequence'] as int;
}

Map<String, dynamic> _$ReceiptToJson(Receipt instance) => <String, dynamic>{
      'receiver': instance.receiver,
      'act_digest': instance.actDigest,
      'global_sequence': instance.globalSequence,
      'recv_sequence': instance.receiveSequence,
      'auth_sequence': instance.authSequence,
      'code_sequence': instance.codeSequence,
      'abi_sequence': instance.abiSequence
    };

Act _$ActFromJson(Map<String, dynamic> json) {
  return Act()
    ..account = json['account'] as String
    ..name = json['name'] as String
    ..authorization = (json['authorization'] as List)
        ?.map((e) => e == null
            ? null
            : Authorization.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..data = json['data']
    ..hexData = json['hex_data'] as String;
}

Map<String, dynamic> _$ActToJson(Act instance) => <String, dynamic>{
      'account': instance.account,
      'name': instance.name,
      'authorization': instance.authorization,
      'data': instance.data,
      'hex_data': instance.hexData
    };

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) {
  return Authorization()
    ..actor = json['actor'] as String
    ..permission = json['permission'] as String;
}

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) =>
    <String, dynamic>{
      'actor': instance.actor,
      'permission': instance.permission
    };
