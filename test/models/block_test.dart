import 'dart:io';
import 'dart:convert';

import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  group('EOS Model', () {
    late String blockStr;

    setUp(() {
      blockStr = File('./test/models/block_test_data.json').readAsStringSync();
    });

    test('Block to JSON', () {
      Map<String, dynamic> nodeInfoJson = json.decode(blockStr);
      Block block = Block.fromJson(nodeInfoJson);

      expect(block.blockNum, 44072766);
      expect(block.producer, 'eosbeijingbp');
      expect(block.id,
          '02a07f3e8e112558b58e7027ae614336cf77b45980df9693219f77e7a2d0349e');
      expect(block.refBlockPrefix, 661687989);
      expect(block.transactions!.length > 10, isTrue);
      expect(block.transactions![0].status, 'executed');
      expect(block.transactions![0].cpuUsageUs, 444);
      expect(block.transactions![0].netUsageWords, 0);
    });
  });
}
