import 'package:eosdart/eosdart.dart';

main() {
  EOSClient client = EOSClient('http://127.0.0.1:8888', 'v1',
      privateKeys: ["5J9b3xMkbvcT6gYv2EpQ8FD4ZBjgypuNKwE1jxkd7Wd1DYzhk88"]);

  List<Authorization> auth = [
    Authorization()
      ..actor = 'bob'
      ..permission = 'active'
  ];

  Map data = {
    'from': 'bob',
    'to': 'alice',
    'quantity': '0.0001 SYS',
    'memo': '',
  };

  List<Action> actions = [
    Action()
      ..account = 'eosio.token'
      ..name = 'transfer'
      ..authorization = auth
      ..data = data
  ];

  Transaction transaction = Transaction()..actions = actions;

  client
      .pushTransaction(transaction, broadcast: false)
      .then((pushTransactionArgs) {
    print(pushTransactionArgs.signatures);
    print(pushTransactionArgs.serializedTransaction);
  });
}
