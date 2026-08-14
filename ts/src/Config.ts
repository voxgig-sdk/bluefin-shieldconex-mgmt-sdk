
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'BluefinShieldconexMgmt',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: 'https://portal-cert.shieldconex.com:4010/api/v1',

    auth: {
      prefix: 'Basic',
    },

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      client: {
      },

      clone: {
      },

      partner: {
      },

      template: {
      },

      transaction: {
      },

      update_result: {
      },

      user: {
      },

    }
  }


  entity = {
    "client": {
      "fields": [
        {
          "name": "billingId",
          "type": "`$STRING`"
        },
        {
          "name": "contact",
          "op": {
            "create": {
              "req": true,
              "type": "`$OBJECT`"
            },
            "list": {
              "req": true,
              "type": "`$OBJECT`"
            }
          },
          "type": "`$OBJECT`"
        },
        {
          "name": "created",
          "type": "`$STRING`"
        },
        {
          "name": "directPartner",
          "op": {
            "create": {
              "req": true,
              "type": "`$OBJECT`"
            }
          },
          "type": "`$OBJECT`"
        },
        {
          "name": "id",
          "type": "`$INTEGER`"
        },
        {
          "name": "isActive",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "mid",
          "type": "`$STRING`"
        },
        {
          "name": "modified",
          "type": "`$STRING`"
        },
        {
          "name": "name",
          "op": {
            "create": {
              "req": true,
              "type": "`$STRING`"
            }
          },
          "type": "`$STRING`"
        },
        {
          "name": "partner",
          "type": "`$OBJECT`"
        },
        {
          "name": "version",
          "type": "`$INTEGER`"
        }
      ],
      "name": "client",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "billing_id",
                    "orig": "billing_id",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_email",
                    "orig": "contact_email",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_first_name",
                    "orig": "contact_first_name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_is_active",
                    "orig": "contact_is_active",
                    "reqd": true,
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_last_name",
                    "orig": "contact_last_name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_phone",
                    "orig": "contact_phone",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_send_welcome_email",
                    "orig": "contact_send_welcome_email",
                    "reqd": true,
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_user_name",
                    "orig": "contact_user_name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_user_role",
                    "orig": "contact_user_role",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "direct_partner_id",
                    "orig": "direct_partner_id",
                    "reqd": true,
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "direct_partner_name",
                    "orig": "direct_partner_name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "is_active",
                    "orig": "is_active",
                    "reqd": true,
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "mid",
                    "orig": "mid",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "name",
                    "orig": "name",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "POST",
              "orig": "/clients",
              "parts": [
                "clients"
              ],
              "select": {
                "exist": [
                  "billing_id",
                  "contact_email",
                  "contact_first_name",
                  "contact_is_active",
                  "contact_last_name",
                  "contact_phone",
                  "contact_send_welcome_email",
                  "contact_user_name",
                  "contact_user_role",
                  "direct_partner_id",
                  "direct_partner_name",
                  "is_active",
                  "mid",
                  "name"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/clients",
              "parts": [
                "clients"
              ],
              "select": {
                "exist": [
                  "partner",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/clients/{id}",
              "parts": [
                "clients",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "remove": {
          "input": "data",
          "name": "remove",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "DELETE",
              "orig": "/clients/{id}",
              "parts": [
                "clients",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "clone": {
      "fields": [
        {
          "name": "id",
          "type": "`$INTEGER`"
        },
        {
          "name": "name",
          "type": "`$STRING`"
        }
      ],
      "name": "clone",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "template_id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "POST",
              "orig": "/templates/{id}/clone",
              "parts": [
                "templates",
                "{template_id}",
                "clone"
              ],
              "rename": {
                "param": {
                  "id": "template_id"
                }
              },
              "select": {
                "exist": [
                  "template_id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": [
          [
            "template"
          ]
        ]
      }
    },
    "partner": {
      "fields": [
        {
          "name": "billingId",
          "type": "`$STRING`"
        },
        {
          "name": "contact",
          "op": {
            "create": {
              "req": true,
              "type": "`$OBJECT`"
            },
            "list": {
              "req": true,
              "type": "`$OBJECT`"
            }
          },
          "type": "`$OBJECT`"
        },
        {
          "name": "created",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "type": "`$INTEGER`"
        },
        {
          "name": "isActive",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "modified",
          "type": "`$STRING`"
        },
        {
          "name": "name",
          "op": {
            "create": {
              "req": true,
              "type": "`$STRING`"
            }
          },
          "type": "`$STRING`"
        },
        {
          "name": "parent",
          "op": {
            "create": {
              "req": true,
              "type": "`$OBJECT`"
            }
          },
          "type": "`$OBJECT`"
        },
        {
          "name": "reference",
          "type": "`$STRING`"
        },
        {
          "name": "verificationPhrase",
          "type": "`$STRING`"
        },
        {
          "name": "version",
          "type": "`$INTEGER`"
        }
      ],
      "name": "partner",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "billing_id",
                    "orig": "billing_id",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_email",
                    "orig": "contact_email",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_first_name",
                    "orig": "contact_first_name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_is_active",
                    "orig": "contact_is_active",
                    "reqd": true,
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_last_name",
                    "orig": "contact_last_name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_phone",
                    "orig": "contact_phone",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_send_welcome_email",
                    "orig": "contact_send_welcome_email",
                    "reqd": true,
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_user_name",
                    "orig": "contact_user_name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_user_role",
                    "orig": "contact_user_role",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "is_active",
                    "orig": "is_active",
                    "reqd": true,
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "name",
                    "orig": "name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "parent_id",
                    "orig": "parent_id",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "parent_name",
                    "orig": "parent_name",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "reference",
                    "orig": "reference",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "verification_phrase",
                    "orig": "verification_phrase",
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "POST",
              "orig": "/partners",
              "parts": [
                "partners"
              ],
              "select": {
                "exist": [
                  "billing_id",
                  "contact_email",
                  "contact_first_name",
                  "contact_is_active",
                  "contact_last_name",
                  "contact_phone",
                  "contact_send_welcome_email",
                  "contact_user_name",
                  "contact_user_role",
                  "is_active",
                  "name",
                  "parent_id",
                  "parent_name",
                  "reference",
                  "verification_phrase"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/partners",
              "parts": [
                "partners"
              ],
              "select": {
                "exist": [
                  "partner",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/partners/{id}",
              "parts": [
                "partners",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "template": {
      "fields": [
        {
          "name": "accessMode",
          "type": "`$ANY`"
        },
        {
          "name": "active",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "client",
          "type": "`$OBJECT`"
        },
        {
          "name": "fieldTemplates",
          "type": "`$ARRAY`",
          "union": {
            "branches": 9,
            "count": 1,
            "depth": 1
          }
        },
        {
          "name": "id",
          "type": "`$INTEGER`"
        },
        {
          "name": "name",
          "type": "`$STRING`"
        },
        {
          "name": "options",
          "type": "`$OBJECT`"
        },
        {
          "name": "partner",
          "type": "`$OBJECT`"
        },
        {
          "name": "reference",
          "type": "`$STRING`"
        },
        {
          "name": "type",
          "type": "`$STRING`"
        },
        {
          "name": "version",
          "type": "`$INTEGER`"
        }
      ],
      "name": "template",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "access_mode",
                    "orig": "access_mode",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "active",
                    "orig": "active",
                    "reqd": true,
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "client_id",
                    "orig": "client_id",
                    "reqd": true,
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "client_name",
                    "orig": "client_name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "field_template",
                    "orig": "field_template",
                    "type": "`$ARRAY`"
                  },
                  {
                    "kind": "query",
                    "name": "name",
                    "orig": "name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "options_custom_style",
                    "orig": "options_custom_style",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "options_custom_style_file",
                    "orig": "options_custom_style_file",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "options_domain",
                    "orig": "options_domain",
                    "type": "`$ARRAY`"
                  },
                  {
                    "kind": "query",
                    "name": "options_security_active_from",
                    "orig": "options_security_active_from",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "options_security_active_to",
                    "orig": "options_security_active_to",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "options_security_irreversible",
                    "orig": "options_security_irreversible",
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "partner_id",
                    "orig": "partner_id",
                    "reqd": true,
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "partner_name",
                    "orig": "partner_name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "reference",
                    "orig": "reference",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "type",
                    "orig": "type",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "version",
                    "orig": "version",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "POST",
              "orig": "/templates",
              "parts": [
                "templates"
              ],
              "select": {
                "exist": [
                  "access_mode",
                  "active",
                  "client_id",
                  "client_name",
                  "field_template",
                  "name",
                  "options_custom_style",
                  "options_custom_style_file",
                  "options_domain",
                  "options_security_active_from",
                  "options_security_active_to",
                  "options_security_irreversible",
                  "partner_id",
                  "partner_name",
                  "reference",
                  "type",
                  "version"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "client",
                    "orig": "client",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/templates",
              "parts": [
                "templates"
              ],
              "select": {
                "exist": [
                  "client",
                  "partner",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/templates/{id}",
              "parts": [
                "templates",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "remove": {
          "input": "data",
          "name": "remove",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "DELETE",
              "orig": "/templates/{id}",
              "parts": [
                "templates",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "transaction": {
      "fields": [
        {
          "name": "bfid",
          "type": "`$STRING`"
        },
        {
          "name": "client",
          "type": "`$OBJECT`"
        },
        {
          "name": "completeDate",
          "type": "`$STRING`"
        },
        {
          "name": "directPartner",
          "type": "`$OBJECT`"
        },
        {
          "name": "errCode",
          "type": "`$STRING`"
        },
        {
          "name": "errMessage",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "type": "`$INTEGER`"
        },
        {
          "name": "ipAddress",
          "type": "`$STRING`"
        },
        {
          "name": "messageId",
          "type": "`$STRING`"
        },
        {
          "name": "partner",
          "type": "`$OBJECT`"
        },
        {
          "name": "reference",
          "type": "`$STRING`"
        },
        {
          "name": "success",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "templateId",
          "type": "`$STRING`"
        }
      ],
      "name": "transaction",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "client",
                    "orig": "client",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "date_from",
                    "orig": "date_from",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "date_to",
                    "orig": "date_to",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "message_id",
                    "orig": "message_id",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "paging_mode",
                    "orig": "paging_mode",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "reference",
                    "orig": "reference",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "success",
                    "orig": "success",
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "transaction_type",
                    "orig": "transaction_type",
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/transactions",
              "parts": [
                "transactions"
              ],
              "select": {
                "exist": [
                  "client",
                  "date_from",
                  "date_to",
                  "message_id",
                  "paging_mode",
                  "partner",
                  "reference",
                  "skip",
                  "success",
                  "take",
                  "transaction_type"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "query": [
                  {
                    "kind": "query",
                    "name": "transaction_type",
                    "orig": "transaction_type",
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/transactions/{id}",
              "parts": [
                "transactions",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id",
                  "transaction_type"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "update_result": {
      "fields": [
        {
          "name": "billingId",
          "type": "`$STRING`"
        },
        {
          "name": "client",
          "type": "`$OBJECT`"
        },
        {
          "name": "contact",
          "req": true,
          "type": "`$OBJECT`"
        },
        {
          "name": "directPartner",
          "type": "`$OBJECT`"
        },
        {
          "name": "email",
          "op": {
            "list": {
              "type": "`$STRING`"
            },
            "update": {
              "type": "`$STRING`"
            }
          },
          "req": true,
          "type": "`$STRING`"
        },
        {
          "name": "firstName",
          "op": {
            "list": {
              "type": "`$STRING`"
            },
            "update": {
              "type": "`$STRING`"
            }
          },
          "req": true,
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "type": "`$INTEGER`"
        },
        {
          "name": "isActive",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "lastName",
          "op": {
            "list": {
              "type": "`$STRING`"
            },
            "update": {
              "type": "`$STRING`"
            }
          },
          "req": true,
          "type": "`$STRING`"
        },
        {
          "name": "mid",
          "type": "`$STRING`"
        },
        {
          "name": "name",
          "type": "`$STRING`"
        },
        {
          "name": "parent",
          "type": "`$OBJECT`"
        },
        {
          "name": "partner",
          "type": "`$OBJECT`"
        },
        {
          "name": "phone",
          "op": {
            "list": {
              "type": "`$STRING`"
            },
            "update": {
              "type": "`$STRING`"
            }
          },
          "req": true,
          "type": "`$STRING`"
        },
        {
          "name": "reference",
          "type": "`$STRING`"
        },
        {
          "name": "sendWelcomeEmail",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "userName",
          "op": {
            "list": {
              "type": "`$STRING`"
            },
            "update": {
              "type": "`$STRING`"
            }
          },
          "req": true,
          "type": "`$STRING`"
        },
        {
          "name": "userRole",
          "op": {
            "list": {
              "type": "`$OBJECT`"
            },
            "update": {
              "type": "`$OBJECT`"
            }
          },
          "req": true,
          "type": "`$OBJECT`"
        },
        {
          "name": "verificationPhrase",
          "type": "`$STRING`"
        },
        {
          "name": "version",
          "type": "`$INTEGER`"
        }
      ],
      "name": "update_result",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "client",
                    "orig": "client",
                    "type": "`$OBJECT`"
                  },
                  {
                    "kind": "query",
                    "name": "email",
                    "orig": "email",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "first_name",
                    "orig": "first_name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "is_active",
                    "orig": "is_active",
                    "reqd": true,
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "last_name",
                    "orig": "last_name",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "type": "`$OBJECT`"
                  },
                  {
                    "kind": "query",
                    "name": "phone",
                    "orig": "phone",
                    "reqd": true,
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "send_welcome_email",
                    "orig": "send_welcome_email",
                    "reqd": true,
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "user_role",
                    "orig": "user_role",
                    "reqd": true,
                    "type": "`$OBJECT`"
                  },
                  {
                    "kind": "query",
                    "name": "username",
                    "orig": "username",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "POST",
              "orig": "/users",
              "parts": [
                "users"
              ],
              "select": {
                "exist": [
                  "client",
                  "email",
                  "first_name",
                  "is_active",
                  "last_name",
                  "partner",
                  "phone",
                  "send_welcome_email",
                  "user_role",
                  "username"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "client",
                    "orig": "client",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/users",
              "parts": [
                "users"
              ],
              "select": {
                "exist": [
                  "client",
                  "partner",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "update": {
          "input": "data",
          "name": "update",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "query": [
                  {
                    "kind": "query",
                    "name": "access_mode",
                    "orig": "access_mode",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "active",
                    "orig": "active",
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "client_id",
                    "orig": "client_id",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "client_name",
                    "orig": "client_name",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "field_template",
                    "orig": "field_template",
                    "type": "`$ARRAY`"
                  },
                  {
                    "kind": "query",
                    "name": "name",
                    "orig": "name",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "options_custom_style",
                    "orig": "options_custom_style",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "options_custom_style_file",
                    "orig": "options_custom_style_file",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "options_domain",
                    "orig": "options_domain",
                    "type": "`$ARRAY`"
                  },
                  {
                    "kind": "query",
                    "name": "options_security_active_from",
                    "orig": "options_security_active_from",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "options_security_active_to",
                    "orig": "options_security_active_to",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "options_security_irreversible",
                    "orig": "options_security_irreversible",
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "partner_id",
                    "orig": "partner_id",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "partner_name",
                    "orig": "partner_name",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "reference",
                    "orig": "reference",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "type",
                    "orig": "type",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "version",
                    "orig": "version",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/templates/{id}",
              "parts": [
                "templates",
                "{id}"
              ],
              "select": {
                "exist": [
                  "access_mode",
                  "active",
                  "client_id",
                  "client_name",
                  "field_template",
                  "id",
                  "name",
                  "options_custom_style",
                  "options_custom_style_file",
                  "options_domain",
                  "options_security_active_from",
                  "options_security_active_to",
                  "options_security_irreversible",
                  "partner_id",
                  "partner_name",
                  "reference",
                  "type",
                  "version"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "query": [
                  {
                    "kind": "query",
                    "name": "billing_id",
                    "orig": "billing_id",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_id",
                    "orig": "contact_id",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "is_active",
                    "orig": "is_active",
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "name",
                    "orig": "name",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "parent_id",
                    "orig": "parent_id",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "parent_name",
                    "orig": "parent_name",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "reference",
                    "orig": "reference",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "verification_phrase",
                    "orig": "verification_phrase",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "version",
                    "orig": "version",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/partners/{id}",
              "parts": [
                "partners",
                "{id}"
              ],
              "select": {
                "exist": [
                  "billing_id",
                  "contact_id",
                  "id",
                  "is_active",
                  "name",
                  "parent_id",
                  "parent_name",
                  "reference",
                  "verification_phrase",
                  "version"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "query": [
                  {
                    "kind": "query",
                    "name": "client",
                    "orig": "client",
                    "type": "`$OBJECT`"
                  },
                  {
                    "kind": "query",
                    "name": "email",
                    "orig": "email",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "first_name",
                    "orig": "first_name",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "is_active",
                    "orig": "is_active",
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "last_name",
                    "orig": "last_name",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "type": "`$OBJECT`"
                  },
                  {
                    "kind": "query",
                    "name": "phone",
                    "orig": "phone",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "send_welcome_email",
                    "orig": "send_welcome_email",
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "username",
                    "orig": "username",
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/users/{id}",
              "parts": [
                "users",
                "{id}"
              ],
              "select": {
                "exist": [
                  "client",
                  "email",
                  "first_name",
                  "id",
                  "is_active",
                  "last_name",
                  "partner",
                  "phone",
                  "send_welcome_email",
                  "username"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "query": [
                  {
                    "kind": "query",
                    "name": "billing_id",
                    "orig": "billing_id",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "contact_id",
                    "orig": "contact_id",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "direct_partner_id",
                    "orig": "direct_partner_id",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "direct_partner_name",
                    "orig": "direct_partner_name",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "is_active",
                    "orig": "is_active",
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "kind": "query",
                    "name": "mid",
                    "orig": "mid",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "name",
                    "orig": "name",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "version",
                    "orig": "version",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/clients/{id}",
              "parts": [
                "clients",
                "{id}"
              ],
              "select": {
                "exist": [
                  "billing_id",
                  "contact_id",
                  "direct_partner_id",
                  "direct_partner_name",
                  "id",
                  "is_active",
                  "mid",
                  "name",
                  "version"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "user": {
      "fields": [
        {
          "name": "client",
          "type": "`$OBJECT`"
        },
        {
          "name": "created",
          "type": "`$STRING`"
        },
        {
          "name": "email",
          "type": "`$STRING`"
        },
        {
          "name": "firstName",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "type": "`$INTEGER`"
        },
        {
          "name": "isActive",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "lastName",
          "type": "`$STRING`"
        },
        {
          "name": "modified",
          "type": "`$STRING`"
        },
        {
          "name": "partner",
          "type": "`$OBJECT`"
        },
        {
          "name": "phone",
          "type": "`$STRING`"
        },
        {
          "name": "userName",
          "type": "`$STRING`"
        },
        {
          "name": "userRole",
          "type": "`$OBJECT`"
        },
        {
          "name": "version",
          "type": "`$INTEGER`"
        }
      ],
      "name": "user",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/users/{id}",
              "parts": [
                "users",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

