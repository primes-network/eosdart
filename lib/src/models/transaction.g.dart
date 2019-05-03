// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionBlock _$TransactionBlockFromJson(Map<String, dynamic> json) {
  return TransactionBlock()
    ..id = json['id'] as String
    ..trx = json['trx'] == null
        ? null
        : TransactionWithReceipt.fromJson(json['trx'] as Map<String, dynamic>)
    ..blockTime = json['block_time'] == null
        ? null
        : DateTime.parse(json['block_time'] as String)
    ..blockNum = json['block_num'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['block_num'])
    ..lastIrreversibleBlock = json['last_irreversible_block'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['last_irreversible_block'])
    ..traces = (json['traces'] as List)
        ?.map((e) => e == null
            ? null
            : ActionWithReceipt.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TransactionBlockToJson(TransactionBlock instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trx': instance.trx,
      'block_time': instance.blockTime?.toIso8601String(),
      'block_num': instance.blockNum,
      'last_irreversible_block': instance.lastIrreversibleBlock,
      'traces': instance.traces
    };

TransactionWithReceipt _$TransactionWithReceiptFromJson(
    Map<String, dynamic> json) {
  return TransactionWithReceipt()
    ..receipt = json['receipt'] == null
        ? null
        : TransactionReceipt.fromJson(json['receipt'] as Map<String, dynamic>)
    ..transaction = json['trx'] == null
        ? null
        : Transaction.fromJson(json['trx'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TransactionWithReceiptToJson(
        TransactionWithReceipt instance) =>
    <String, dynamic>{'receipt': instance.receipt, 'trx': instance.transaction};

TransactionReceipt _$TransactionReceiptFromJson(Map<String, dynamic> json) {
  return TransactionReceipt()
    ..status = json['status'] as String
    ..cpuUsageUs = json['cpu_usage_us'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['cpu_usage_us'])
    ..netUsageWords = json['net_usage_words'] == null
        ? null
        : ConversionHelper.getIntFromJson(json['net_usage_words'])
    ..trx = json['trx'];
}

Map<String, dynamic> _$TransactionReceiptToJson(TransactionReceipt instance) =>
    <String, dynamic>{
      'status': instance.status,
      'cpu_usage_us': instance.cpuUsageUs,
      'net_usage_words': instance.netUsageWords,
      'trx': instance.trx
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction()
    ..expiration = json['expiration'] == null
        ? null
        : DateTime.parse(json['expiration'] as String)
    ..refBlockNum = json['ref_block_num'] as int
    ..refBlockPrefix = json['ref_block_prefix'] as int
    ..maxNetUsageWords = json['max_net_usage_words'] as int
    ..maxCpuUsageMs = json['max_cpu_usage_ms'] as int
    ..delaySec = json['delay_sec'] as int
    ..contextFreeActions = json['context_free_actions'] as List
    ..actions = (json['actions'] as List)
        ?.map((e) =>
            e == null ? null : Action.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..transactionExtensions = json['transaction_extensions'] as List
    ..signatures =
        (json['signatures'] as List)?.map((e) => e as String)?.toList()
    ..contextFreeData = json['context_free_data'] as List;
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'expiration': instance.expiration?.toIso8601String(),
      'ref_block_num': instance.refBlockNum,
      'ref_block_prefix': instance.refBlockPrefix,
      'max_net_usage_words': instance.maxNetUsageWords,
      'max_cpu_usage_ms': instance.maxCpuUsageMs,
      'delay_sec': instance.delaySec,
      'context_free_actions': instance.contextFreeActions,
      'actions': instance.actions?.map((e) => e?.toJson())?.toList(),
      'transaction_extensions': instance.transactionExtensions,
      'signatures': instance.signatures,
      'context_free_data': instance.contextFreeData
    };
