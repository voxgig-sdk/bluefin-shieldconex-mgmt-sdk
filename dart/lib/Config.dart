import 'feature/base/BaseFeature.dart';
import 'feature/audit/AuditFeature.dart';
import 'feature/clienttrack/ClienttrackFeature.dart';
import 'feature/debug/DebugFeature.dart';
import 'feature/idempotency/IdempotencyFeature.dart';
import 'feature/log/LogFeature.dart';
import 'feature/metrics/MetricsFeature.dart';
import 'feature/paging/PagingFeature.dart';
import 'feature/ratelimit/RatelimitFeature.dart';
import 'feature/retry/RetryFeature.dart';
import 'feature/telemetry/TelemetryFeature.dart';
import 'feature/test/TestFeature.dart';
import 'feature/timeout/TimeoutFeature.dart';



// ignore: non_constant_identifier_names
final Map<String, BaseFeature Function()> FEATURE_CLASS = {
    'audit': () => AuditFeature(),
  'clienttrack': () => ClienttrackFeature(),
  'debug': () => DebugFeature(),
  'idempotency': () => IdempotencyFeature(),
  'log': () => LogFeature(),
  'metrics': () => MetricsFeature(),
  'paging': () => PagingFeature(),
  'ratelimit': () => RatelimitFeature(),
  'retry': () => RetryFeature(),
  'telemetry': () => TelemetryFeature(),
  'test': () => TestFeature(),
  'timeout': () => TimeoutFeature(),

};

// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. The named `show` imports above make each definition statically
// reachable, so an SDK carries exactly the plugin libraries its model
// selects - the same leanness the old side-effect registry bought, without
// a registry.
//
// Emitted UNCONDITIONALLY, empty when no group is active: SecretsFeature
// imports this name, and the feature source can be present in a tree whose
// model selects no plugin group at all. An emission conditional on the map
// having entries would make that tree fail `dart analyze`.
//
// ignore: non_constant_identifier_names
final Map<String, List<dynamic>> FEATURE_PLUGINS = <String, List<dynamic>>{
  
};

