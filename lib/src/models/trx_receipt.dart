import 'package:json_annotation/json_annotation.dart';

import './mix_int_string.dart';

part 'trx_receipt.g.dart';

@JsonSerializable()
class TrxReceipt with MixIntString {
  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'cpu_usage_us', fromJson: MixIntString.getIntFromJson)
  int cpuUsageUs;

  @JsonKey(name: 'net_usage_words', fromJson: MixIntString.getIntFromJson)
  int netUsageWords;

  @JsonKey(name: 'trx')
  Object trx;

  TrxReceipt();

  factory TrxReceipt.fromJson(Map<String, dynamic> json) =>
      _$TrxReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$TrxReceiptToJson(this);

  @override
  String toString() => this.toJson().toString();
}
