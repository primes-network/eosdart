import 'package:eosdart/eosdart.dart';

main() {
  EOSClient client = EOSClient('https://jungle3.cryptolions.io', 'v1',
      privateKeys: ["5J9b3xMkbvcT6gYv2EpQ8FD4ZBjgypuNKwE1jxkd7Wd1DYzhk88"]);

  //privateKeys can also be set after client was constructed, as following
  //client.privateKeys = ["5J9b3xMkbvcT6gYv2EpQ8FD4ZBjgypuNKwE1jxkd7Wd1DYzhk88"];

  List<Authorization> auth = [
    Authorization()
      ..actor = 'xuelongqy2cn'
      ..permission = 'active'
  ];

  Map data = {
    'creator': 'xuelongqy2cn',
    'name': 'xuelongqy3cn',
    'owner': {
      'threshold': 1,
      'keys': [
        {
          'key': "EOS65xaKR6zw4cjy9kuwuCbi7vTTbWNYSHdVgNf7492VAjCPi6gT6",
          'weight': 1,
        }
      ],
      'accounts': [],
      'waits': []
    },
    'active': {
      'threshold': 1,
      'keys': [
        {
          'key': "EOS65xaKR6zw4cjy9kuwuCbi7vTTbWNYSHdVgNf7492VAjCPi6gT6",
          'weight': 1,
        }
      ],
      'accounts': [],
      'waits': []
    },
  };

  List<Action> actions = [
    Action()
      ..account = 'eosio'
      ..name = 'newaccount'
      ..authorization = auth
      ..data = data,
    Action()
      ..account = 'eosio'
      ..name = 'buyram'
      ..authorization = auth
      ..data = {
        'payer': "xuelongqy2cn",
        'receiver': "xuelongqy3cn",
        'quant': "2.0000 EOS",
      },
    Action()
      ..account = 'eosio'
      ..name = 'delegatebw'
      ..authorization = auth
      ..data = {
        'from': "xuelongqy2cn",
        'receiver': "xuelongqy3cn",
        'stake_net_quantity': "1.0000 EOS",
        'stake_cpu_quantity': "1.0000 EOS",
        'transfer': false,
      }
  ];

  Transaction transaction = Transaction()..actions = actions;

  // print result
  client.pushTransaction(transaction, broadcast: true).then((trx) {
    print(trx);
  });
}
