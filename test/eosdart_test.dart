import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  group('EOS Client', () {
    EOSClient client;

    setUp(() {
      client = EOSClient('https://eos.greymass.com', 'v1');
    });

    test('Get Info', () async {
      await client.getInfo().then((NodeInfo nodeInfo) {
        expect(nodeInfo.headBlockNum > 0, isTrue);
      });
    });

    test('Get Abi', () async {
      await client.getAbi('eosio.stake').then((Account account) {
        expect(account.accountName, equals('eosio.stake'));
        expect(account.coreLiquidBalance, isNull);
      });
    });

    test('Get Block', () async {
      await client.getBlock('43743575').then((Block block) {
        expect(block.blockNum > 0, isTrue);
        expect(block.producer, 'zbeosbp11111');
        expect(block.confirmed, 0);
        expect(block.transactionMRoot,
            '8fb685526d58dfabd05989b45b8576197acc1be59d753bb396386d5d718f9fa9');
        expect(block.transactions.length > 10, isTrue);
      });
    });

    test('Get Account', () async {
      await client.getAccount('eosio.stake').then((Account account) {
        expect(account.accountName, equals('eosio.stake'));
        expect(account.coreLiquidBalance.amount > 0, isTrue);
      });
    });

    test('Get Transaction', () async {
      await client
          .getTransaction(
              '8ca0fea82370a2dbbf2c4bd1026bf9fd98a57685bee3672c4ddbbc9be21de984')
          .then((Transaction transaction) {
        expect(transaction.blockNum, 43743575);
        expect(transaction.trx.receipt.cpuUsageUs, 132);
        expect(transaction.trx.receipt.netUsageWords, 0);
        expect(transaction.traces.length, 2);
        expect(transaction.traces[0].receipt.receiver, 'trustdicelog');
        expect(transaction.traces[0].inlineTraces.length, 1);
        expect(transaction.traces[0].inlineTraces[0].receipt.receiver,
            'ge4tcnrxgyge');
      });
    });
  });
}
