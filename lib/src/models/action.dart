import 'package:json_annotation/json_annotation.dart';

import './conversion_helper.dart';

part 'action.g.dart';

@JsonSerializable()
class ActionWithReceipt with ConversionHelper {
  @JsonKey(name: 'receipt')
  ActionReceipt receipt;

  @JsonKey(name: 'act')
  Action action;

  @JsonKey(name: 'context_free')
  bool contextFree;

  @JsonKey(name: 'elapsed')
  int elapsed;

  @JsonKey(name: 'console')
  String console;

  @JsonKey(name: 'trx_id')
  String trxId;

  @JsonKey(name: 'block_num', fromJson: ConversionHelper.getIntFromJson)
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
  List<ActionWithReceipt> inlineTraces;

  ActionWithReceipt();

  factory ActionWithReceipt.fromJson(Map<String, dynamic> json) =>
      _$ActionWithReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$ActionWithReceiptToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class Action {
  @JsonKey(name: 'account')
  String account;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'authorization')
  List<Authorization> authorization;

  @JsonKey(name: 'data')
  Object data;

//  @JsonKey(name: 'hex_data')
//  String hexData;

  Action();

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class ActionReceipt with ConversionHelper {
  @JsonKey(name: 'receiver')
  String receiver;

  @JsonKey(name: 'act_digest')
  String actDigest;

  @JsonKey(name: 'global_sequence', fromJson: ConversionHelper.getIntFromJson)
  int globalSequence;

  @JsonKey(name: 'recv_sequence', fromJson: ConversionHelper.getIntFromJson)
  int receiveSequence;

  @JsonKey(name: 'auth_sequence')
  List<Object> authSequence;

  @JsonKey(name: 'code_sequence', fromJson: ConversionHelper.getIntFromJson)
  int codeSequence;

  @JsonKey(name: 'abi_sequence', fromJson: ConversionHelper.getIntFromJson)
  int abiSequence;

  ActionReceipt();

  factory ActionReceipt.fromJson(Map<String, dynamic> json) =>
      _$ActionReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$ActionReceiptToJson(this);

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
