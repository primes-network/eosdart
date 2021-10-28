import 'dart:io';
import 'dart:convert';

import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  group('EOS Model', () {
    late String stateStr;

    setUp(() {
      stateStr = File('./test/models/block_header_state_test_data.json')
          .readAsStringSync();
    });

    test('Block header state to JSON', () {
      Map<String, dynamic> stateJson = json.decode(stateStr);
      BlockHeaderState headerState = BlockHeaderState.fromJson(stateJson);

      expect(headerState.id,
          '02a5e504b8d20cd2b3c08ba623dfbb3f98b34a7e8c6cbba81e7b4e25382def4d');
      expect(headerState.blockNum, 44426500);
      expect(headerState.header!.timestamp,
          DateTime(2019, 02, 24, 07, 55, 01, 500));
      expect(headerState.header!.producer, 'starteosiobp');
      expect(headerState.header!.confirmed, 0);
      expect(headerState.header!.previous,
          '02a5e503fa636e7a35d9fa04df9c2ab7860864acff3d835b6c1ec1259b7867e2');
      expect(headerState.header!.transactionMRoot,
          '1553f3e25495670bfd8879b0e972575051d012cb2b7793db9d3ebeec126909b6');
      expect(headerState.header!.actionMRoot,
          '1351f42a98c3877fd406c8ab0e0c45c43b2b8cd2ea1bc1a325353cc8efc76aa4');
      expect(headerState.dposProposedIrreversibleBlocknum, 44426340);
      expect(headerState.dposIrreversibleBlocknum, 44426172);
      expect(headerState.pendingScheduleLibNum, 44118384);
      expect(headerState.pendingSchedule!.version, 703);
      expect(headerState.activeSchedule!.version, 703);
      expect(headerState.activeSchedule!.producers!.length > 10, isTrue);
      expect(
          headerState.activeSchedule!.producers![0].producerName, 'atticlabeosb');
      expect(headerState.activeSchedule!.producers![0].blockSigningKey,
          'EOS7PfA3A4UdfMu2wKbuXdbHn8EWAxbMnFoFWui4X2zsr2oPwdQJP');
      expect(headerState.blockrootMerkle!.activeNodes!.length > 10, isTrue);
      expect(headerState.blockrootMerkle!.activeNodes![0],
          '02a5e503fa636e7a35d9fa04df9c2ab7860864acff3d835b6c1ec1259b7867e2');
      expect(headerState.blockrootMerkle!.nodeCount, 44426499);
      expect(headerState.producerToLastProduced!.length > 10, isTrue);
      expect(headerState.producerToLastImpliedIrb!.length > 10, isTrue);
      expect(headerState.blockSigningKey,
          'EOS4wZZXm994byKANLuwHD6tV3R3Mu3ktc41aSVXCBaGnXJZJ4pwF');
      expect(headerState.confirmCount!.length > 10, isTrue);
    });
  });
}
