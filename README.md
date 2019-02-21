# eosdart

[![Build Status](https://travis-ci.com/primes-network/eosdart.svg?branch=master)](https://travis-ci.com/primes-network/eosdart)

A library for EOS Node API

It talks to the EOS nodes by the given endpoint and API method.

## Usage

A simple usage example:

```dart
import 'package:eosdart/eosdart.dart';

main() async {
  EOSClient client = EOSClient('https://node.eosflare.io', 'v1');

  // Get EOS Node Info
  await client.getInfo().then((NodeInfo nodeInfo) {
    print(nodeInfo);
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

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/primes-network/eosdart/issues
