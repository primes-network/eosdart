import 'package:eosdart/eosdart.dart';

main() async {
  EOSClient client = EOSClient('https://eos.greymass.com', 'v1');

  // Get Tables
  client.getTableRows('eosio', 'eosio', 'abihash').then((rows) => print(rows));
  client.getTableRow('eosio', 'eosio', 'abihash').then((row) => print(row));
}
