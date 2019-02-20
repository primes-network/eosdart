// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeInfo _$NodeInfoFromJson(Map<String, dynamic> json) {
  return NodeInfo()
    ..serverVersion = json['server_version'] as String
    ..chainId = json['chain_id'] as String
    ..headBlockNum = json['head_block_num'] as int
    ..lastIrreversibleBlockNum = json['last_irreversible_block_num'] as int
    ..lastIrreversibleBlockId = json['last_irreversible_block_id'] as String
    ..headBlockTime = json['head_block_time'] == null
        ? null
        : DateTime.parse(json['head_block_time'] as String)
    ..headBlockProducer = json['head_block_producer'] as String
    ..virtualBlockCpuLimit = json['virtual_block_cpu_limit'] as int
    ..virtualBlockNetLimit = json['virtual_block_net_limit'] as int
    ..blockCpuLimit = json['block_cpu_limit'] as int
    ..blockNetLimit = json['block_net_limit'] as int
    ..serverVersionString = json['server_version_string'] as String
    ..website = json['website'] as String;
}

Map<String, dynamic> _$NodeInfoToJson(NodeInfo instance) => <String, dynamic>{
      'server_version': instance.serverVersion,
      'chain_id': instance.chainId,
      'head_block_num': instance.headBlockNum,
      'last_irreversible_block_num': instance.lastIrreversibleBlockNum,
      'last_irreversible_block_id': instance.lastIrreversibleBlockId,
      'head_block_time': instance.headBlockTime?.toIso8601String(),
      'head_block_producer': instance.headBlockProducer,
      'virtual_block_cpu_limit': instance.virtualBlockCpuLimit,
      'virtual_block_net_limit': instance.virtualBlockNetLimit,
      'block_cpu_limit': instance.blockCpuLimit,
      'block_net_limit': instance.blockNetLimit,
      'server_version_string': instance.serverVersionString,
      'website': instance.website
    };
