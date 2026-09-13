import 'feature/base/BaseFeature.dart';
import 'feature/audit/AuditFeature.dart';
import 'feature/clienttrack/ClienttrackFeature.dart';
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
      'transport': 'none',
    },
    'clienttrack': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'clientVersion': '0.0.1',
      },
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
      'transport': 'none',
    },
    'log': <String, dynamic>{
      'options': <String, dynamic>{
        'active': true,
      },
      'transport': 'none',
    },
    'metrics': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
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
      'transport': 'none',
    },
    'ratelimit': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'burst': 5,
        'rate': 5,
      },
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
      'transport': 'wrap',
    },
    'telemetry': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'transport': 'none',
    },
    'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'transport': 'base',
    },
    'timeout': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'ms': 30000,
      },
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
          'short': 'Billing ID',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'contact',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'format': 'date-time',
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'format': 'int64',
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'short': 'This property indicates if the Client account is active or disabled.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'mid',
          'short': 'Some Partners will have an merchant ids on their own software offerings.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'format': 'date-time',
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$STRING`',
            },
          },
          'short': 'The Client\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
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
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'billing_id',
                    'orig': 'billing_id',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_email',
                    'orig': 'contact_email',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_first_name',
                    'orig': 'contact_first_name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_is_active',
                    'orig': 'contact_is_active',
                    'reqd': true,
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_last_name',
                    'orig': 'contact_last_name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_phone',
                    'orig': 'contact_phone',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_send_welcome_email',
                    'orig': 'contact_send_welcome_email',
                    'reqd': true,
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_user_name',
                    'orig': 'contact_user_name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_user_role',
                    'orig': 'contact_user_role',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'direct_partner_id',
                    'orig': 'direct_partner_id',
                    'reqd': true,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'direct_partner_name',
                    'orig': 'direct_partner_name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'is_active',
                    'orig': 'is_active',
                    'reqd': true,
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'mid',
                    'orig': 'mid',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'name',
                    'orig': 'name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/clients',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
              ],
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
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'clients',
              ],
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/clients',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'partner',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'parts': <dynamic>[
                'clients',
              ],
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
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
          'format': 'int64',
          'name': 'id',
          'short': 'Unique identifier of newly added element.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'Name of Template',
          'type': '`\$STRING`',
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
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'template_id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/templates/{id}/clone',
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'id': 'template_id',
                },
              },
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'template_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'templates',
                '{template_id}',
                'clone',
              ],
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'template',
          ],
        ],
      },
    },
    'partner': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'billingId',
          'short': 'The Partner\'s billing identifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'contact',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'format': 'date-time',
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'format': 'int64',
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'short': 'This property indicates if the Parter account is active or disabled.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'format': 'date-time',
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$STRING`',
            },
          },
          'short': 'The Partner\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'parent',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'reference',
          'short': 'The Partner\'s reference string.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'verificationPhrase',
          'short': 'The verification phrase is a message that the Partner creates.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
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
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'billing_id',
                    'orig': 'billing_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_email',
                    'orig': 'contact_email',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_first_name',
                    'orig': 'contact_first_name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_is_active',
                    'orig': 'contact_is_active',
                    'reqd': true,
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_last_name',
                    'orig': 'contact_last_name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_phone',
                    'orig': 'contact_phone',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_send_welcome_email',
                    'orig': 'contact_send_welcome_email',
                    'reqd': true,
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_user_name',
                    'orig': 'contact_user_name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_user_role',
                    'orig': 'contact_user_role',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'is_active',
                    'orig': 'is_active',
                    'reqd': true,
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'name',
                    'orig': 'name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'parent_id',
                    'orig': 'parent_id',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'parent_name',
                    'orig': 'parent_name',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'reference',
                    'orig': 'reference',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'verification_phrase',
                    'orig': 'verification_phrase',
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/partners',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'partners',
                },
              ],
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
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'partners',
              ],
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/partners',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'partners',
                },
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'partner',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'parts': <dynamic>[
                'partners',
              ],
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'partners',
                '{id}',
              ],
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
          'short': 'The Template\'s access mode.',
          'type': '`\$ANY`',
        },
        <String, dynamic>{
          'name': 'active',
          'short': 'This property indicates if the Template is active or inactive.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'client',
          'short': 'Reference to the associated Client resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'fieldTemplates',
          'short': 'Field Template list items',
          'type': '`\$ARRAY`',
          'union': <String, dynamic>{
            'branches': 9,
            'count': 1,
            'depth': 1,
          },
        },
        <String, dynamic>{
          'format': 'int64',
          'name': 'id',
          'short': 'Unique identifier of newly added element.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'The Template\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'options',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'partner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'reference',
          'short': 'The Template\'s unique reference.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'type',
          'short': 'The Template\'s type.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
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
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'access_mode',
                    'orig': 'access_mode',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'active',
                    'orig': 'active',
                    'reqd': true,
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client_id',
                    'orig': 'client_id',
                    'reqd': true,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client_name',
                    'orig': 'client_name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'field_template',
                    'orig': 'field_template',
                    'type': '`\$ARRAY`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'name',
                    'orig': 'name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_custom_style',
                    'orig': 'options_custom_style',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_custom_style_file',
                    'orig': 'options_custom_style_file',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_domain',
                    'orig': 'options_domain',
                    'type': '`\$ARRAY`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_security_active_from',
                    'orig': 'options_security_active_from',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_security_active_to',
                    'orig': 'options_security_active_to',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_security_irreversible',
                    'orig': 'options_security_irreversible',
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner_id',
                    'orig': 'partner_id',
                    'reqd': true,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner_name',
                    'orig': 'partner_name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'reference',
                    'orig': 'reference',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'type',
                    'orig': 'type',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'version',
                    'orig': 'version',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/templates',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'templates',
                },
              ],
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
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'templates',
              ],
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/templates',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'templates',
                },
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'partner',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'parts': <dynamic>[
                'templates',
              ],
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'templates',
                '{id}',
              ],
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'templates',
                '{id}',
              ],
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
          'short': 'BFID',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'client',
          'short': 'Reference to the associated Client resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'format': 'date-time',
          'name': 'completeDate',
          'short': 'Timestamp from the beginning of the transaction.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'errCode',
          'short': 'The error code that is sent in response to a failed decrypt API call.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'errMessage',
          'short': 'The error messge that is sent in response to a failed decrypt API call.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'format': 'int64',
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'ipAddress',
          'short': 'The IP address of the http client that makes the decrypt API call.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'messageId',
          'short': 'Message ID.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'reference',
          'short': 'The reference property that the Client includes in the decrypt API call.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'success',
          'short': 'The success indicator.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'format': 'int32',
          'name': 'templateId',
          'short': 'The Template\'s unique identifier.',
          'type': '`\$STRING`',
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
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'date_from',
                    'orig': 'date_from',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'date_to',
                    'orig': 'date_to',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'message_id',
                    'orig': 'message_id',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'paging_mode',
                    'orig': 'paging_mode',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'reference',
                    'orig': 'reference',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'success',
                    'orig': 'success',
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'transaction_type',
                    'orig': 'transaction_type',
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/transactions',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'transactions',
                },
              ],
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
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'parts': <dynamic>[
                'transactions',
              ],
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'transaction_type',
                    'orig': 'transaction_type',
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                  'transaction_type',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'transactions',
                '{id}',
              ],
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
          'short': 'The Partner\'s billing identifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'client',
          'short': 'Reference to the associated Client resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'contact',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'email',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$STRING`',
            },
            'update': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'short': 'The User\'s email address.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'firstName',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$STRING`',
            },
            'update': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'short': 'The User\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'format': 'int64',
          'name': 'id',
          'short': 'Unique identifier of newly added element.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'short': 'This property indicates if the User account is active or disabled.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'lastName',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$STRING`',
            },
            'update': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'short': 'The User\'s Surname.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mid',
          'short': 'Some Partners will have an merchant ids on their own software offerings.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'The Partner\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'parent',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'partner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'phone',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$STRING`',
            },
            'update': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'short': 'The User\'s phone number without dashes, spaces, or brackets (e.g.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'reference',
          'short': 'The Partner\'s reference string.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'sendWelcomeEmail',
          'short': 'If this property is set to \'true\' the newly created user will be sent a welcome email.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'userName',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$STRING`',
            },
            'update': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'short': 'The User\'s unique username.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userRole',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'type': '`\$OBJECT`',
            },
            'update': <String, dynamic>{
              'type': '`\$OBJECT`',
            },
          },
          'req': true,
          'short': 'Reference to the associated User Role.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'verificationPhrase',
          'short': 'The verification phrase is a message that the Partner creates.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
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
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$OBJECT`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'email',
                    'orig': 'email',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'first_name',
                    'orig': 'first_name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'is_active',
                    'orig': 'is_active',
                    'reqd': true,
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'last_name',
                    'orig': 'last_name',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$OBJECT`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'phone',
                    'orig': 'phone',
                    'reqd': true,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'send_welcome_email',
                    'orig': 'send_welcome_email',
                    'reqd': true,
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'user_role',
                    'orig': 'user_role',
                    'reqd': true,
                    'type': '`\$OBJECT`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'username',
                    'orig': 'username',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/users',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'users',
                },
              ],
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
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'users',
              ],
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/users',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'users',
                },
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'partner',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'parts': <dynamic>[
                'users',
              ],
            },
          ],
        },
        'update': <String, dynamic>{
          'input': 'data',
          'name': 'update',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'access_mode',
                    'orig': 'access_mode',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'active',
                    'orig': 'active',
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client_id',
                    'orig': 'client_id',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client_name',
                    'orig': 'client_name',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'field_template',
                    'orig': 'field_template',
                    'type': '`\$ARRAY`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'name',
                    'orig': 'name',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_custom_style',
                    'orig': 'options_custom_style',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_custom_style_file',
                    'orig': 'options_custom_style_file',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_domain',
                    'orig': 'options_domain',
                    'type': '`\$ARRAY`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_security_active_from',
                    'orig': 'options_security_active_from',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_security_active_to',
                    'orig': 'options_security_active_to',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'options_security_irreversible',
                    'orig': 'options_security_irreversible',
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner_id',
                    'orig': 'partner_id',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner_name',
                    'orig': 'partner_name',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'reference',
                    'orig': 'reference',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'type',
                    'orig': 'type',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'version',
                    'orig': 'version',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'templates',
                '{id}',
              ],
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'billing_id',
                    'orig': 'billing_id',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_id',
                    'orig': 'contact_id',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'is_active',
                    'orig': 'is_active',
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'name',
                    'orig': 'name',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'parent_id',
                    'orig': 'parent_id',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'parent_name',
                    'orig': 'parent_name',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'reference',
                    'orig': 'reference',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'verification_phrase',
                    'orig': 'verification_phrase',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'version',
                    'orig': 'version',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'partners',
                '{id}',
              ],
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$OBJECT`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'email',
                    'orig': 'email',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'first_name',
                    'orig': 'first_name',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'is_active',
                    'orig': 'is_active',
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'last_name',
                    'orig': 'last_name',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$OBJECT`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'phone',
                    'orig': 'phone',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'send_welcome_email',
                    'orig': 'send_welcome_email',
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'username',
                    'orig': 'username',
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'users',
                '{id}',
              ],
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'billing_id',
                    'orig': 'billing_id',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'contact_id',
                    'orig': 'contact_id',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'direct_partner_id',
                    'orig': 'direct_partner_id',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'direct_partner_name',
                    'orig': 'direct_partner_name',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'is_active',
                    'orig': 'is_active',
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'mid',
                    'orig': 'mid',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'name',
                    'orig': 'name',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'version',
                    'orig': 'version',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
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
          'short': 'Reference to the associated Client resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'format': 'date-time',
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'email',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'firstName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'format': 'int64',
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'lastName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'format': 'date-time',
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'phone',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userRole',
          'short': 'Reference to the associated User Role.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
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
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'users',
                '{id}',
              ],
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
