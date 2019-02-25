// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Abi _$AbiFromJson(Map<String, dynamic> json) {
  return Abi()
    ..accountName = json['account_name'] as String
    ..codeHash = json['code_hash'] as String
    ..abiHash = json['abi_hash'] as String
    ..wasm = json['wasm'] as String
    ..abi = json['abi'];
}

Map<String, dynamic> _$AbiToJson(Abi instance) => <String, dynamic>{
      'account_name': instance.accountName,
      'code_hash': instance.codeHash,
      'abi_hash': instance.abiHash,
      'wasm': instance.wasm,
      'abi': instance.abi
    };
