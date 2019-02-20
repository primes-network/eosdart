import 'package:eosdart/eosdart.dart';

main() async {
  EOSClient client = EOSClient('http://localhost:8888');

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
}
