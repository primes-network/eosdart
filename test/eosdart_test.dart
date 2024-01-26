import 'dart:typed_data';
import 'package:eosdart/eosdart.dart';
import 'package:test/test.dart';

void main() {
  const verbose = false; 
  group('public keys', () {
    test('serialize k1 old style', ()  {
      final keystring = 'EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV';
      final sb = new SerialBuffer(new Uint8List(0));
      sb.pushPublicKey(keystring);
      final serialized = sb.asUint8List();

      if(verbose) {
        print("keystring: $keystring");
        print("serialized: $serialized\n"+"   ${arrayToHex(serialized)}");
      }
      expect(serialized,
          [0, 2, 192, 222, 210, 188, 31, 19, 5, 251, 15, 170, 197, 230, 192, 62,
            227, 161, 146, 66, 52, 152, 84, 39, 182, 22, 124, 165, 105, 209, 61,
            244, 53, 207]);
    });
    test('serialize k1 new style', ()  {
      final keystring = 'PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63';
      final sb = new SerialBuffer(new Uint8List(0));
      sb.pushPublicKey(keystring);
      final serialized = sb.asUint8List();

      if(verbose) {
        print("keystring: $keystring");
        print("serialized: $serialized\n"+"   ${arrayToHex(serialized)}");
      }
      expect(serialized,
          [0, 2, 192, 222, 210, 188, 31, 19, 5, 251, 15, 170, 197, 230, 192, 62,
            227, 161, 146, 66, 52, 152, 84, 39, 182, 22, 124, 165, 105, 209, 61,
            244, 53, 207]);
    });
    test('deserialize k1 new style', ()  {
      final serialized = Uint8List.fromList([0, 2, 192, 222, 210, 188, 31, 19,
        5, 251, 15, 170, 197, 230, 192, 62, 227, 161, 146, 66, 52, 152, 84, 39,
        182, 22, 124, 165, 105, 209, 61, 244, 53, 207]);
      final sb = new SerialBuffer(serialized);
      final keystring = sb.getPublicKey();

      if(verbose) {
        print("keystring: $keystring");
        print("serialized: $serialized\n"+"   ${arrayToHex(serialized)}");
      }
      expect(keystring, 'PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63');
    });
    test('serialize r1 new style', ()  {
      final keystring = 'PUB_R1_6eMzJfDVWvzMTYAUWQ95JcpoY8vFL62pTFm6spim25n5wqtVWP';
      final sb = new SerialBuffer(new Uint8List(0));
      sb.pushPublicKey(keystring);
      final serialized = sb.asUint8List();

      if(verbose) {
        print("keystring: $keystring");
        print("serialized: $serialized\n"+"   ${arrayToHex(serialized)}");
      }
      expect(serialized,
          [1, 2, 231, 80, 174, 4, 190, 33, 189, 1, 48, 165, 223, 203, 242,
           125, 16, 95, 97, 223, 20, 206, 120, 17, 207, 107, 49, 24, 30,
           7, 140, 39, 8, 36]);
    });
    test('deserialize r1 new style', ()  {
      final serialized = Uint8List.fromList(
        [1, 2, 231, 80, 174, 4, 190, 33, 189, 1, 48, 165, 223, 203, 242,
           125, 16, 95, 97, 223, 20, 206, 120, 17, 207, 107, 49, 24, 30,
           7, 140, 39, 8, 36]);
      final sb = new SerialBuffer(serialized);
      final keystring = sb.getPublicKey();

      if(verbose) {
        print("keystring: $keystring");
        print("serialized: $serialized\n"+"   ${arrayToHex(serialized)}");
      }
      expect(keystring, 'PUB_R1_6eMzJfDVWvzMTYAUWQ95JcpoY8vFL62pTFm6spim25n5wqtVWP');
    });

  });

  group('private keys', () {
    test('serialize k1 old style', ()  {
      final keystring = '5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3';
      final sb = new SerialBuffer(new Uint8List(0));
      sb.pushPrivateKey(keystring);
      final serialized = sb.asUint8List();

      if(verbose) {
        print("keystring: $keystring");
        print("serialized: $serialized\n"+"   ${arrayToHex(serialized)}");
      }
      expect(serialized,
          [0, 210, 101, 63, 247, 203, 178, 216, 255, 18, 154, 194, 126, 245,
            120, 28, 230, 139, 37, 88, 196, 26, 116, 175, 31, 45, 220, 166, 53,
            203, 238, 240, 125]);
    });
    test('serialize k1 new style', ()  {
      final keystring = 'PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V';
      final sb = new SerialBuffer(new Uint8List(0));
      sb.pushPrivateKey(keystring);
      final serialized = sb.asUint8List();

      if(verbose) {
        print("keystring: $keystring");
        print("serialized: $serialized\n"+"   ${arrayToHex(serialized)}");
      }
      expect(serialized,
          [0, 210, 101, 63, 247, 203, 178, 216, 255, 18, 154, 194, 126, 245,
            120, 28, 230, 139, 37, 88, 196, 26, 116, 175, 31, 45, 220, 166, 53,
            203, 238, 240, 125]);
    });
    test('deserialize k1 new style', ()  {
      final serialized = Uint8List.fromList([0, 210, 101, 63, 247, 203, 178,
        216, 255, 18, 154, 194, 126, 245, 120, 28, 230, 139, 37, 88, 196,
        26, 116, 175, 31, 45, 220, 166, 53, 203, 238, 240, 125]);
      final sb = new SerialBuffer(serialized);
      final keystring = sb.getPrivateKey();

      if(verbose) {
        print("keystring: $keystring");
        print("serialized: $serialized\n"+"   ${arrayToHex(serialized)}");
      }
      expect(keystring, 'PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V');
    });
    test('serialize r1 new style', ()  {
      final keystring = 'PVT_R1_2JrJRQXEagWobhJbHWtP11muTWi5pgCJ6uXWhGKd2KcFBGF7mT';
      final sb = new SerialBuffer(new Uint8List(0));
      sb.pushPrivateKey(keystring);
      final serialized = sb.asUint8List();

      if(verbose) {
        print("keystring: $keystring");
        print("serialized: $serialized\n"+"   ${arrayToHex(serialized)}");
      }
      expect(serialized,
          [1, 172, 58, 10, 48, 178, 188, 37, 15, 234, 129, 216, 243, 182,
           68, 115, 41, 18, 206, 91, 223, 230, 199, 84, 66, 41, 110, 159,
           117, 45, 189, 67, 43]);
    });
    test('deserialize r1 new style', ()  {
      final serialized = Uint8List.fromList(
        [1, 172, 58, 10, 48, 178, 188, 37, 15, 234, 129, 216, 243, 182,
           68, 115, 41, 18, 206, 91, 223, 230, 199, 84, 66, 41, 110, 159,
           117, 45, 189, 67, 43]);
      final sb = new SerialBuffer(serialized);
      final keystring = sb.getPrivateKey();

      if(verbose) {
        print("keystring: $keystring");
        print("serialized: $serialized\n"+"   ${arrayToHex(serialized)}");
      }
      expect(keystring, 'PVT_R1_2JrJRQXEagWobhJbHWtP11muTWi5pgCJ6uXWhGKd2KcFBGF7mT');
    });

  });
  group('PR#47', () {
    test('roundtrip negative bignum', () {
      final testnumber = '-123456789';
      final serialized = signedDecimalToBinary(testnumber.length, testnumber);
      print("serialized: $serialized\n"+"   ${arrayToHex(serialized)}");
      final number = signedBinaryToDecimal(serialized);
      expect(number, testnumber);
    });
  });
  group('EOS Client', () {
    late EOSClient client;

    setUp(() {
      client = EOSClient('https://eos.greymass.com', 'v1');
    });

    test('Get Info', () {
      client.getInfo().then((NodeInfo nodeInfo) {
        expect(nodeInfo.headBlockNum! > 0, isTrue);
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
        expect(abi.wasm!.length > 0, isTrue);
        expect(abi.abi, isNotNull);
      });
    });

    test('Get Block', () {
      client.getBlock('43743575').then((Block block) {
        expect(block.blockNum! > 0, isTrue);
        expect(block.producer, 'zbeosbp11111');
        expect(block.confirmed, 0);
        expect(block.transactionMRoot,
            '8fb685526d58dfabd05989b45b8576197acc1be59d753bb396386d5d718f9fa9');
        expect(block.transactions!.length > 10, isTrue);
      });
    });

    test('Get Account', () {
      client.getAccount('eosio.stake').then((Account account) {
        expect(account.accountName, equals('eosio.stake'));
        expect(account.coreLiquidBalance!.amount! > 0, isTrue);
      });
    });

    test('Get currency balance', () {
      client
          .getCurrencyBalance('parslseed123', 'newdexpocket', 'SEED')
          .then((List<Holding> tokens) {
        expect(tokens.length > 0, isTrue);
        expect(tokens[0].amount! > 0, isTrue);
        expect(tokens[0].currency, 'SEED');
      });
    });

    test('Get Transaction', () {
      client
          .getTransaction(
              '8ca0fea82370a2dbbf2c4bd1026bf9fd98a57685bee3672c4ddbbc9be21de984')
          .then((TransactionBlock transaction) {
        expect(transaction.blockNum, 43743575);
        expect(transaction.trx!.receipt!.cpuUsageUs, 132);
        expect(transaction.trx!.receipt!.netUsageWords, 0);
        expect(transaction.traces!.length, 2);
        expect(transaction.traces![0].receipt!.receiver, 'trustdicelog');
        expect(transaction.traces![0].inlineTraces!.length, 1);
        expect(transaction.traces![0].inlineTraces![0].receipt!.receiver,
            'ge4tcnrxgyge');
      });
    });
  });
}
