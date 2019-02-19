import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  group('EOS Client', () {
    EOSClient client;

    setUp(() {
      client = EOSClient.fromNode('https://node.eosflare.io');
    });

    test('Get Abi', () async {
      await client.getAbi('eosio.stake').then((Account account) {
        expect(account.accountName, equals('eosio.stake'));
        expect(account.coreLiquidBalance, isNull);
      });
    });

    test('Get Account', () async {
      await client.getAccount('eosio.stake').then((Account account) {
        expect(account.accountName, equals('eosio.stake'));
        expect(account.coreLiquidBalance.amount > 0, isTrue);
      });
    });
  });
}
