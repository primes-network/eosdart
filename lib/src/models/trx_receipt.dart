import 'package:json_annotation/json_annotation.dart';

part 'trx_receipt.g.dart';

@JsonSerializable()
class TrxReceipt {
  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'cpu_usage_us')
  int cpuUsageUs;

  @JsonKey(name: 'net_usage_words')
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
