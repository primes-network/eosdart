import 'package:eosdart/eosdart.dart';

main() async {
  EOSClient client = EOSClient('https://node.eosflare.io', 'v1');

  // Get EOS Node Info
  await client.getInfo().then((NodeInfo nodeInfo) {
    print(nodeInfo);
  });

  // Get EOS Block Info
  await client.getBlock('351').then((Block block) {
    print(block);
  });

  // Get Account Info
  await client.getAccount('eosio.stake').then((Account account) {
    print(account);
  });

  // Get Account Actions
  await client
      .getActions('eosio.stake', pos: -1, offset: -1)
      .then((Actions actions) {
    print(actions);
  });
}
