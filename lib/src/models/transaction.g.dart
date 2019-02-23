// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction()
    ..id = json['id'] as String
    ..trx = json['trx'] == null
        ? null
        : Trx.fromJson(json['trx'] as Map<String, dynamic>)
    ..blockTime = json['block_time'] == null
        ? null
        : DateTime.parse(json['block_time'] as String)
    ..blockNum = json['block_num'] as int
    ..lastIrreversibleBlock = json['last_irreversible_block'] as int
    ..traces = (json['traces'] as List)
        ?.map((e) =>
            e == null ? null : ActionTrace.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trx': instance.trx,
      'block_time': instance.blockTime?.toIso8601String(),
      'block_num': instance.blockNum,
      'last_irreversible_block': instance.lastIrreversibleBlock,
      'traces': instance.traces
    };

Trx _$TrxFromJson(Map<String, dynamic> json) {
  return Trx()
    ..receipt = json['receipt'] == null
        ? null
        : TrxReceipt.fromJson(json['receipt'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TrxToJson(Trx instance) =>
    <String, dynamic>{'receipt': instance.receipt};
