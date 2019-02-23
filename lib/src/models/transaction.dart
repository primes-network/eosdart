import 'package:json_annotation/json_annotation.dart';

import './action_trace.dart';
import './trx_receipt.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'trx')
  Trx trx;

  @JsonKey(name: 'block_time')
  DateTime blockTime;

  @JsonKey(name: 'block_num')
  int blockNum;

  @JsonKey(name: 'last_irreversible_block')
  int lastIrreversibleBlock;

  @JsonKey(name: 'traces')
  List<ActionTrace> traces;

  Transaction();

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  @override
  String toString() => this.toJson().toString();
}

@JsonSerializable()
class Trx {
  @JsonKey(name: 'receipt')
  TrxReceipt receipt;

  Trx();

  factory Trx.fromJson(Map<String, dynamic> json) => _$TrxFromJson(json);

  Map<String, dynamic> toJson() => _$TrxToJson(this);

  @override
  String toString() => this.toJson().toString();
}
