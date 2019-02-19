# eosdart
=======

A library for EOS Node API

It talks to the EOS nodes by the given endpoint and API method.

## Usage

A simple usage example:

```dart
import 'package:eosdart/eosdart.dart';

main() async {
  EOSClient client = EOSClient.fromNode('https://node.eosflare.io');

  await client.getAccount('eosio.stake').then((Account account) {
    print(account);
  });
}

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/primes-network/eosdart/issues
