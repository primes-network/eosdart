import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import './models/account.dart';
import './models/node_info.dart';
import './models/block.dart';
import './models/action.dart';
import './models/transaction.dart';

/// EOSClient calls APIs against given EOS nodes
class EOSClient {
  final String _nodeURL;
  final String _version;

  /// Construct the EOS client from eos node URL
  EOSClient(this._nodeURL, this._version);

  Future<Map<String, dynamic>> _post(String path, Object body) async {
    Completer<Map<String, dynamic>> completer = Completer();
    http
        .post('${this._nodeURL}/${this._version}${path}',
            body: json.encode(body))
        .then((http.Response response) {
      if (response.statusCode != 200) {
        throw response.body;
      } else {
        Map<String, dynamic> respJson = json.decode(response.body);
        completer.complete(respJson);
      }
    });
    return completer.future;
  }

  /// Get EOS Node Info
  Future<NodeInfo> getInfo() async {
    Completer<NodeInfo> completer = Completer();
    this._post('/chain/get_info', {}).then((Map<String, dynamic> nodeInfo) {
      completer.complete(NodeInfo.fromJson(nodeInfo));
    });
    return completer.future;
  }

  /// Get EOS Block Info
  Future<Block> getBlock(String blockNumOrId) async {
    Completer<Block> completer = Completer();
    this._post('/chain/get_block', {'block_num_or_id': blockNumOrId}).then(
        (Map<String, dynamic> block) {
      completer.complete(Block.fromJson(block));
    });
    return completer.future;
  }

  /// Get EOS abi from account name
  Future<Account> getAbi(String accountName) async {
    Completer<Account> completer = Completer();
    this._post('/chain/get_abi', {'account_name': accountName}).then(
        (Map<String, dynamic> account) {
      completer.complete(Account.fromJson(account));
    });
    return completer.future;
  }

  /// Get EOS account info form the given account name
  Future<Account> getAccount(String accountName) async {
    Completer<Account> completer = Completer();
    this._post('/chain/get_account', {'account_name': accountName}).then(
        (Map<String, dynamic> account) {
      completer.complete(Account.fromJson(account));
    });
    return completer.future;
  }

  /// Get EOS account actions
  Future<Actions> getActions(String accountName, {int pos, int offset}) async {
    Completer<Actions> completer = Completer();
    this._post('/history/get_actions', {
      'account_name': accountName,
      'pot': pos,
      'offset': offset
    }).then((Map<String, dynamic> actions) {
      completer.complete(Actions.fromJson(actions));
    });
    return completer.future;
  }

  /// Get EOS transaction
  Future<Transaction> getTransaction(String id, {int blockNumHint}) async {
    Completer<Transaction> completer = Completer();
    this._post('/history/get_transaction', {
      'id': id,
      'block_num_hint': blockNumHint
    }).then((Map<String, dynamic> transaction) {
      completer.complete(Transaction.fromJson(transaction));
    });
    return completer.future;
  }
}
