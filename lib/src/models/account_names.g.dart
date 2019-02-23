// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_names.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountNames _$AccountNamesFromJson(Map<String, dynamic> json) {
  return AccountNames()
    ..accountNames =
        (json['account_names'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$AccountNamesToJson(AccountNames instance) =>
    <String, dynamic>{'account_names': instance.accountNames};
