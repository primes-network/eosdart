import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  group('EOS Client', () {
    EOSClient client;

    setUp(() {
      client = EOSClient('https://node.eosflare.io', 'v1');
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

//    test('Get Block', () async {
//      await client.getBlock('43743575').then((Block block) {
//        expect(block.blockNum > 0, isTrue);
//      });
//    });

    test('Get Account', () async {
      await client.getAccount('eosio.stake').then((Account account) {
        expect(account.accountName, equals('eosio.stake'));
        expect(account.coreLiquidBalance.amount > 0, isTrue);
      });
    });
  });
}
