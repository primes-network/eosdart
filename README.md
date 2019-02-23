# eosdart

[![Build Status](https://travis-ci.com/primes-network/eosdart.svg?branch=master)](https://travis-ci.com/primes-network/eosdart)

A library for EOS Node API

It talks to the EOS nodes by the given endpoint and API method.

## Usage

A simple usage example:

```dart
import 'package:eosdart/eosdart.dart';

main() async {
  EOSClient client = EOSClient('https://eos.greymass.com', 'v1');

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

  // Get Transaction
  await client
      .getTransaction(
          '83875faeb054ba20b20f392418e3a0002c4bb1c36cc4e3fde15cbd0963da8a15')
      .then((Transaction transaction) {
    print(transaction);
  });
}

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/primes-network/eosdart/issues
