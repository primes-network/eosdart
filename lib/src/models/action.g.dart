// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actions _$ActionsFromJson(Map<String, dynamic> json) {
  return Actions()
    ..actions = (json['actions'] as List)
        ?.map((e) =>
            e == null ? null : Action.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ActionsToJson(Actions instance) =>
    <String, dynamic>{'actions': instance.actions};

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action()
    ..globalActionSeq = json['global_action_seq'] as String
    ..accountActionSeq = json['account_action_seq'] as int
    ..blockNum = json['block_num'] as int
    ..blockTime = json['block_time'] == null
        ? null
        : DateTime.parse(json['block_time'] as String)
    ..actionTrace = json['action_trace'] == null
        ? null
        : ActionTrace.fromJson(json['action_trace'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'global_action_seq': instance.globalActionSeq,
      'account_action_seq': instance.accountActionSeq,
      'block_num': instance.blockNum,
      'block_time': instance.blockTime?.toIso8601String(),
      'action_trace': instance.actionTrace
    };
