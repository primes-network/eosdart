import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  group('EOS Client', () {
    EOSClient client;

    setUp(() {
      client = EOSClient('https://eos.greymass.com', 'v1');
    });

    test('Get Info', () {
      client.getInfo().then((NodeInfo nodeInfo) {
        expect(nodeInfo.headBlockNum > 0, isTrue);
      });
    });

    test('Get Abi', () {
      client.getAbi('eosio.token').then((AbiResp abi) {
        expect(abi.accountName, equals('eosio.token'));
      });
    });

    test('Get Raw Abi', () {
      client.getRawAbi('eosio.token').then((AbiResp abi) {
        expect(abi.accountName, equals('eosio.token'));
        expect(abi.codeHash,
            '01bd013c4f8be142b9cadf511f007c6ac201c068d529f01ed5661803c575befa');
        expect(abi.abiHash,
            'f8f677996a8ca68388bc41cf55e727949c161b624a47e497e3b2f71a0e635dad');
        expect(abi.abi, isNotNull);
      });
    });

    test('Get Raw code and Abi', () {
      client.getRawCodeAndAbi('eosio.token').then((AbiResp abi) {
        expect(abi.accountName, equals('eosio.token'));
        expect(abi.wasm.length > 0, isTrue);
        expect(abi.abi, isNotNull);
      });
    });

    test('Get Block', () {
      client.getBlock('43743575').then((Block block) {
        expect(block.blockNum > 0, isTrue);
        expect(block.producer, 'zbeosbp11111');
        expect(block.confirmed, 0);
        expect(block.transactionMRoot,
            '8fb685526d58dfabd05989b45b8576197acc1be59d753bb396386d5d718f9fa9');
        expect(block.transactions.length > 10, isTrue);
      });
    });

    test('Get Account', () {
      client.getAccount('eosio.stake').then((Account account) {
        expect(account.accountName, equals('eosio.stake'));
        expect(account.coreLiquidBalance.amount > 0, isTrue);
      });
    });

    test('Get currency balance', () {
      client
          .getCurrencyBalance('parslseed123', 'newdexpocket', 'SEED')
          .then((List<Holding> tokens) {
        expect(tokens.length > 0, isTrue);
        expect(tokens[0].amount > 0, isTrue);
        expect(tokens[0].currency, 'SEED');
      });
    });

    test('Get Transaction', () {
      client
          .getTransaction(
              '8ca0fea82370a2dbbf2c4bd1026bf9fd98a57685bee3672c4ddbbc9be21de984')
          .then((TransactionBlock transaction) {
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
