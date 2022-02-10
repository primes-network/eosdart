import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:eosdart_ecc/eosdart_ecc.dart' as ecc;
import 'package:http/http.dart' as http;

import './models/abi.dart';
import './models/account.dart';
import './models/action.dart';
import './models/action_block.dart';
import './models/block.dart';
import './models/block_header_state.dart';
import './models/node_info.dart';
import './models/primary_wrapper.dart';
import './models/transaction.dart';
import 'eosdart_base.dart';
import 'jsons.dart';
import 'serialize.dart' as ser;

/// EOSClient calls APIs against given EOS nodes
class EOSClient {
  final String _nodeURL;
  final String _version;
  late int expirationInSec;
  late int httpTimeout;
  Map<String, ecc.EOSPrivateKey> keys = Map();

  /// Converts abi files between binary and structured form (`abi.abi.json`) */
  late Map<String, Type> abiTypes;
  late Map<String, Type> transactionTypes;

  /// Construct the EOS client from eos node URL
  EOSClient(
    this._nodeURL,
    this._version, {
    this.expirationInSec = 180,
    List<String> privateKeys = const [],
    this.httpTimeout = 10,
  }) {
    _mapKeys(privateKeys);

    abiTypes = ser.getTypesFromAbi(
        ser.createInitialTypes(), Abi.fromJson(json.decode(abiJson)));
    transactionTypes = ser.getTypesFromAbi(
        ser.createInitialTypes(), Abi.fromJson(json.decode(transactionJson)));
  }

  /// Sets private keys. Required to sign transactions.
  void _mapKeys(List<String> privateKeys) {
    for (String privateKey in privateKeys) {
      ecc.EOSPrivateKey pKey = ecc.EOSPrivateKey.fromString(privateKey);
      String publicKey = pKey.toEOSPublicKey().toString();
      keys[publicKey] = pKey;
    }
  }

  set privateKeys(List<String> privateKeys) => _mapKeys(privateKeys);

