import 'feature/base/BaseFeature.dart';
import 'feature/test/TestFeature.dart';


// ignore: non_constant_identifier_names
final Map<String, BaseFeature Function()> FEATURE_CLASS = {
    'test': () => TestFeature(),

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

  final Map<String, dynamic> main = <String, dynamic>{
    'name': 'BluefinShieldconexMgmt',
  };

  final Map<String, dynamic> feature = <String, dynamic>{
        'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
    },

  };

  final Map<String, dynamic> options = <String, dynamic>{
    'base': 'https://portal-cert.shieldconex.com:4010/api/v1',

    'auth': <String, dynamic>{
      'prefix': 'Basic',
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

    }
  };

  final Map<String, dynamic> entity = <String, dynamic>{
    'client': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'billingId',
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
          'name': 'created',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'mid',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
          'type': '`\$INTEGER`',
        },
      ],
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
              'parts': <dynamic>[
                'clients',
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
              'parts': <dynamic>[
                'clients',
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
                'res': '`body`',
              },
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
              'parts': <dynamic>[
                'clients',
                '{id}',
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
              'parts': <dynamic>[
                'clients',
                '{id}',
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
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'name',
          'type': '`\$STRING`',
        },
      ],
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'template_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
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
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'modified',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'reference',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'verificationPhrase',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'type': '`\$INTEGER`',
        },
      ],
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
              'parts': <dynamic>[
                'partners',
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
              'parts': <dynamic>[
                'partners',
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
                'res': '`body`',
              },
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
              'parts': <dynamic>[
                'partners',
                '{id}',
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
          'type': '`\$ANY`',
        },
        <String, dynamic>{
          'name': 'active',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'client',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'fieldTemplates',
          'type': '`\$ARRAY`',
          'union': <String, dynamic>{
            'branches': 9,
            'count': 1,
            'depth': 1,
          },
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'options',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'partner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'reference',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'type',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'type': '`\$INTEGER`',
        },
      ],
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
              'parts': <dynamic>[
                'templates',
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
              'parts': <dynamic>[
                'templates',
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
                'res': '`body`',
              },
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
              'parts': <dynamic>[
                'templates',
                '{id}',
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
              'parts': <dynamic>[
                'templates',
                '{id}',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'client',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'completeDate',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'errCode',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'errMessage',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'ipAddress',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'messageId',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'reference',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'success',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'templateId',
          'type': '`\$STRING`',
        },
      ],
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
              'parts': <dynamic>[
                'transactions',
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
                'res': '`body`',
              },
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
              'parts': <dynamic>[
                'transactions',
                '{id}',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'client',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'contact',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'directPartner',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'isActive',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mid',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'parent',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'partner',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'reference',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'sendWelcomeEmail',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'verificationPhrase',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'type': '`\$INTEGER`',
        },
      ],
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
              'parts': <dynamic>[
                'users',
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
              'parts': <dynamic>[
                'users',
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
                'res': '`body`',
              },
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
              'parts': <dynamic>[
                'templates',
                '{id}',
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
              'parts': <dynamic>[
                'partners',
                '{id}',
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
              'parts': <dynamic>[
                'users',
                '{id}',
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
              'parts': <dynamic>[
                'clients',
                '{id}',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'created',
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
          'name': 'id',
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
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
          'type': '`\$INTEGER`',
        },
      ],
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
              'parts': <dynamic>[
                'users',
                '{id}',
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
