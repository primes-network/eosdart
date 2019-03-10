import 'package:json_annotation/json_annotation.dart';

import './action.dart';
import './mix_int_string.dart';

part 'transaction.g.dart';

@JsonSerializable()
class TransactionBlock with MixIntString {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'trx')
  TransactionWithReceipt trx;

  @JsonKey(name: 'block_time')
  DateTime blockTime;

  @JsonKey(name: 'block_num', fromJson: MixIntString.getIntFromJson)
  int blockNum;

  @JsonKey(
      name: 'last_irreversible_block', fromJson: MixIntString.getIntFromJson)
  int lastIrreversibleBlock;

  @JsonKey(name: 'traces')
  List<ActionWithReceipt> traces;

  TransactionBlock();

  factory TransactionBlock.fromJson(Map<String, dynamic> json) =>
      _$TransactionBlockFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionBlockToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class TransactionWithReceipt {
  @JsonKey(name: 'receipt')
  TransactionReceipt receipt;

  @JsonKey(name: 'trx')
  Transaction transaction;

  TransactionWithReceipt();

  factory TransactionWithReceipt.fromJson(Map<String, dynamic> json) =>
      _$TransactionWithReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionWithReceiptToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class TransactionReceipt with MixIntString {
  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'cpu_usage_us', fromJson: MixIntString.getIntFromJson)
  int cpuUsageUs;

  @JsonKey(name: 'net_usage_words', fromJson: MixIntString.getIntFromJson)
  int netUsageWords;

  @JsonKey(name: 'trx')
  Object trx;

  TransactionReceipt();

  factory TransactionReceipt.fromJson(Map<String, dynamic> json) =>
      _$TransactionReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionReceiptToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class Transaction {
  @JsonKey(name: 'expiration')
  DateTime expiration;

  @JsonKey(name: 'ref_block_num')
  int refBlockNum;

  @JsonKey(name: 'ref_block_prefix')
  int refBlockPrefix;

  @JsonKey(name: 'max_net_usage_words')
  int maxNetUsageWords;

  @JsonKey(name: 'max_cpu_usage_ms')
  int maxCpuUsageMs;

  @JsonKey(name: 'delay_sec')
  int delaySec;

  @JsonKey(name: 'context_free_actions')
  List<Object> contextFreeActions;

  @JsonKey(name: 'actions')
  List<Action> actions;

  @JsonKey(name: 'transaction_extensions')
  List<Object> transactionExtensions;

  @JsonKey(name: 'signatures')
  List<String> signatures;

  @JsonKey(name: 'context_free_data')
  List<Object> contextFreeData;

  Transaction();

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  @override
  String toString() => this.toJson().toString();
}
