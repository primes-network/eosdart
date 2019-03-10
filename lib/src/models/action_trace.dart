import 'package:json_annotation/json_annotation.dart';

import './mix_int_string.dart';

part 'action_trace.g.dart';

@JsonSerializable()
class ActionTrace with MixIntString {
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

  @JsonKey(name: 'block_num', fromJson: MixIntString.getIntFromJson)
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
  List<ActionTrace> inlineTraces;

  ActionTrace();

  factory ActionTrace.fromJson(Map<String, dynamic> json) =>
      _$ActionTraceFromJson(json);

  Map<String, dynamic> toJson() => _$ActionTraceToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class Receipt with MixIntString {
  @JsonKey(name: 'receiver')
  String receiver;

  @JsonKey(name: 'act_digest')
  String actDigest;

  @JsonKey(name: 'global_sequence', fromJson: MixIntString.getIntFromJson)
  int globalSequence;

  @JsonKey(name: 'recv_sequence', fromJson: MixIntString.getIntFromJson)
  int receiveSequence;

  @JsonKey(name: 'auth_sequence')
  List<Object> authSequence;

  @JsonKey(name: 'code_sequence', fromJson: MixIntString.getIntFromJson)
  int codeSequence;

  @JsonKey(name: 'abi_sequence', fromJson: MixIntString.getIntFromJson)
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
