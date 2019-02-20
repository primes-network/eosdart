import 'package:eosdart/eosdart.dart';

main() async {
  EOSClient client = EOSClient('https://node.eosflare.io');

  // Get EOS Node Info
  await client.getInfo().then((NodeInfo nodeInfo) {
    print(nodeInfo);
  });

  // Get Account Info
  await client.getAccount('eosio.stake').then((Account account) {
    print(account);
  });
}
