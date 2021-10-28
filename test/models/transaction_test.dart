import 'dart:convert';
import 'dart:io';

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
      expect(transaction.trx!.receipt!.status, 'executed');
      expect(transaction.trx!.receipt!.cpuUsageUs, 303);
      expect(transaction.trx!.receipt!.netUsageWords, 13);
      expect(transaction.blockTime, DateTime(2019, 2, 22, 6, 45, 7));
      expect(transaction.blockNum, 44072766);
      expect(transaction.lastIrreversibleBlock, 44075018);
      expect(transaction.traces!.length, 1);
      expect(transaction.traces![0].receipt!.receiver, 'pretonarts11');
      expect(transaction.traces![0].action!.account, 'pretonarts11');
      expect(transaction.traces![0].action!.name, 'chooseserver');
      expect(transaction.traces![0].producerBlockId,
          '02a07f3e8e112558b58e7027ae614336cf77b45980df9693219f77e7a2d0349e');
    });

    test('Transaction to JSON 2', () {
      String transactionStr =
          File('./test/models/transaction_test_data2.json').readAsStringSync();
      Map<String, dynamic> transactionJson = json.decode(transactionStr);
      TransactionBlock transaction = TransactionBlock.fromJson(transactionJson);

      expect(transaction.id,
          '83875faeb054ba20b20f392418e3a0002c4bb1c36cc4e3fde15cbd0963da8a15');
      expect(transaction.trx!.receipt!.status, 'executed');
      expect(transaction.trx!.receipt!.cpuUsageUs, 444);
      expect(transaction.trx!.receipt!.netUsageWords, 0);
      expect(transaction.blockTime, DateTime(2019, 2, 22, 6, 45, 7));
      expect(transaction.blockNum, 44072766);
      expect(transaction.lastIrreversibleBlock, 44075150);
      expect(transaction.traces!.length, 2);
      expect(transaction.traces![0].receipt!.receiver, 'xuxxxxxxxxxx');
      expect(transaction.traces![0].action!.account, 'eosio.token');
      expect(transaction.traces![0].action!.name, 'transfer');
      expect(transaction.traces![0].producerBlockId,
          '02a07f3e8e112558b58e7027ae614336cf77b45980df9693219f77e7a2d0349e');
    });

    test('Transaction Commited', () {
      String transactionStr =
          File('./test/models/transaction_test_data3.json').readAsStringSync();
      Map<String, dynamic> transactionJson = json.decode(transactionStr);
      TransactionCommitted transaction =
          TransactionCommitted.fromJson(transactionJson);

      expect(transaction.id,
          '91b55122107079cb4eafb165511bac77b8a790c3d4008c5f7cd7cfa1236c0876');
      expect(transaction.processed!.blockNum, 729864);
      expect(transaction.processed!.blockTime,
          DateTime(2019, 11, 14, 8, 10, 37, 500));
      expect(transaction.processed!.producerBlockId, null);
      expect(transaction.processed!.receipt!.status, 'executed');
      expect(transaction.processed!.receipt!.cpuUsageUs, 384);
      expect(transaction.processed!.receipt!.netUsageWords, 16);
      expect(transaction.processed!.elapsed, 384);
      expect(transaction.processed!.netUsage, 128);
      expect(transaction.processed!.scheduled, false);
      expect(transaction.processed!.actionTraces!.isNotEmpty, true);
      expect(transaction.processed!.actionTraces!.first.action!.name, 'transfer');
      expect(transaction.processed!.actionTraces!.first.action!.data.toString(),
          '{from: account1, to: account2, quantity: 1.00000000 EOS, memo: }');
      expect(transaction.processed!.actionTraces!.first.action!.account,
          'eosio.token');
    });
  });
}
