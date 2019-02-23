import 'package:json_annotation/json_annotation.dart';

part 'account_names.g.dart';

@JsonSerializable()
class AccountNames {
  @JsonKey(name: 'account_names')
  List<String> accountNames;

  AccountNames();

  factory AccountNames.fromJson(Map<String, dynamic> json) =>
      _$AccountNamesFromJson(json);

  Map<String, dynamic> toJson() => _$AccountNamesToJson(this);

  @override
  String toString() => this.toJson().toString();
}
