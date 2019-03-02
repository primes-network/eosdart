import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import './models/abi.dart';
import './models/node_info.dart';
import './models/account.dart';
import './models/block.dart';
import './models/action.dart';
import './models/transaction.dart';
import './models/account_names.dart';
import './models/block_header_state.dart';

/// EOSClient calls APIs against given EOS nodes
class EOSClient {
  final String _nodeURL;
  final String _version;

  /// Construct the EOS client from eos node URL
  EOSClient(this._nodeURL, this._version);

  Future _post(String path, Object body) async {
    Completer completer = Completer();
    http
        .post('${this._nodeURL}/${this._version}${path}',
            body: json.encode(body))
        .then((http.Response response) {
      if (response.statusCode != 200) {
        completer.completeError(response.body);
      } else {
        completer.complete(json.decode(response.body));
      }
    });
    return completer.future;
  }

  /// Get EOS Node Info
  Future<NodeInfo> getInfo() async {
    return this._post('/chain/get_info', {}).then((nodeInfo) {
      return NodeInfo.fromJson(nodeInfo);
    });
  }

  /// Get EOS Block Info
  Future<Block> getBlock(String blockNumOrId) async {
    return this._post(
        '/chain/get_block', {'block_num_or_id': blockNumOrId}).then((block) {
      return Block.fromJson(block);
    });
  }

  /// Get EOS Block Header State
  Future<BlockHeaderState> getBlockHeaderState(String blockNumOrId) async {
    return this._post('/chain/get_block_header_state',
        {'block_num_or_id': blockNumOrId}).then((block) {
      return BlockHeaderState.fromJson(block);
    });
  }

  /// Get EOS abi from account name
  Future<Abi> getAbi(String accountName) async {
    return this
        ._post('/chain/get_abi', {'account_name': accountName}).then((abi) {
      return Abi.fromJson(abi);
    });
  }

  /// Get EOS raw abi from account name
  Future<Abi> getRawAbi(String accountName) async {
    return this
        ._post('/chain/get_raw_abi', {'account_name': accountName}).then((abi) {
      return Abi.fromJson(abi);
    });
  }

  /// Get EOS raw code and abi from account name
  Future<Abi> getRawCodeAndAbi(String accountName) async {
    return this._post('/chain/get_raw_code_and_abi',
        {'account_name': accountName}).then((abi) {
      return Abi.fromJson(abi);
    });
  }

  /// Get EOS account info form the given account name
  Future<Account> getAccount(String accountName) async {
    return this._post('/chain/get_account', {'account_name': accountName}).then(
        (account) {
      return Account.fromJson(account);
    });
  }

  /// Get EOS account info form the given account name
  Future<List<Holding>> getCurrencyBalance(String code, String account,
      [String symbol]) async {
    return this._post('/chain/get_currency_balance',
        {'code': code, 'account': account, 'symbol': symbol}).then((balance) {
      return (balance as List).map((e) => new Holding.fromJson(e)).toList();
    });
  }

  /// Get EOS account actions
  Future<Actions> getActions(String accountName, {int pos, int offset}) async {
    return this._post('/history/get_actions', {
      'account_name': accountName,
      'pot': pos,
      'offset': offset
    }).then((actions) {
      return Actions.fromJson(actions);
    });
  }

  /// Get EOS transaction
  Future<Transaction> getTransaction(String id, {int blockNumHint}) async {
    return this._post('/history/get_transaction',
        {'id': id, 'block_num_hint': blockNumHint}).then((transaction) {
      return Transaction.fromJson(transaction);
    });
  }

  /// Get Key Accounts
  Future<AccountNames> getKeyAccounts(String pubKey) async {
    return this._post('/history/get_key_accounts', {'public_key': pubKey}).then(
        (accountNames) {
      return AccountNames.fromJson(accountNames);
    });
  }
}
