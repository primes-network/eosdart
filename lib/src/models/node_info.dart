import 'package:json_annotation/json_annotation.dart';

import './mix_int_string.dart';

part 'node_info.g.dart';

@JsonSerializable()
class NodeInfo with MixIntString {
  @JsonKey(name: 'server_version')
  String serverVersion;

  @JsonKey(name: 'chain_id')
  String chainId;

  @JsonKey(name: 'head_block_num', fromJson: MixIntString.getIntFromJson)
  int headBlockNum;

  @JsonKey(
      name: 'last_irreversible_block_num',
      fromJson: MixIntString.getIntFromJson)
  int lastIrreversibleBlockNum;

  @JsonKey(name: 'last_irreversible_block_id')
  String lastIrreversibleBlockId;

  @JsonKey(name: 'head_block_time')
  DateTime headBlockTime;

  @JsonKey(name: 'head_block_producer')
  String headBlockProducer;

  @JsonKey(
      name: 'virtual_block_cpu_limit', fromJson: MixIntString.getIntFromJson)
  int virtualBlockCpuLimit;

  @JsonKey(
      name: 'virtual_block_net_limit', fromJson: MixIntString.getIntFromJson)
  int virtualBlockNetLimit;

  @JsonKey(name: 'block_cpu_limit', fromJson: MixIntString.getIntFromJson)
  int blockCpuLimit;

  @JsonKey(name: 'block_net_limit', fromJson: MixIntString.getIntFromJson)
  int blockNetLimit;

  @JsonKey(name: 'server_version_string')
  String serverVersionString;

  @JsonKey(name: 'website')
  String website;

  NodeInfo();

  factory NodeInfo.fromJson(Map<String, dynamic> json) =>
      _$NodeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NodeInfoToJson(this);

  @override
  String toString() => this.toJson().toString();
}
