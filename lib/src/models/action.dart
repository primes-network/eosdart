import 'package:json_annotation/json_annotation.dart';

import './action_trace.dart';

part 'action.g.dart';

@JsonSerializable()
class Actions {
  @JsonKey(name: 'actions')
  List<Action> actions;

  Actions();

  factory Actions.fromJson(Map<String, dynamic> json) =>
      _$ActionsFromJson(json);

  Map<String, dynamic> toJson() => _$ActionsToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class Action {
  @JsonKey(name: 'global_action_seq')
  String globalActionSeq;

  @JsonKey(name: 'account_action_seq')
  int accountActionSeq;

  @JsonKey(name: 'block_num')
  int blockNum;

  @JsonKey(name: 'block_time')
  DateTime blockTime;

  @JsonKey(name: 'action_trace')
  ActionTrace actionTrace;

  Action();

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);

  @override
  String toString() => this.toJson().toString();
}
