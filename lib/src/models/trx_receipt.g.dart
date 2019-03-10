// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trx_receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrxReceipt _$TrxReceiptFromJson(Map<String, dynamic> json) {
  return TrxReceipt()
    ..status = json['status'] as String
    ..cpuUsageUs = json['cpu_usage_us'] == null
        ? null
        : MixIntString.getIntFromJson(json['cpu_usage_us'])
    ..netUsageWords = json['net_usage_words'] == null
        ? null
        : MixIntString.getIntFromJson(json['net_usage_words'])
    ..trx = json['trx'];
}

Map<String, dynamic> _$TrxReceiptToJson(TrxReceipt instance) =>
    <String, dynamic>{
      'status': instance.status,
      'cpu_usage_us': instance.cpuUsageUs,
      'net_usage_words': instance.netUsageWords,
      'trx': instance.trx
    };
