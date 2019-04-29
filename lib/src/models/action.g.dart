// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionWithReceipt _$ActionWithReceiptFromJson(Map<String, dynamic> json) {
  return ActionWithReceipt()
    ..receipt = json['receipt'] == null
        ? null
        : ActionReceipt.fromJson(json['receipt'] as Map<String, dynamic>)
    ..action = json['act'] == null
        ? null
        : Action.fromJson(json['act'] as Map<String, dynamic>)
    ..contextFree = json['context_free'] as bool
    ..elapsed = json['elapsed'] as int
    ..console = json['console'] as String
    ..trxId = json['trx_id'] as String
    ..blockNum = json['block_num'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['block_num'])
    ..blockTime = json['block_time'] == null
        ? null
        : DateTime.parse(json['block_time'] as String)
    ..producerBlockId = json['producer_block_id'] as String
    ..accountRamDeltas = json['account_ram_deltas'] as List
    ..except = json['except']
    ..inlineTraces = (json['inline_traces'] as List)
        ?.map((e) => e == null
            ? null
            : ActionWithReceipt.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ActionWithReceiptToJson(ActionWithReceipt instance) =>
    <String, dynamic>{
      'receipt': instance.receipt,
      'act': instance.action,
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

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action()
    ..account = json['account'] as String
    ..name = json['name'] as String
    ..authorization = (json['authorization'] as List)
        ?.map((e) => e == null
            ? null
            : Authorization.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..data = json['data'];
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'account': instance.account,
      'name': instance.name,
      'authorization': instance.authorization,
      'data': instance.data
    };

ActionReceipt _$ActionReceiptFromJson(Map<String, dynamic> json) {
  return ActionReceipt()
    ..receiver = json['receiver'] as String
    ..actDigest = json['act_digest'] as String
    ..globalSequence = json['global_sequence'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['global_sequence'])
    ..receiveSequence = json['recv_sequence'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['recv_sequence'])
    ..authSequence = json['auth_sequence'] as List
    ..codeSequence = json['code_sequence'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['code_sequence'])
    ..abiSequence = json['abi_sequence'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['abi_sequence']);
}

Map<String, dynamic> _$ActionReceiptToJson(ActionReceipt instance) =>
    <String, dynamic>{
      'receiver': instance.receiver,
      'act_digest': instance.actDigest,
      'global_sequence': instance.globalSequence,
      'recv_sequence': instance.receiveSequence,
      'auth_sequence': instance.authSequence,
      'code_sequence': instance.codeSequence,
      'abi_sequence': instance.abiSequence
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
