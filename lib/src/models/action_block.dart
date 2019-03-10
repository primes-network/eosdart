import 'package:json_annotation/json_annotation.dart';

import './action.dart';
import './mix_int_string.dart';

part 'action_block.g.dart';

@JsonSerializable()
class Actions {
  @JsonKey(name: 'actions')
  List<ActionBlock> actions;

  Actions();

  factory Actions.fromJson(Map<String, dynamic> json) =>
      _$ActionsFromJson(json);

  Map<String, dynamic> toJson() => _$ActionsToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class ActionBlock with MixIntString {
  @JsonKey(name: 'global_action_seq', fromJson: MixIntString.getIntFromJson)
  int globalActionSeq;

  @JsonKey(name: 'account_action_seq', fromJson: MixIntString.getIntFromJson)
  int accountActionSeq;

  @JsonKey(name: 'block_num', fromJson: MixIntString.getIntFromJson)
  int blockNum;

  @JsonKey(name: 'block_time')
  DateTime blockTime;

  @JsonKey(name: 'action_trace')
  ActionWithReceipt actionTrace;

  ActionBlock();

  factory ActionBlock.fromJson(Map<String, dynamic> json) =>
      _$ActionBlockFromJson(json);

  Map<String, dynamic> toJson() => _$ActionBlockToJson(this);

  @override
  String toString() => this.toJson().toString();
}
