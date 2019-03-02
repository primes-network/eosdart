import 'package:eosdart/eosdart.dart';

main() async {
  EOSClient client = EOSClient('https://eos.greymass.com', 'v1');

  // Get EOS Node Info
  client.getInfo().then((NodeInfo nodeInfo) {
    print(nodeInfo);
  });

  // Get EOS Abi
  client.getAbi('eosio.token').then((Abi abi) {
    print(abi);
  });

  // Get EOS Raw Abi
  client.getRawAbi('eosio.token').then((Abi abi) {
    print(abi);
  });

  // Get EOS Raw code and Abi
  client.getRawCodeAndAbi('eosio.token').then((Abi abi) {
    print(abi);
  });

  // Get EOS Block Info
  client.getBlock('351').then((Block block) {
    print(block);
  });

  // Get Account Info
  client.getAccount('eosio.stake').then((Account account) {
    print(account);
  });

  // Get Account Actions
  client.getActions('eosio.stake', pos: -1, offset: -1).then((Actions actions) {
    print(actions);
  });

  // Get Transaction
  client
      .getTransaction(
          '83875faeb054ba20b20f392418e3a0002c4bb1c36cc4e3fde15cbd0963da8a15')
      .then((Transaction transaction) {
    print(transaction);
  });

  // Get Accounts from public key
  client
      .getKeyAccounts('EOS8RWQpzzMi5uFXXXAChi4dHnyxMYKKdAQ3Y3pHQTrvhzGk95LbT')
      .then((AccountNames accountNames) {
    print(accountNames);
  });

  // Get currency balance
  client
      .getCurrencyBalance('parslseed123', 'newdexpocket')
      .then((List<Holding> balance) {
    print(balance);
  });
}
