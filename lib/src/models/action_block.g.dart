// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actions _$ActionsFromJson(Map<String, dynamic> json) {
  return Actions()
    ..actions = (json['actions'] as List)
        ?.map((e) =>
            e == null ? null : ActionBlock.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ActionsToJson(Actions instance) =>
    <String, dynamic>{'actions': instance.actions};

ActionBlock _$ActionBlockFromJson(Map<String, dynamic> json) {
  return ActionBlock()
    ..globalActionSeq = json['global_action_seq'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['global_action_seq'])
    ..accountActionSeq = json['account_action_seq'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['account_action_seq'])
    ..blockNum = json['block_num'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['block_num'])
    ..blockTime = json['block_time'] == null
        ? null
        : DateTime.parse(json['block_time'] as String)
    ..actionTrace = json['action_trace'] == null
        ? null
        : ActionWithReceipt.fromJson(
            json['action_trace'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ActionBlockToJson(ActionBlock instance) =>
    <String, dynamic>{
      'global_action_seq': instance.globalActionSeq,
      'account_action_seq': instance.accountActionSeq,
      'block_num': instance.blockNum,
      'block_time': instance.blockTime?.toIso8601String(),
      'action_trace': instance.actionTrace
    };
