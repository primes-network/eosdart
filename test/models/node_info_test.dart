import 'dart:io';
import 'dart:convert';

import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  group('EOS Model', () {
    late String nodeInfoStr;

    setUp(() {
      nodeInfoStr =
          File('./test/models/node_info_test_data.json').readAsStringSync();
    });

    test('NodeInfo to JSON', () {
      Map<String, dynamic> nodeInfoJson = json.decode(nodeInfoStr);
      NodeInfo nodeInfo = NodeInfo.fromJson(nodeInfoJson);

      expect(nodeInfo.serverVersion, '3fddb727');
      expect(nodeInfo.chainId,
          'aca376f206b8fc25a6ed44dbdc66547c36c6c33e3a119ffbeaef943642f0e906');
      expect(nodeInfo.headBlockNum, 43567300);
      expect(nodeInfo.virtualBlockNetLimit, 1048576000);
    });
  });
}
