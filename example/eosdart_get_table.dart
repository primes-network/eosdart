import 'package:eosdart/eosdart.dart';

main() async {
  EOSClient client = EOSClient('https://eos.greymass.com', 'v1');

  // Get Tables
  var rows = await client.getTableRows(
      code: 'eosio', scope: 'eosio', table: 'abihash');
  print(rows);

  var row =
      await client.getTableRow(code: 'eosio', scope: 'eosio', table: 'abihash');
  print(row);
}