  Future _post(String path, Object body) async {
    Completer completer = Completer();
    http
        .post(Uri.parse('${this._nodeURL}/${this._version}${path}'),
            body: json.encode(body))
        .timeout(Duration(seconds: this.httpTimeout))
        .then((http.Response response) {
      if (response.statusCode >= 300) {
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
      NodeInfo info = NodeInfo.fromJson(nodeInfo);
      return info;
    });
  }

  /// Get table rows (eosio get table ...)
  Future<List<Map<String, dynamic>>> getTableRows(
    String code,
    String scope,
    String table, {
    bool json = true,
    String tableKey = '',
    String lower = '',
    String upper = '',
    int indexPosition = 1,
    String keyType = '',
    int limit = 10,
    bool reverse = false,
  }) async {
    dynamic result = await this._post('/chain/get_table_rows', {
      'json': json,
      'code': code,
      'scope': scope,
      'table': table,
      'table_key': tableKey,
      'lower_bound': lower,
      'upper_bound': upper,
      'index_position': indexPosition,
      'key_type': keyType,
      'limit': limit,
      'reverse': reverse,
    });
    if (result is Map) {
      return result['rows'].cast<Map<String, dynamic>>();
    }
    return [];
  }

  /// Get table row (eosio get table ...)
  Future<Map<String, dynamic>?> getTableRow(
    String code,
    String scope,
    String table, {
    bool json = true,
    String tableKey = '',
    String lower = '',
    String upper = '',
    int indexPosition = 1,
    String keyType = '',
    bool reverse = false,
  }) async {
    var rows = await getTableRows(
      code,
      scope,
      table,
      json: json,
      tableKey: tableKey,
      lower: lower,
      upper: upper,
      indexPosition: indexPosition,
      keyType: keyType,
      limit: 1,
      reverse: reverse,
    );

    return rows.length > 0 ? rows[0] : null;
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
  Future<AbiResp> getAbi(String accountName) async {
    return this
        ._post('/chain/get_abi', {'account_name': accountName}).then((abi) {
      return AbiResp.fromJson(abi);
    });
  }

  /// Get EOS raw abi from account name
  Future<AbiResp> getRawAbi(String accountName) async {
    return this
        ._post('/chain/get_raw_abi', {'account_name': accountName}).then((abi) {
      return AbiResp.fromJson(abi);
    });
  }

  /// Get EOS raw code and abi from account name
  Future<AbiResp> getRawCodeAndAbi(String accountName) async {
    return this._post('/chain/get_raw_code_and_abi',
        {'account_name': accountName}).then((abi) {
      return AbiResp.fromJson(abi);
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
      [String? symbol]) async {
    return this._post('/chain/get_currency_balance',
        {'code': code, 'account': account, 'symbol': symbol}).then((balance) {
      return (balance as List).map((e) => new Holding.fromJson(e)).toList();
    });
  }

  /// Get required key by transaction from EOS blockchain
  Future<RequiredKeys> getRequiredKeys(
      Transaction transaction, List<String> availableKeys) async {
    NodeInfo info = await getInfo();
    Block refBlock = await getBlock((info.headBlockNum).toString());
    Transaction trx = await _fullFill(transaction, refBlock);
    trx = await _serializeActions(trx);

    // raw abi to json
//      AbiResp abiResp = await getRawAbi(account);
//    print(abiResp.abi);
    return this._post('/chain/get_required_keys', {
      'transaction': trx,
      'available_keys': availableKeys
    }).then((requiredKeys) {
      return RequiredKeys.fromJson(requiredKeys);
    });
  }

  /// Get EOS account actions
  Future<Actions> getActions(String accountName,
      {int pos = -1, int offset = -1}) async {
    return this._post('/history/get_actions', {
      'account_name': accountName,
      'pot': pos,
      'offset': offset
    }).then((actions) {
      return Actions.fromJson(actions);
    });
  }

  /// Get EOS transaction
  Future<TransactionBlock> getTransaction(String id,
      {int? blockNumHint}) async {
    return this._post('/history/get_transaction',
        {'id': id, 'block_num_hint': blockNumHint}).then((transaction) {
      return TransactionBlock.fromJson(transaction);
    });
  }

  /// Get Key Accounts
  Future<AccountNames> getKeyAccounts(String pubKey) async {
    return this._post('/history/get_key_accounts', {'public_key': pubKey}).then(
        (accountNames) {
      return AccountNames.fromJson(accountNames);
    });
  }

  /// Push transaction to EOS chain
  Future<dynamic> pushTransaction(Transaction transaction,
      {bool broadcast = true,
      bool sign = true,
      int blocksBehind = 3,
      int expireSecond = 180}) async {
    NodeInfo info = await this.getInfo();
    Block refBlock =
        await getBlock((info.headBlockNum! - blocksBehind).toString());

    Transaction trx = await _fullFill(transaction, refBlock);
    PushTransactionArgs pushTransactionArgs = await _pushTransactionArgs(
        info.chainId!, transactionTypes['transaction']!, trx, sign);

    if (broadcast) {
      return this._post('/chain/push_transaction', {
        'signatures': pushTransactionArgs.signatures,
        'compression': 0,
        'packed_context_free_data': '',
        'packed_trx': ser.arrayToHex(pushTransactionArgs.serializedTransaction),
      }).then((processedTrx) {
        return processedTrx;
      });
    }

    return pushTransactionArgs;
  }

  /// Get data needed to serialize actions in a contract */
  Future<Contract> _getContract(String accountName,
      {bool reload = false}) async {
    var abi = await getRawAbi(accountName);
    var types = ser.getTypesFromAbi(ser.createInitialTypes(), abi.abi!);
    var actions = new Map<String, Type>();
    for (var act in abi.abi!.actions!) {
      actions[act.name] = ser.getType(types, act.type);
    }
    var result = Contract(types, actions);
    return result;
  }

  /// Fill the transaction withe reference block data
  Future<Transaction> _fullFill(Transaction transaction, Block refBlock) async {
    transaction.expiration =
        refBlock.timestamp!.add(Duration(seconds: expirationInSec));
    transaction.refBlockNum = refBlock.blockNum! & 0xffff;
    transaction.refBlockPrefix = refBlock.refBlockPrefix;

    return transaction;
  }

  /// serialize actions in a transaction
  Future<Transaction> _serializeActions(Transaction transaction) async {
    for (Action action in transaction.actions!) {
      String account = action.account!;

      Contract contract = await _getContract(account);

      action.data =
          _serializeActionData(contract, account, action.name!, action.data!);
    }
    return transaction;
  }

  /// Convert action data to serialized form (hex) */
  String _serializeActionData(
      Contract contract, String account, String name, Object data) {
    var action = contract.actions[name];
    if (action == null) {
      throw "Unknown action $name in contract $account";
    }
    var buffer = new ser.SerialBuffer(Uint8List(0));
    action.serialize?.call(action, buffer, data);
    return ser.arrayToHex(buffer.asUint8List());
  }

//  Future<List<AbiResp>> _getTransactionAbis(Transaction transaction) async {
//    Set<String> accounts = Set();
//    List<AbiResp> result = [];
//
//    for (Action action in transaction.actions) {
//      accounts.add(action.account);
//    }
//
//    for (String accountName in accounts) {
//      result.add(await this.getRawAbi(accountName));
//    }
//  }

  Future<PushTransactionArgs> _pushTransactionArgs(String chainId,
      Type transactionType, Transaction transaction, bool sign) async {
    List<String> signatures = [];

    RequiredKeys requiredKeys =
        await getRequiredKeys(transaction, this.keys.keys.toList());

    Uint8List serializedTrx = transaction.toBinary(transactionType);

    if (sign) {
      Uint8List signBuf = Uint8List.fromList(List.from(ser.stringToHex(chainId))
        ..addAll(serializedTrx)
        ..addAll(Uint8List(32)));

      for (String publicKey in requiredKeys.requiredKeys!) {
        ecc.EOSPrivateKey pKey = this.keys[publicKey]!;
        signatures.add(pKey.sign(signBuf).toString());
      }
    }

    return PushTransactionArgs(signatures, serializedTrx);
  }
}

class PushTransactionArgs {
  List<String> signatures;
  Uint8List serializedTransaction;

  PushTransactionArgs(this.signatures, this.serializedTransaction);
}
