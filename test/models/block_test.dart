import 'dart:io';
import 'dart:convert';

import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  group('EOS Model', () {
    String blockStr;

    setUp(() {
      blockStr = File('./test/models/block_test_data.json').readAsStringSync();
    });

    test('Block to JSON', () {
      Map<String, dynamic> nodeInfoJson = json.decode(blockStr);
      Block block = Block.fromJson(nodeInfoJson);

      expect(block.blockNum, 351);
      expect(block.producer, 'eosio');
      expect(block.id,
          '0000015f46966e6d09165c5c52354e5860224522aab2c63a7c0b790b32f6f00b');
      expect(block.refBlockPrefix, 1549538825);
    });
  });
}
