import 'dart:io';
import 'dart:convert';

import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  group('EOS Model', () {
    late String accountStr;

    setUp(() {
      accountStr =
          File('./test/models/account_test_data.json').readAsStringSync();
    });

    test('Account to JSON', () {
      Map<String, dynamic> accountJson = json.decode(accountStr);
      Account account = Account.fromJson(accountJson);

      expect(account.accountName, 'binancecold1');
      expect(account.headBlockNum, 43498422);
      expect(account.headBlockTime, DateTime(2019, 2, 18, 22, 54, 16, 500));
      expect(account.privileged, false);
      expect(account.lastCodeUpdate, DateTime(1970, 1, 1));
      expect(account.created, DateTime(2018, 11, 14, 6, 58));
      expect(account.coreLiquidBalance!.amount, 49254569.1575);
      expect(account.coreLiquidBalance!.currency, 'EOS');
      expect(account.ramQuota, 20683);
      expect(account.netWeight, 1000500);
      expect(account.cpuWeight, 1001500);
      expect(account.netLimit!.used, 129);
      expect(account.netLimit!.available, 8344411498);
      expect(account.netLimit!.max, 8344545345);
      expect(account.ramUsage, 3686);
      expect(account.permissions, isList);
      expect(account.permissions!.length, 2);
      expect(account.permissions![0].permName, 'active');
      expect(account.permissions![0].requiredAuth!.threshold, 1);
      expect(account.permissions![0].requiredAuth!.keys, isList);
      expect(account.permissions![0].requiredAuth!.keys!.length, 1);
      expect(account.permissions![0].requiredAuth!.keys![0].key,
          'EOS5GZ7R4BsApfxKcSbHeBEeFavsu9b75ooXM6pf5fo5G4ZbSWBMX');
      expect(account.permissions![0].requiredAuth!.keys![0].weight, 1);
      expect(account.totalResources!.owner, 'binancecold1');
      expect(account.totalResources!.netWeight!.amount, 100.05);
      expect(account.totalResources!.netWeight!.currency, 'EOS');
      expect(account.selfDelegatedBandwidth!.from, 'binancecold1');
      expect(account.selfDelegatedBandwidth!.cpuWeight!.amount, 100.0);
      expect(account.refundRequest!.owner, 'binancecold1');
      expect(account.refundRequest!.netAmount!.amount, 35.6);
      expect(account.voterInfo!.staked, 2000000);
    });
  });
}
