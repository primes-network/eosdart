import 'package:json_annotation/json_annotation.dart';

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

@JsonSerializable()
class ActionTrace {
  @JsonKey(name: 'receipt')
  Receipt receipt;

  @JsonKey(name: 'act')
  Act act;

  @JsonKey(name: 'context_free')
  bool contextFree;

  @JsonKey(name: 'elapsed')
  int elapsed;

  @JsonKey(name: 'console')
  String console;

  @JsonKey(name: 'trx_id')
  String trxId;

  @JsonKey(name: 'block_num')
  int blockNum;

  @JsonKey(name: 'block_time')
  DateTime blockTime;

  @JsonKey(name: 'producer_block_id')
  String producerBlockId;

  @JsonKey(name: 'account_ram_deltas')
  List<Object> accountRamDeltas;

  @JsonKey(name: 'except')
  Object except;

  @JsonKey(name: 'inline_traces')
  List<Object> inlineTraces;

  ActionTrace();

  factory ActionTrace.fromJson(Map<String, dynamic> json) =>
      _$ActionTraceFromJson(json);

  Map<String, dynamic> toJson() => _$ActionTraceToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class Receipt {
  @JsonKey(name: 'receiver')
  String receiver;

  @JsonKey(name: 'act_digest')
  String actDigest;

  @JsonKey(name: 'global_sequence')
  String globalSequence;

  @JsonKey(name: 'recv_sequence')
  int receiveSequence;

  @JsonKey(name: 'auth_sequence')
  List<Object> authSequence;

  @JsonKey(name: 'code_sequence')
  int codeSequence;

  @JsonKey(name: 'abi_sequence')
  int abiSequence;

  Receipt();

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class Act {
  @JsonKey(name: 'account')
  String account;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'authorization')
  List<Authorization> authorization;

  @JsonKey(name: 'data')
  Object data;

  @JsonKey(name: 'hex_data')
  String hexData;

  Act();

  factory Act.fromJson(Map<String, dynamic> json) => _$ActFromJson(json);

  Map<String, dynamic> toJson() => _$ActToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class Authorization {
  @JsonKey(name: 'actor')
  String actor;

  @JsonKey(name: 'permission')
  String permission;

  Authorization();

  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);

  @override
  String toString() => this.toJson().toString();
}
