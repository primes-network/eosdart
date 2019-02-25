import 'package:json_annotation/json_annotation.dart';

part 'abi.g.dart';

@JsonSerializable()
class Abi {
  @JsonKey(name: 'account_name')
  String accountName;

  @JsonKey(name: 'code_hash')
  String codeHash;

  @JsonKey(name: 'abi_hash')
  String abiHash;

  @JsonKey(name: 'wasm')
  String wasm;

  @JsonKey(name: 'abi')
  Object abi;

  Abi();

  factory Abi.fromJson(Map<String, dynamic> json) => _$AbiFromJson(json);

  Map<String, dynamic> toJson() => _$AbiToJson(this);

  @override
  String toString() => this.toJson().toString();
}
