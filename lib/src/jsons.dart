String abiJson = '''
{
    "version": "eosio::abi/1.1",
    "structs": [
        {
            "name": "extensions_entry",
            "base": "",
            "fields": [
                {
                    "name": "tag",
                    "type": "uint16"
                },
                {
                    "name": "value",
                    "type": "bytes"
                }
            ]
        },
        {
            "name": "newaccount",
            "base": "",
            "fields": [
                {
                    "name": "creator",
                    "type": "name"
                },
                {
                    "name": "name",
                    "type": "name"
                },
                {
                    "name": "owner",
                    "type": "authority"
                },
                {
                    "name": "active",
                    "type": "authority"
                }
            ]
        },
        {
            "name": "authority",
            "base": "",
            "fields": [
                {
                    "name": "threshold",
                    "type": "uint32"
                },
                {
                    "name": "keys",
                    "type": "key_weight[]"
                },
                {
                    "name": "accounts",
                    "type": "permission_level_weight[]"
                },
                {
                    "name": "waits",
                    "type": "wait_weight[]"
                }
            ]
        },
        {
            "name": "key_weight",
            "base": "",
            "fields": [
                {
                    "name": "key",
                    "type": "public_key"
                },
                {
                    "name": "weight",
                    "type": "uint16"
                }
            ]
        },
        {
            "name": "permission_level_weight",
            "base": "",
            "fields": [
                {
                    "name": "permission",
                    "type": "permission_level"
                },
                {
                    "name": "weight",
                    "type": "uint16"
                }
            ]
        },
        {
            "name": "wait_weight",
            "base": "",
            "fields": [
                {
                    "name": "wait_sec",
                    "type": "uint32"
                },
                {
                    "name": "weight",
                    "type": "uint16"
                }
            ]
        },
        {
            "name": "permission_level",
            "base": "",
            "fields": [
                {
                    "name": "actor",
                    "type": "name"
                },
                {
                    "name": "permission",
                    "type": "name"
                }
            ]
        },
        {
            "name": "buyram",
            "base": "",
            "fields": [
                {
                    "name": "payer",
                    "type": "name"
                },
                {
                    "name": "receiver",
                    "type": "name"
                },
                {
                    "name": "quant",
                    "type": "asset"
                }
            ]
        },
        {
            "name": "sellram",
            "base": "",
            "fields": [
                {
                    "name": "account",
                    "type": "name"
                },
                {
                    "name": "bytes",
                    "type": "int64"
                }
            ]
        },
        {
            "name": "delegatebw",
            "base": "",
            "fields": [
                {
                    "name": "from",
                    "type": "name"
                },
                {
                    "name": "receiver",
                    "type": "name"
                },
                {
                    "name": "stake_net_quantity",
                    "type": "asset"
                },
                {
                    "name": "stake_cpu_quantity",
                    "type": "asset"
                },
                {
                    "name": "transfer",
                    "type": "bool"
                }
            ]
        },
        {
            "name": "undelegatebw",
            "base": "",
            "fields": [
                {
                    "name": "from",
                    "type": "name"
                },
                {
                    "name": "receiver",
                    "type": "name"
                },
                {
                    "name": "unstake_net_quantity",
                    "type": "asset"
                },
                {
                    "name": "unstake_cpu_quantity",
                    "type": "asset"
                }
            ]
        },
        {
            "name": "rentcpu",
            "base": "",
            "fields": [
                {
                    "name": "from",
                    "type": "name"
                },
                {
                    "name": "receiver",
                    "type": "name"
                },
                {
                    "name": "loan_payment",
                    "type": "asset"
                },
                {
                    "name": "loan_fund",
                    "type": "asset"
                }
            ]
        },
        {
            "name": "rentnet",
            "base": "",
            "fields": [
                {
                    "name": "from",
                    "type": "name"
                },
                {
                    "name": "receiver",
                    "type": "name"
                },
                {
                    "name": "loan_payment",
                    "type": "asset"
                },
                {
                    "name": "loan_fund",
                    "type": "asset"
                }
            ]
        },
        {
            "name": "powerup",
            "base": "",
            "fields": [
                {
                    "name": "payer",
                    "type": "name"
                },
                {
                    "name": "receiver",
                    "type": "name"
                },
                {
                    "name": "days",
                    "type": "uint32"
                },
                {
                    "name": "net_frac",
                    "type": "int64"
                },
                {
                    "name": "cpu_frac",
                    "type": "int64"
                },
                {
                    "name": "max_payment",
                    "type": "asset"
                }
            ]
        },
        {
            "name": "voteproducer",
            "base": "",
            "fields": [
                {
                    "name": "voter",
                    "type": "name"
                },
                {
                    "name": "proxy",
                    "type": "name"
                },
                {
                    "name": "producers",
                    "type": "name[]"
                }
            ]
        },
        {
            "name": "type_def",
            "base": "",
            "fields": [
                {
                    "name": "new_type_name",
                    "type": "string"
                },
                {
                    "name": "type",
                    "type": "string"
                }
            ]
        },
        {
            "name": "field_def",
            "base": "",
            "fields": [
                {
                    "name": "name",
                    "type": "string"
                },
                {
                    "name": "type",
                    "type": "string"
                }
            ]
        },
        {
            "name": "struct_def",
            "base": "",
            "fields": [
                {
                    "name": "name",
                    "type": "string"
                },
                {
                    "name": "base",
                    "type": "string"
                },
                {
                    "name": "fields",
                    "type": "field_def[]"
                }
            ]
        },
        {
            "name": "action_def",
            "base": "",
            "fields": [
                {
                    "name": "name",
                    "type": "name"
                },
                {
                    "name": "type",
                    "type": "string"
                },
                {
                    "name": "ricardian_contract",
                    "type": "string"
                }
            ]
        },
        {
            "name": "table_def",
            "base": "",
            "fields": [
                {
                    "name": "name",
                    "type": "name"
                },
                {
                    "name": "index_type",
                    "type": "string"
                },
                {
                    "name": "key_names",
                    "type": "string[]"
                },
                {
                    "name": "key_types",
                    "type": "string[]"
                },
                {
                    "name": "type",
                    "type": "string"
                }
            ]
        },
        {
            "name": "clause_pair",
            "base": "",
            "fields": [
                {
                    "name": "id",
                    "type": "string"
                },
                {
                    "name": "body",
                    "type": "string"
                }
            ]
        },
        {
            "name": "error_message",
            "base": "",
            "fields": [
                {
                    "name": "error_code",
                    "type": "uint64"
                },
                {
                    "name": "error_msg",
                    "type": "string"
                }
            ]
        },
        {
            "name": "variant_def",
            "base": "",
            "fields": [
                {
                    "name": "name",
                    "type": "string"
                },
                {
                    "name": "types",
                    "type": "string[]"
                }
            ]
        },
        {
            "name": "abi_def",
            "base": "",
            "fields": [
                {
                    "name": "version",
                    "type": "string"
                },
                {
                    "name": "types",
                    "type": "type_def[]"
                },
                {
                    "name": "structs",
                    "type": "struct_def[]"
                },
                {
                    "name": "actions",
                    "type": "action_def[]"
                },
                {
                    "name": "tables",
                    "type": "table_def[]"
                },
                {
                    "name": "ricardian_clauses",
                    "type": "clause_pair[]"
                },
                {
                    "name": "error_messages",
                    "type": "error_message[]"
                },
                {
                    "name": "abi_extensions",
                    "type": "extensions_entry[]"
                },
                {
                    "name": "variants",
                    "type": "variant_def[]\$"
                }
            ]
        }
    ]
}
''';