class Config {
  BaseFeature makeFeature(String fn) {
    final fc = FEATURE_CLASS[fn];
    if (null == fc) {
      // TODO: errors etc
      throw StateError('Unknown feature: ' + fn);
    }
    return fc();
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  bool hasFeature(String fn) => null != FEATURE_CLASS[fn];

  final Map<String, dynamic> main = <String, dynamic>{
    'name': 'BluefinShieldconexMgmt',
        'slug': 'bluefin-shieldconex-mgmt',
    'version': '0.1.1',
    'target': 'dart',

  };

  final Map<String, dynamic> feature = <String, dynamic>{
        'audit': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'actor': 'anonymous',
        'max': 1000,
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'sink': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'clienttrack': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'clientVersion': '0.0.1',
      },
      'optspec': <String, dynamic>{
        'clientName': '`\$STRING`',
        'clientVersion': '`\$STRING`',
        'headers': '`\$MAP`',
        'idgen': '`\$FUNCTION`',
        'sessionId': '`\$STRING`',
      },
      'strict': false,
      'transport': 'none',
    },
    'debug': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'max': 100,
        'redact': <dynamic>[
          'authorization',
          'cookie',
          'set-cookie',
          'api-key',
          'apikey',
          'x-api-key',
          'idempotency-key',
        ],
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'onEntry': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'idempotency': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'header': 'Idempotency-Key',
        'methods': <dynamic>[
          'POST',
          'PUT',
          'PATCH',
          'DELETE',
        ],
        'ops': <dynamic>[
          'create',
          'update',
          'remove',
        ],
      },
      'optspec': <String, dynamic>{
        'keygen': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'log': <String, dynamic>{
      'options': <String, dynamic>{
        'active': true,
      },
      'optspec': <String, dynamic>{
        'level': '`\$STRING`',
        'logger': '`\$ANY`',
      },
      'strict': false,
      'transport': 'none',
    },
    'metrics': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'paging': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'afterVar': 'after',
        'cursorParam': 'cursor',
        'firstVar': 'first',
        'limitParam': 'limit',
        'pageParam': 'page',
        'startPage': 1,
      },
      'optspec': <String, dynamic>{
        'limit': '`\$NUMBER`',
        'ops': '`\$LIST`',
      },
      'strict': false,
      'transport': 'none',
    },
    'ratelimit': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'burst': 5,
        'rate': 5,
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'sleep': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'wrap',
    },
    'retry': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'factor': 2,
        'maxDelay': 2000,
        'minDelay': 50,
        'retries': 2,
        'statuses': <dynamic>[
          408,
          425,
          429,
          500,
          502,
          503,
          504,
        ],
      },
      'optspec': <String, dynamic>{
        'jitter': '`\$BOOLEAN`',
        'sleep': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'wrap',
    },
    'telemetry': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'exporter': '`\$FUNCTION`',
        'headers': '`\$MAP`',
        'idgen': '`\$FUNCTION`',
        'now': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'entity': '`\$MAP`',
        'net': '`\$MAP`',
      },
      'strict': false,
      'transport': 'base',
    },
    'timeout': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'ms': 30000,
      },
      'optspec': <String, dynamic>{
        'clearTimer': '`\$FUNCTION`',
        'setTimer': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'wrap',
    },

  };

  // Rendered whole from the canonical config definition rather than assembled
  // slot by slot. Assembling it here meant `options.server` - the OpenAPI
  // server-variable defaults - was simply absent from this branch, so a
  // templated server URL produced a different config either side of the
  // threshold.
  final Map<String, dynamic> options = <String, dynamic>{
    'base': 'https://portal-cert.shieldconex.com:4010/api/v1',
    'auth': <String, dynamic>{
      'prefix': 'Basic',
      'basic': true,
    },
    'headers': <String, dynamic>{
      'content-type': 'application/json',
    },
    'entity': <String, dynamic>{
      'client': <String, dynamic>{},
      'clone': <String, dynamic>{},
      'partner': <String, dynamic>{},
      'template': <String, dynamic>{},
      'transaction': <String, dynamic>{},
      'update_result': <String, dynamic>{},
      'user': <String, dynamic>{},
    },
  };

  final Map<String, dynamic> entity = <String, dynamic>{
    'client': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'billingId',
          'title': 'Billing Id',
          'type': '`\$STRING`',
          'short': 'Billing ID',
        },
        <String, dynamic>{
          'name': 'contact',
          'title': 'Contact',
          'type': '`\$OBJECT`',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
            'list': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'title': 'Direct Partner',
          'type': '`\$OBJECT`',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'This resource\'s unique identifier.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'isActive',
          'title': 'Is Active',
          'type': '`\$BOOLEAN`',
          'short': 'This property indicates if the Client account is active or disabled.',
        },
        <String, dynamic>{
          'name': 'mid',
          'title': 'Mid',
          'type': '`\$STRING`',
          'short': 'Some Partners will have an merchant ids on their own software offerings.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$STRING`',
            },
          },
          'short': 'The Client\'s name.',
        },
        <String, dynamic>{
          'name': 'partner',
          'title': 'Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'client',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/clients',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
              ],
              'parts': <dynamic>[
                'clients',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'billing_id',
                    'orig': 'billing_id',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'contact_email',
                    'orig': 'contact_email',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_first_name',
                    'orig': 'contact_first_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_is_active',
                    'orig': 'contact_is_active',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_last_name',
                    'orig': 'contact_last_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_phone',
                    'orig': 'contact_phone',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_send_welcome_email',
                    'orig': 'contact_send_welcome_email',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_user_name',
                    'orig': 'contact_user_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_user_role',
                    'orig': 'contact_user_role',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'direct_partner_id',
                    'orig': 'direct_partner_id',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'direct_partner_name',
                    'orig': 'direct_partner_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'is_active',
                    'orig': 'is_active',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'mid',
                    'orig': 'mid',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'name',
                    'orig': 'name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'billing_id',
                  'contact_email',
                  'contact_first_name',
                  'contact_is_active',
                  'contact_last_name',
                  'contact_phone',
                  'contact_send_welcome_email',
                  'contact_user_name',
                  'contact_user_role',
                  'direct_partner_id',
                  'direct_partner_name',
                  'is_active',
                  'mid',
                  'name',
                ],
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/clients',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
              ],
              'parts': <dynamic>[
                'clients',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'partner',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/clients/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/clients/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'clone': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'Unique identifier of newly added element.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'Name of Template',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'clone',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/templates/{id}/clone',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'templates',
                },
                <String, dynamic>{
                  'var': 'template_id',
                },
                <String, dynamic>{
                  'lit': 'clone',
                },
              ],
              'parts': <dynamic>[
                'templates',
                '{template_id}',
                'clone',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'id': 'template_id',
                },
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'template_id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'template_id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            '\$.main.kit.entity.template',
          ],
        ],
      },
    },
    'partner': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'billingId',
          'title': 'Billing Id',
          'type': '`\$STRING`',
          'short': 'The Partner\'s billing identifier.',
        },
        <String, dynamic>{
          'name': 'contact',
          'title': 'Contact',
          'type': '`\$OBJECT`',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
            'list': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'This resource\'s unique identifier.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'isActive',
          'title': 'Is Active',
          'type': '`\$BOOLEAN`',
          'short': 'This property indicates if the Parter account is active or disabled.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$STRING`',
            },
          },
          'short': 'The Partner\'s name.',
        },
        <String, dynamic>{
          'name': 'parent',
          'title': 'Parent',
          'type': '`\$OBJECT`',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'reference',
          'title': 'Reference',
          'type': '`\$STRING`',
          'short': 'The Partner\'s reference string.',
        },
        <String, dynamic>{
          'name': 'verificationPhrase',
          'title': 'Verification Phrase',
          'type': '`\$STRING`',
          'short': 'The verification phrase is a message that the Partner creates.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'partner',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/partners',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'partners',
                },
              ],
              'parts': <dynamic>[
                'partners',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'billing_id',
                    'orig': 'billing_id',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_email',
                    'orig': 'contact_email',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_first_name',
                    'orig': 'contact_first_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_is_active',
                    'orig': 'contact_is_active',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_last_name',
                    'orig': 'contact_last_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_phone',
                    'orig': 'contact_phone',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_send_welcome_email',
                    'orig': 'contact_send_welcome_email',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_user_name',
                    'orig': 'contact_user_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'contact_user_role',
                    'orig': 'contact_user_role',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'is_active',
                    'orig': 'is_active',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'name',
                    'orig': 'name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'parent_id',
                    'orig': 'parent_id',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'parent_name',
                    'orig': 'parent_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'reference',
                    'orig': 'reference',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'verification_phrase',
                    'orig': 'verification_phrase',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'billing_id',
                  'contact_email',
                  'contact_first_name',
                  'contact_is_active',
                  'contact_last_name',
                  'contact_phone',
                  'contact_send_welcome_email',
                  'contact_user_name',
                  'contact_user_role',
                  'is_active',
                  'name',
                  'parent_id',
                  'parent_name',
                  'reference',
                  'verification_phrase',
                ],
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/partners',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'partners',
                },
              ],
              'parts': <dynamic>[
                'partners',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'partner',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/partners/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'partners',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'partners',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'template': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'accessMode',
          'title': 'Access Mode',
          'type': '`\$ANY`',
          'short': 'The Template\'s access mode.',
        },
        <String, dynamic>{
          'name': 'active',
          'title': 'Active',
          'type': '`\$BOOLEAN`',
          'short': 'This property indicates if the Template is active or inactive.',
        },
        <String, dynamic>{
          'name': 'client',
          'title': 'Client',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Client resource.',
        },
        <String, dynamic>{
          'name': 'fieldTemplates',
          'title': 'Field Templates',
          'type': '`\$ARRAY`',
          'short': 'Field Template list items',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'Unique identifier of newly added element.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'The Template\'s name.',
        },
        <String, dynamic>{
          'name': 'options',
          'title': 'Options',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'partner',
          'title': 'Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'reference',
          'title': 'Reference',
          'type': '`\$STRING`',
          'short': 'The Template\'s unique reference.',
        },
        <String, dynamic>{
          'name': 'type',
          'title': 'Type',
          'type': '`\$STRING`',
          'short': 'The Template\'s type.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'template',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/templates',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'templates',
                },
              ],
              'parts': <dynamic>[
                'templates',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'access_mode',
                    'orig': 'access_mode',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'active',
                    'orig': 'active',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'client_id',
                    'orig': 'client_id',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'client_name',
                    'orig': 'client_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'field_template',
                    'orig': 'field_template',
                    'type': '`\$ARRAY`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'name',
                    'orig': 'name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'options_custom_style',
                    'orig': 'options_custom_style',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'options_custom_style_file',
                    'orig': 'options_custom_style_file',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'options_domain',
                    'orig': 'options_domain',
                    'type': '`\$ARRAY`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'options_security_active_from',
                    'orig': 'options_security_active_from',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'options_security_active_to',
                    'orig': 'options_security_active_to',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'options_security_irreversible',
                    'orig': 'options_security_irreversible',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'partner_id',
                    'orig': 'partner_id',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'partner_name',
                    'orig': 'partner_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'reference',
                    'orig': 'reference',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'type',
                    'orig': 'type',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'version',
                    'orig': 'version',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'access_mode',
                  'active',
                  'client_id',
                  'client_name',
                  'field_template',
                  'name',
                  'options_custom_style',
                  'options_custom_style_file',
                  'options_domain',
                  'options_security_active_from',
                  'options_security_active_to',
                  'options_security_irreversible',
                  'partner_id',
                  'partner_name',
                  'reference',
                  'type',
                  'version',
                ],
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/templates',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'templates',
                },
              ],
              'parts': <dynamic>[
                'templates',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'partner',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/templates/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'templates',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'templates',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/templates/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'templates',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'templates',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'transaction': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'bfid',
          'title': 'Bfid',
          'type': '`\$STRING`',
          'short': 'BFID',
        },
        <String, dynamic>{
          'name': 'client',
          'title': 'Client',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Client resource.',
        },
        <String, dynamic>{
          'name': 'completeDate',
          'title': 'Complete Date',
          'type': '`\$STRING`',
          'short': 'Timestamp from the beginning of the transaction.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'title': 'Direct Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'errCode',
          'title': 'Err Code',
          'type': '`\$STRING`',
          'short': 'The error code that is sent in response to a failed decrypt API call.',
        },
        <String, dynamic>{
          'name': 'errMessage',
          'title': 'Err Message',
          'type': '`\$STRING`',
          'short': 'The error messge that is sent in response to a failed decrypt API call.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'This resource\'s unique identifier.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'ipAddress',
          'title': 'Ip Address',
          'type': '`\$STRING`',
          'short': 'The IP address of the http client that makes the decrypt API call.',
        },
        <String, dynamic>{
          'name': 'messageId',
          'title': 'Message Id',
          'type': '`\$STRING`',
          'short': 'Message ID.',
        },
        <String, dynamic>{
          'name': 'partner',
          'title': 'Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'reference',
          'title': 'Reference',
          'type': '`\$STRING`',
          'short': 'The reference property that the Client includes in the decrypt API call.',
        },
        <String, dynamic>{
          'name': 'success',
          'title': 'Success',
          'type': '`\$BOOLEAN`',
          'short': 'The success indicator.',
        },
        <String, dynamic>{
          'name': 'templateId',
          'title': 'Template Id',
          'type': '`\$STRING`',
          'short': 'The Template\'s unique identifier.',
          'format': 'int32',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'transaction',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/transactions',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'transactions',
                },
              ],
              'parts': <dynamic>[
                'transactions',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'date_from',
                    'orig': 'date_from',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'date_to',
                    'orig': 'date_to',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'message_id',
                    'orig': 'message_id',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'paging_mode',
                    'orig': 'paging_mode',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'reference',
                    'orig': 'reference',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'success',
                    'orig': 'success',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                  <String, dynamic>{
                    'name': 'transaction_type',
                    'orig': 'transaction_type',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'date_from',
                  'date_to',
                  'message_id',
                  'paging_mode',
                  'partner',
                  'reference',
                  'skip',
                  'success',
                  'take',
                  'transaction_type',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/transactions/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'transactions',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'transactions',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'transaction_type',
                    'orig': 'transaction_type',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                  'transaction_type',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'update_result': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'billingId',
          'title': 'Billing Id',
          'type': '`\$STRING`',
          'short': 'The Partner\'s billing identifier.',
        },
        <String, dynamic>{
          'name': 'client',
          'title': 'Client',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Client resource.',
        },
        <String, dynamic>{
          'name': 'contact',
          'title': 'Contact',
          'type': '`\$OBJECT`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'directPartner',
          'title': 'Direct Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'email',
          'title': 'Email',
          'type': '`\$STRING`',
          'req': true,
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$STRING`',
            },
            'update': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'short': 'The User\'s email address.',
        },
        <String, dynamic>{
          'name': 'firstName',
          'title': 'First Name',
          'type': '`\$STRING`',
          'req': true,
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$STRING`',
            },
            'update': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'short': 'The User\'s name.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'Unique identifier of newly added element.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'isActive',
          'title': 'Is Active',
          'type': '`\$BOOLEAN`',
          'short': 'This property indicates if the User account is active or disabled.',
        },
        <String, dynamic>{
          'name': 'lastName',
          'title': 'Last Name',
          'type': '`\$STRING`',
          'req': true,
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$STRING`',
            },
            'update': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'short': 'The User\'s Surname.',
        },
        <String, dynamic>{
          'name': 'mid',
          'title': 'Mid',
          'type': '`\$STRING`',
          'short': 'Some Partners will have an merchant ids on their own software offerings.',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'The Partner\'s name.',
        },
        <String, dynamic>{
          'name': 'parent',
          'title': 'Parent',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'partner',
          'title': 'Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'phone',
          'title': 'Phone',
          'type': '`\$STRING`',
          'req': true,
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$STRING`',
            },
            'update': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'short': 'The User\'s phone number without dashes, spaces, or brackets (e.g.',
        },
        <String, dynamic>{
          'name': 'reference',
          'title': 'Reference',
          'type': '`\$STRING`',
          'short': 'The Partner\'s reference string.',
        },
        <String, dynamic>{
          'name': 'sendWelcomeEmail',
          'title': 'Send Welcome Email',
          'type': '`\$BOOLEAN`',
          'short': 'If this property is set to \'true\' the newly created user will be sent a welcome email.',
        },
        <String, dynamic>{
          'name': 'userName',
          'title': 'User Name',
          'type': '`\$STRING`',
          'req': true,
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$STRING`',
            },
            'update': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'short': 'The User\'s unique username.',
        },
        <String, dynamic>{
          'name': 'userRole',
          'title': 'User Role',
          'type': '`\$OBJECT`',
          'req': true,
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$OBJECT`',
            },
            'update': <String, dynamic>{
              'type': '`\$OBJECT`',
            },
          },
          'short': 'Reference to the associated User Role.',
        },
        <String, dynamic>{
          'name': 'verificationPhrase',
          'title': 'Verification Phrase',
          'type': '`\$STRING`',
          'short': 'The verification phrase is a message that the Partner creates.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'update_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/users',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'users',
                },
              ],
              'parts': <dynamic>[
                'users',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$OBJECT`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'email',
                    'orig': 'email',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'first_name',
                    'orig': 'first_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'is_active',
                    'orig': 'is_active',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'last_name',
                    'orig': 'last_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$OBJECT`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'phone',
                    'orig': 'phone',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'send_welcome_email',
                    'orig': 'send_welcome_email',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'user_role',
                    'orig': 'user_role',
                    'type': '`\$OBJECT`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'username',
                    'orig': 'username',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'email',
                  'first_name',
                  'is_active',
                  'last_name',
                  'partner',
                  'phone',
                  'send_welcome_email',
                  'user_role',
                  'username',
                ],
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/users',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'users',
                },
              ],
              'parts': <dynamic>[
                'users',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'partner',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
        'update': <String, dynamic>{
          'input': 'data',
          'name': 'update',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/templates/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'templates',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'templates',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'access_mode',
                    'orig': 'access_mode',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'active',
                    'orig': 'active',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'client_id',
                    'orig': 'client_id',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'client_name',
                    'orig': 'client_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'field_template',
                    'orig': 'field_template',
                    'type': '`\$ARRAY`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'name',
                    'orig': 'name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'options_custom_style',
                    'orig': 'options_custom_style',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'options_custom_style_file',
                    'orig': 'options_custom_style_file',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'options_domain',
                    'orig': 'options_domain',
                    'type': '`\$ARRAY`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'options_security_active_from',
                    'orig': 'options_security_active_from',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'options_security_active_to',
                    'orig': 'options_security_active_to',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'options_security_irreversible',
                    'orig': 'options_security_irreversible',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'partner_id',
                    'orig': 'partner_id',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'partner_name',
                    'orig': 'partner_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'reference',
                    'orig': 'reference',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'type',
                    'orig': 'type',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'version',
                    'orig': 'version',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'access_mode',
                  'active',
                  'client_id',
                  'client_name',
                  'field_template',
                  'id',
                  'name',
                  'options_custom_style',
                  'options_custom_style_file',
                  'options_domain',
                  'options_security_active_from',
                  'options_security_active_to',
                  'options_security_irreversible',
                  'partner_id',
                  'partner_name',
                  'reference',
                  'type',
                  'version',
                ],
              },
            },
            <String, dynamic>{
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/partners/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'partners',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'partners',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'billing_id',
                    'orig': 'billing_id',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'contact_id',
                    'orig': 'contact_id',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'is_active',
                    'orig': 'is_active',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'name',
                    'orig': 'name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'parent_id',
                    'orig': 'parent_id',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'parent_name',
                    'orig': 'parent_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'reference',
                    'orig': 'reference',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'verification_phrase',
                    'orig': 'verification_phrase',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'version',
                    'orig': 'version',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'billing_id',
                  'contact_id',
                  'id',
                  'is_active',
                  'name',
                  'parent_id',
                  'parent_name',
                  'reference',
                  'verification_phrase',
                  'version',
                ],
              },
            },
            <String, dynamic>{
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/users/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'users',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'users',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$OBJECT`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'email',
                    'orig': 'email',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'first_name',
                    'orig': 'first_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'is_active',
                    'orig': 'is_active',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'last_name',
                    'orig': 'last_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$OBJECT`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'phone',
                    'orig': 'phone',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'send_welcome_email',
                    'orig': 'send_welcome_email',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'username',
                    'orig': 'username',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'email',
                  'first_name',
                  'id',
                  'is_active',
                  'last_name',
                  'partner',
                  'phone',
                  'send_welcome_email',
                  'username',
                ],
              },
            },
            <String, dynamic>{
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/clients/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'billing_id',
                    'orig': 'billing_id',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'contact_id',
                    'orig': 'contact_id',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'direct_partner_id',
                    'orig': 'direct_partner_id',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'direct_partner_name',
                    'orig': 'direct_partner_name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'is_active',
                    'orig': 'is_active',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'mid',
                    'orig': 'mid',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'name',
                    'orig': 'name',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'version',
                    'orig': 'version',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'billing_id',
                  'contact_id',
                  'direct_partner_id',
                  'direct_partner_name',
                  'id',
                  'is_active',
                  'mid',
                  'name',
                  'version',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'user': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'client',
          'title': 'Client',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Client resource.',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'email',
          'title': 'Email',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'firstName',
          'title': 'First Name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'This resource\'s unique identifier.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'isActive',
          'title': 'Is Active',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'lastName',
          'title': 'Last Name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'partner',
          'title': 'Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'phone',
          'title': 'Phone',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userName',
          'title': 'User Name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userRole',
          'title': 'User Role',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated User Role.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'user',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/users/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'users',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'users',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
  };

  // The pipeline context carries the config as a plain map.
  Map<String, dynamic> toMap() => <String, dynamic>{
        'main': main,
        'feature': feature,
        'options': options,
        'entity': entity,
      };
}

final config = Config();
