import 'package:eosdart/eosdart.dart';

main() {
//  EOSClient client = EOSClient('https://eos.greymass.com', 'v1');
  EOSClient client = EOSClient('http://127.0.0.1:8888', 'v1');

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

  List<String> availableKeys = [
    "EOS5hF6jM5otV3jYdLVWqQ2Lidpb7LtN8dsXsFHFocggzvfGHGfR1"
  ];
  client.getRequiredKeys(transaction, availableKeys);

//  // Get EOS Node Info
//  client.getInfo().then((NodeInfo nodeInfo) {
//    print(nodeInfo);
//  });
//
//  // Get EOS Abi
//  client.getAbi('eosio.token').then((Abi abi) {
//    print(abi);
//  });
//
//  // Get EOS Raw Abi
//  client.getRawAbi('eosio.token').then((Abi abi) {
//    print(abi);
//  });
//
//  // Get EOS Raw code and Abi
//  client.getRawCodeAndAbi('eosio.token').then((Abi abi) {
//    print(abi);
//  });
//
//  // Get EOS Block Info
//  client.getBlock('298674').then((Block block) {
//    print(block);
//  });
//
//  // Get Account Info
//  client.getAccount('eosio.token').then((Account account) {
//    print(account);
//  });
//
//  // Get Account Actions
//  client.getActions('eosio.token', pos: -1, offset: -1).then((Actions actions) {
//    print(actions);
//  });
//
//  // Get Transaction
//  client
//      .getTransaction(
//          '83875faeb054ba20b20f392418e3a0002c4bb1c36cc4e3fde15cbd0963da8a15')
//      .then((Transaction transaction) {
//    print(transaction);
//  });
//
//  // Get Accounts from public key
//  client
//      .getKeyAccounts('EOS8RWQpzzMi5uFXXXAChi4dHnyxMYKKdAQ3Y3pHQTrvhzGk95LbT')
//      .then((AccountNames accountNames) {
//    print(accountNames);
//  });
//
//  // Get currency balance
//  client
//      .getCurrencyBalance('parslseed123', 'newdexpocket')
//      .then((List<Holding> balance) {
//    print(balance);
//  });
}
