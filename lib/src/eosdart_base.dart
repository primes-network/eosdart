import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import './models/account.dart';
import './models/node_info.dart';

/// EOSClient calls APIs against given EOS nodes
class EOSClient {
  final String _nodeURL;

  /// Construct the EOS client from eos node URL
  EOSClient(this._nodeURL);

  Future<Map<String, dynamic>> _post(String path, Object body) async {
    Completer<Map<String, dynamic>> completer = Completer();
    http
        .post('${this._nodeURL}${path}', body: json.encode(body))
        .then((http.Response response) {
      Map<String, dynamic> respJson = json.decode(response.body);
      completer.complete(respJson);
    });
    return completer.future;
  }

  /// Get EOS Node Info
  Future<NodeInfo> getInfo() async {
    Completer<NodeInfo> completer = Completer();
    this._post('/v1/chain/get_info', {}).then((Map<String, dynamic> nodeInfo) {
      completer.complete(NodeInfo.fromJson(nodeInfo));
    });
    return completer.future;
  }

  /// Get EOS abi from account name
  Future<Account> getAbi(String accountName) async {
    Completer<Account> completer = Completer();
    this._post('/v1/chain/get_abi', {'account_name': accountName}).then(
        (Map<String, dynamic> account) {
      completer.complete(Account.fromJson(account));
    });
    return completer.future;
  }

  /// Get EOS account info form the given account name
  Future<Account> getAccount(String accountName) async {
    Completer<Account> completer = Completer();
    this._post('/v1/chain/get_account', {'account_name': accountName}).then(
        (Map<String, dynamic> account) {
      completer.complete(Account.fromJson(account));
    });
    return completer.future;
  }
}