String transactionJson = '''
{
    "version": "eosio::abi/1.0",
    "types": [
        {
            "new_type_name": "account_name",
            "type": "name"
        },
        {
            "new_type_name": "action_name",
            "type": "name"
        },
        {
            "new_type_name": "permission_name",
            "type": "name"
        }
    ],
    "structs": [
        {
            "name": "permission_level",
            "base": "",
            "fields": [
                {
                    "name": "actor",
                    "type": "account_name"
                },
                {
                    "name": "permission",
                    "type": "permission_name"
                }
            ]
        },
        {
            "name": "action",
            "base": "",
            "fields": [
                {
                    "name": "account",
                    "type": "account_name"
                },
                {
                    "name": "name",
                    "type": "action_name"
                },
                {
                    "name": "authorization",
                    "type": "permission_level[]"
                },
                {
                    "name": "data",
                    "type": "bytes"
                }
            ]
        },
        {
            "name": "extension",
            "base": "",
            "fields": [
                {
                    "name": "type",
                    "type": "uint16"
                },
                {
                    "name": "data",
                    "type": "bytes"
                }
            ]
        },
        {
            "name": "transaction_header",
            "base": "",
            "fields": [
                {
                    "name": "expiration",
                    "type": "time_point_sec"
                },
                {
                    "name": "ref_block_num",
                    "type": "uint16"
                },
                {
                    "name": "ref_block_prefix",
                    "type": "uint32"
                },
                {
                    "name": "max_net_usage_words",
                    "type": "varuint32"
                },
                {
                    "name": "max_cpu_usage_ms",
                    "type": "uint8"
                },
                {
                    "name": "delay_sec",
                    "type": "varuint32"
                }
            ]
        },
        {
            "name": "transaction",
            "base": "transaction_header",
            "fields": [
                {
                    "name": "context_free_actions",
                    "type": "action[]"
                },
                {
                    "name": "actions",
                    "type": "action[]"
                },
                {
                    "name": "transaction_extensions",
                    "type": "extension[]"
                }
            ]
        }
    ]
}
''';
