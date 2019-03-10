import 'dart:io';
import 'dart:convert';

import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  group('EOS Model', () {
    test('Transaction to JSON 1', () {
      String transactionStr =
          File('./test/models/transaction_test_data1.json').readAsStringSync();
      Map<String, dynamic> transactionJson = json.decode(transactionStr);
      TransactionBlock transaction = TransactionBlock.fromJson(transactionJson);

      expect(transaction.id,
          '58d0e48048a03cff57af924ab606726793c31607a501112b088896fc0a0f70ec');
      expect(transaction.trx.receipt.status, 'executed');
      expect(transaction.trx.receipt.cpuUsageUs, 303);
      expect(transaction.trx.receipt.netUsageWords, 13);
      expect(transaction.blockTime, DateTime(2019, 2, 22, 6, 45, 7));
      expect(transaction.blockNum, 44072766);
      expect(transaction.lastIrreversibleBlock, 44075018);
      expect(transaction.traces.length, 1);
      expect(transaction.traces[0].receipt.receiver, 'pretonarts11');
      expect(transaction.traces[0].action.account, 'pretonarts11');
      expect(transaction.traces[0].action.name, 'chooseserver');
      expect(transaction.traces[0].producerBlockId,
          '02a07f3e8e112558b58e7027ae614336cf77b45980df9693219f77e7a2d0349e');
    });

    test('Transaction to JSON 2', () {
      String transactionStr =
          File('./test/models/transaction_test_data2.json').readAsStringSync();
      Map<String, dynamic> transactionJson = json.decode(transactionStr);
      TransactionBlock transaction = TransactionBlock.fromJson(transactionJson);

      expect(transaction.id,
          '83875faeb054ba20b20f392418e3a0002c4bb1c36cc4e3fde15cbd0963da8a15');
      expect(transaction.trx.receipt.status, 'executed');
      expect(transaction.trx.receipt.cpuUsageUs, 444);
      expect(transaction.trx.receipt.netUsageWords, 0);
      expect(transaction.blockTime, DateTime(2019, 2, 22, 6, 45, 7));
      expect(transaction.blockNum, 44072766);
      expect(transaction.lastIrreversibleBlock, 44075150);
      expect(transaction.traces.length, 2);
      expect(transaction.traces[0].receipt.receiver, 'xuxxxxxxxxxx');
      expect(transaction.traces[0].action.account, 'eosio.token');
      expect(transaction.traces[0].action.name, 'transfer');
      expect(transaction.traces[0].producerBlockId,
          '02a07f3e8e112558b58e7027ae614336cf77b45980df9693219f77e7a2d0349e');
    });
  });
}
