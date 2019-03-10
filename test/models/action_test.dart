import 'dart:io';
import 'dart:convert';

import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  group('EOS Model', () {
    String actionStr;

    setUp(() {
      actionStr =
          File('./test/models/action_test_data.json').readAsStringSync();
    });

    test('Action to JSON', () {
      Map<String, dynamic> actionJson = json.decode(actionStr);
      ActionBlock action = ActionBlock.fromJson(actionJson);

      expect(action.globalActionSeq, 4587073327);
      expect(action.accountActionSeq, 165);
      expect(action.actionTrace.receipt.receiveSequence, 159);
      expect(action.actionTrace.action.account, 'zosdiscounts');
      expect(action.actionTrace.action.authorization[0].actor, 'airdropsdac3');
      expect(action.actionTrace.contextFree, false);
      expect(action.actionTrace.blockNum, 40066073);
    });
  });
}
