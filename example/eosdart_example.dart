import 'package:eosdart/eosdart.dart';

main() async {
  EOSClient client = EOSClient.fromNode('https://node.eosflare.io');

  await client.getAccount('eosio.stake').then((Account account) {
    print(account);
  });
}
