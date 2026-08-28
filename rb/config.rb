# BluefinShieldconexMgmt SDK configuration

module BluefinShieldconexMgmtConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "BluefinShieldconexMgmt",
        "slug" => "bluefin-shieldconex-mgmt",
        "version" => "0.1.1",
        "target" => "rb",
      },
      "feature" => {
        "audit" => {
          "options" => {
            "active" => false,
            "actor" => "anonymous",
            "max" => 1000,
          },
          "transport" => "none",
        },
        "clienttrack" => {
          "options" => {
            "active" => false,
            "clientVersion" => "0.0.1",
          },
          "transport" => "none",
        },
        "idempotency" => {
          "options" => {
            "active" => false,
            "header" => "Idempotency-Key",
            "methods" => [
              "POST",
              "PUT",
              "PATCH",
              "DELETE",
            ],
            "ops" => [
              "create",
              "update",
              "remove",
            ],
          },
          "transport" => "none",
        },
        "log" => {
          "options" => {
            "active" => true,
          },
          "transport" => "none",
        },
        "metrics" => {
          "options" => {
            "active" => false,
          },
          "transport" => "none",
        },
        "paging" => {
          "options" => {
            "active" => false,
            "afterVar" => "after",
            "cursorParam" => "cursor",
            "firstVar" => "first",
            "limitParam" => "limit",
            "pageParam" => "page",
            "startPage" => 1,
          },
          "transport" => "none",
        },
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "transport" => "wrap",
        },
        "telemetry" => {
          "options" => {
            "active" => false,
          },
          "transport" => "none",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://portal-cert.shieldconex.com:4010/api/v1",
        "auth" => {
          "prefix" => "Basic",
        },
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "client" => {},
          "clone" => {},
          "partner" => {},
          "template" => {},
          "transaction" => {},
          "update_result" => {},
          "user" => {},
        },
      },
      "entity" => {
        "client" => {
          "fields" => [
            {
              "name" => "billingId",
              "short" => "Billing ID",
              "type" => "`$STRING`",
            },
            {
              "name" => "contact",
              "op" => {
                "create" => {
                  "req" => true,
                  "type" => "`$OBJECT`",
                },
                "list" => {
                  "req" => true,
                  "type" => "`$OBJECT`",
                },
              },
              "type" => "`$OBJECT`",
            },
            {
              "name" => "created",
              "short" => "Creation timestamp in ISO 8601 format.",
              "type" => "`$STRING`",
            },
            {
              "name" => "directPartner",
              "op" => {
                "create" => {
                  "req" => true,
                  "type" => "`$OBJECT`",
                },
              },
              "short" => "Reference to the associated Partner.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "id",
              "short" => "This resource's unique identifier.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "isActive",
              "short" => "This property indicates if the Client account is active or disabled.",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "mid",
              "short" => "Some Partners will have an merchant ids on their own software offerings.",
              "type" => "`$STRING`",
            },
            {
              "name" => "modified",
              "short" => "Last modified timestamp.",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "op" => {
                "create" => {
                  "req" => true,
                  "type" => "`$STRING`",
                },
              },
              "short" => "The Client's name.",
              "type" => "`$STRING`",
            },
            {
              "name" => "partner",
              "short" => "Reference to the associated Partner.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "version",
              "short" => "The number of times that this resource has been updated.",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "client",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "billing_id",
                        "orig" => "billing_id",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_email",
                        "orig" => "contact_email",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_first_name",
                        "orig" => "contact_first_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_is_active",
                        "orig" => "contact_is_active",
                        "reqd" => true,
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_last_name",
                        "orig" => "contact_last_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_phone",
                        "orig" => "contact_phone",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_send_welcome_email",
                        "orig" => "contact_send_welcome_email",
                        "reqd" => true,
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_user_name",
                        "orig" => "contact_user_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_user_role",
                        "orig" => "contact_user_role",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "direct_partner_id",
                        "orig" => "direct_partner_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "direct_partner_name",
                        "orig" => "direct_partner_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "is_active",
                        "orig" => "is_active",
                        "reqd" => true,
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "mid",
                        "orig" => "mid",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/clients",
                  "parts" => [
                    "clients",
                  ],
                  "select" => {
                    "exist" => [
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
                      "name",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/clients",
                  "parts" => [
                    "clients",
                  ],
                  "select" => {
                    "exist" => [
                      "partner",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.data`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/clients/{id}",
                  "parts" => [
                    "clients",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/clients/{id}",
                  "parts" => [
                    "clients",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "clone" => {
          "fields" => [
            {
              "name" => "id",
              "short" => "Unique identifier of newly added element.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "name",
              "short" => "Name of Template",
              "type" => "`$STRING`",
            },
          ],
          "name" => "clone",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "template_id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/templates/{id}/clone",
                  "parts" => [
                    "templates",
                    "{template_id}",
                    "clone",
                  ],
                  "rename" => {
                    "param" => {
                      "id" => "template_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "template_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "template",
              ],
            ],
          },
        },
        "partner" => {
          "fields" => [
            {
              "name" => "billingId",
              "short" => "The Partner's billing identifier.",
              "type" => "`$STRING`",
            },
            {
              "name" => "contact",
              "op" => {
                "create" => {
                  "req" => true,
                  "type" => "`$OBJECT`",
                },
                "list" => {
                  "req" => true,
                  "type" => "`$OBJECT`",
                },
              },
              "type" => "`$OBJECT`",
            },
            {
              "name" => "created",
              "short" => "Creation timestamp in ISO 8601 format.",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "short" => "This resource's unique identifier.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "isActive",
              "short" => "This property indicates if the Parter account is active or disabled.",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "modified",
              "short" => "Last modified timestamp.",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "op" => {
                "create" => {
                  "req" => true,
                  "type" => "`$STRING`",
                },
              },
              "short" => "The Partner's name.",
              "type" => "`$STRING`",
            },
            {
              "name" => "parent",
              "op" => {
                "create" => {
                  "req" => true,
                  "type" => "`$OBJECT`",
                },
              },
              "short" => "Reference to the associated Partner.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "reference",
              "short" => "The Partner's reference string.",
              "type" => "`$STRING`",
            },
            {
              "name" => "verificationPhrase",
              "short" => "The verification phrase is a message that the Partner creates.",
              "type" => "`$STRING`",
            },
            {
              "name" => "version",
              "short" => "The number of times that this resource has been updated.",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "partner",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "billing_id",
                        "orig" => "billing_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_email",
                        "orig" => "contact_email",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_first_name",
                        "orig" => "contact_first_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_is_active",
                        "orig" => "contact_is_active",
                        "reqd" => true,
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_last_name",
                        "orig" => "contact_last_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_phone",
                        "orig" => "contact_phone",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_send_welcome_email",
                        "orig" => "contact_send_welcome_email",
                        "reqd" => true,
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_user_name",
                        "orig" => "contact_user_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_user_role",
                        "orig" => "contact_user_role",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "is_active",
                        "orig" => "is_active",
                        "reqd" => true,
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "parent_id",
                        "orig" => "parent_id",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "parent_name",
                        "orig" => "parent_name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "reference",
                        "orig" => "reference",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "verification_phrase",
                        "orig" => "verification_phrase",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/partners",
                  "parts" => [
                    "partners",
                  ],
                  "select" => {
                    "exist" => [
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
                      "verification_phrase",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/partners",
                  "parts" => [
                    "partners",
                  ],
                  "select" => {
                    "exist" => [
                      "partner",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.data`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/partners/{id}",
                  "parts" => [
                    "partners",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "template" => {
          "fields" => [
            {
              "name" => "accessMode",
              "short" => "The Template's access mode.",
              "type" => "`$ANY`",
            },
            {
              "name" => "active",
              "short" => "This property indicates if the Template is active or inactive.",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "client",
              "short" => "Reference to the associated Client resource.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "fieldTemplates",
              "short" => "Field Template list items",
              "type" => "`$ARRAY`",
              "union" => {
                "branches" => 9,
                "count" => 1,
                "depth" => 1,
              },
            },
            {
              "name" => "id",
              "short" => "Unique identifier of newly added element.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "name",
              "short" => "The Template's name.",
              "type" => "`$STRING`",
            },
            {
              "name" => "options",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "partner",
              "short" => "Reference to the associated Partner.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "reference",
              "short" => "The Template's unique reference.",
              "type" => "`$STRING`",
            },
            {
              "name" => "type",
              "short" => "The Template's type.",
              "type" => "`$STRING`",
            },
            {
              "name" => "version",
              "short" => "The number of times that this resource has been updated.",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "template",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "access_mode",
                        "orig" => "access_mode",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "active",
                        "orig" => "active",
                        "reqd" => true,
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "client_id",
                        "orig" => "client_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "client_name",
                        "orig" => "client_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "field_template",
                        "orig" => "field_template",
                        "type" => "`$ARRAY`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_custom_style",
                        "orig" => "options_custom_style",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_custom_style_file",
                        "orig" => "options_custom_style_file",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_domain",
                        "orig" => "options_domain",
                        "type" => "`$ARRAY`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_security_active_from",
                        "orig" => "options_security_active_from",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_security_active_to",
                        "orig" => "options_security_active_to",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_security_irreversible",
                        "orig" => "options_security_irreversible",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner_id",
                        "orig" => "partner_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner_name",
                        "orig" => "partner_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "reference",
                        "orig" => "reference",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "type",
                        "orig" => "type",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "version",
                        "orig" => "version",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/templates",
                  "parts" => [
                    "templates",
                  ],
                  "select" => {
                    "exist" => [
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
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "client",
                        "orig" => "client",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/templates",
                  "parts" => [
                    "templates",
                  ],
                  "select" => {
                    "exist" => [
                      "client",
                      "partner",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.data`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/templates/{id}",
                  "parts" => [
                    "templates",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/templates/{id}",
                  "parts" => [
                    "templates",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "transaction" => {
          "fields" => [
            {
              "name" => "bfid",
              "short" => "BFID",
              "type" => "`$STRING`",
            },
            {
              "name" => "client",
              "short" => "Reference to the associated Client resource.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "completeDate",
              "short" => "Timestamp from the beginning of the transaction.",
              "type" => "`$STRING`",
            },
            {
              "name" => "directPartner",
              "short" => "Reference to the associated Partner.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "errCode",
              "short" => "The error code that is sent in response to a failed decrypt API call.",
              "type" => "`$STRING`",
            },
            {
              "name" => "errMessage",
              "short" => "The error messge that is sent in response to a failed decrypt API call.",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "short" => "This resource's unique identifier.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "ipAddress",
              "short" => "The IP address of the http client that makes the decrypt API call.",
              "type" => "`$STRING`",
            },
            {
              "name" => "messageId",
              "short" => "Message ID.",
              "type" => "`$STRING`",
            },
            {
              "name" => "partner",
              "short" => "Reference to the associated Partner.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "reference",
              "short" => "The reference property that the Client includes in the decrypt API call.",
              "type" => "`$STRING`",
            },
            {
              "name" => "success",
              "short" => "The success indicator.",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "templateId",
              "short" => "The Template's unique identifier.",
              "type" => "`$STRING`",
            },
          ],
          "name" => "transaction",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "client",
                        "orig" => "client",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "date_from",
                        "orig" => "date_from",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "date_to",
                        "orig" => "date_to",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "message_id",
                        "orig" => "message_id",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "paging_mode",
                        "orig" => "paging_mode",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "reference",
                        "orig" => "reference",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "success",
                        "orig" => "success",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "transaction_type",
                        "orig" => "transaction_type",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/transactions",
                  "parts" => [
                    "transactions",
                  ],
                  "select" => {
                    "exist" => [
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
                      "transaction_type",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.data`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "transaction_type",
                        "orig" => "transaction_type",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/transactions/{id}",
                  "parts" => [
                    "transactions",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                      "transaction_type",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "update_result" => {
          "fields" => [
            {
              "name" => "billingId",
              "short" => "The Partner's billing identifier.",
              "type" => "`$STRING`",
            },
            {
              "name" => "client",
              "short" => "Reference to the associated Client resource.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "contact",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "directPartner",
              "short" => "Reference to the associated Partner.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "email",
              "op" => {
                "list" => {
                  "type" => "`$STRING`",
                },
                "update" => {
                  "type" => "`$STRING`",
                },
              },
              "req" => true,
              "short" => "The User's email address.",
              "type" => "`$STRING`",
            },
            {
              "name" => "firstName",
              "op" => {
                "list" => {
                  "type" => "`$STRING`",
                },
                "update" => {
                  "type" => "`$STRING`",
                },
              },
              "req" => true,
              "short" => "The User's name.",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "short" => "Unique identifier of newly added element.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "isActive",
              "short" => "This property indicates if the User account is active or disabled.",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "lastName",
              "op" => {
                "list" => {
                  "type" => "`$STRING`",
                },
                "update" => {
                  "type" => "`$STRING`",
                },
              },
              "req" => true,
              "short" => "The User's Surname.",
              "type" => "`$STRING`",
            },
            {
              "name" => "mid",
              "short" => "Some Partners will have an merchant ids on their own software offerings.",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "short" => "The Partner's name.",
              "type" => "`$STRING`",
            },
            {
              "name" => "parent",
              "short" => "Reference to the associated Partner.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "partner",
              "short" => "Reference to the associated Partner.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "phone",
              "op" => {
                "list" => {
                  "type" => "`$STRING`",
                },
                "update" => {
                  "type" => "`$STRING`",
                },
              },
              "req" => true,
              "short" => "The User's phone number without dashes, spaces, or brackets (e.g.",
              "type" => "`$STRING`",
            },
            {
              "name" => "reference",
              "short" => "The Partner's reference string.",
              "type" => "`$STRING`",
            },
            {
              "name" => "sendWelcomeEmail",
              "short" => "If this property is set to 'true' the newly created user will be sent a welcome email.",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "userName",
              "op" => {
                "list" => {
                  "type" => "`$STRING`",
                },
                "update" => {
                  "type" => "`$STRING`",
                },
              },
              "req" => true,
              "short" => "The User's unique username.",
              "type" => "`$STRING`",
            },
            {
              "name" => "userRole",
              "op" => {
                "list" => {
                  "type" => "`$OBJECT`",
                },
                "update" => {
                  "type" => "`$OBJECT`",
                },
              },
              "req" => true,
              "short" => "Reference to the associated User Role.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "verificationPhrase",
              "short" => "The verification phrase is a message that the Partner creates.",
              "type" => "`$STRING`",
            },
            {
              "name" => "version",
              "short" => "The number of times that this resource has been updated.",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "update_result",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "client",
                        "orig" => "client",
                        "type" => "`$OBJECT`",
                      },
                      {
                        "kind" => "query",
                        "name" => "email",
                        "orig" => "email",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "first_name",
                        "orig" => "first_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "is_active",
                        "orig" => "is_active",
                        "reqd" => true,
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "last_name",
                        "orig" => "last_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "type" => "`$OBJECT`",
                      },
                      {
                        "kind" => "query",
                        "name" => "phone",
                        "orig" => "phone",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "send_welcome_email",
                        "orig" => "send_welcome_email",
                        "reqd" => true,
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "user_role",
                        "orig" => "user_role",
                        "reqd" => true,
                        "type" => "`$OBJECT`",
                      },
                      {
                        "kind" => "query",
                        "name" => "username",
                        "orig" => "username",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/users",
                  "parts" => [
                    "users",
                  ],
                  "select" => {
                    "exist" => [
                      "client",
                      "email",
                      "first_name",
                      "is_active",
                      "last_name",
                      "partner",
                      "phone",
                      "send_welcome_email",
                      "user_role",
                      "username",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "client",
                        "orig" => "client",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/users",
                  "parts" => [
                    "users",
                  ],
                  "select" => {
                    "exist" => [
                      "client",
                      "partner",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.data`",
                  },
                },
              ],
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "access_mode",
                        "orig" => "access_mode",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "active",
                        "orig" => "active",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "client_id",
                        "orig" => "client_id",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "client_name",
                        "orig" => "client_name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "field_template",
                        "orig" => "field_template",
                        "type" => "`$ARRAY`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_custom_style",
                        "orig" => "options_custom_style",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_custom_style_file",
                        "orig" => "options_custom_style_file",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_domain",
                        "orig" => "options_domain",
                        "type" => "`$ARRAY`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_security_active_from",
                        "orig" => "options_security_active_from",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_security_active_to",
                        "orig" => "options_security_active_to",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "options_security_irreversible",
                        "orig" => "options_security_irreversible",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner_id",
                        "orig" => "partner_id",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner_name",
                        "orig" => "partner_name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "reference",
                        "orig" => "reference",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "type",
                        "orig" => "type",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "version",
                        "orig" => "version",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/templates/{id}",
                  "parts" => [
                    "templates",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
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
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "billing_id",
                        "orig" => "billing_id",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_id",
                        "orig" => "contact_id",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "is_active",
                        "orig" => "is_active",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "parent_id",
                        "orig" => "parent_id",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "parent_name",
                        "orig" => "parent_name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "reference",
                        "orig" => "reference",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "verification_phrase",
                        "orig" => "verification_phrase",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "version",
                        "orig" => "version",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/partners/{id}",
                  "parts" => [
                    "partners",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "billing_id",
                      "contact_id",
                      "id",
                      "is_active",
                      "name",
                      "parent_id",
                      "parent_name",
                      "reference",
                      "verification_phrase",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "client",
                        "orig" => "client",
                        "type" => "`$OBJECT`",
                      },
                      {
                        "kind" => "query",
                        "name" => "email",
                        "orig" => "email",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "first_name",
                        "orig" => "first_name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "is_active",
                        "orig" => "is_active",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "last_name",
                        "orig" => "last_name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "type" => "`$OBJECT`",
                      },
                      {
                        "kind" => "query",
                        "name" => "phone",
                        "orig" => "phone",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "send_welcome_email",
                        "orig" => "send_welcome_email",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "username",
                        "orig" => "username",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/users/{id}",
                  "parts" => [
                    "users",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "client",
                      "email",
                      "first_name",
                      "id",
                      "is_active",
                      "last_name",
                      "partner",
                      "phone",
                      "send_welcome_email",
                      "username",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "billing_id",
                        "orig" => "billing_id",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contact_id",
                        "orig" => "contact_id",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "direct_partner_id",
                        "orig" => "direct_partner_id",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "direct_partner_name",
                        "orig" => "direct_partner_name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "is_active",
                        "orig" => "is_active",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "mid",
                        "orig" => "mid",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "version",
                        "orig" => "version",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/clients/{id}",
                  "parts" => [
                    "clients",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "billing_id",
                      "contact_id",
                      "direct_partner_id",
                      "direct_partner_name",
                      "id",
                      "is_active",
                      "mid",
                      "name",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "user" => {
          "fields" => [
            {
              "name" => "client",
              "short" => "Reference to the associated Client resource.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "created",
              "short" => "Creation timestamp in ISO 8601 format.",
              "type" => "`$STRING`",
            },
            {
              "name" => "email",
              "type" => "`$STRING`",
            },
            {
              "name" => "firstName",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "short" => "This resource's unique identifier.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "isActive",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "lastName",
              "type" => "`$STRING`",
            },
            {
              "name" => "modified",
              "short" => "Last modified timestamp.",
              "type" => "`$STRING`",
            },
            {
              "name" => "partner",
              "short" => "Reference to the associated Partner.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "phone",
              "type" => "`$STRING`",
            },
            {
              "name" => "userName",
              "type" => "`$STRING`",
            },
            {
              "name" => "userRole",
              "short" => "Reference to the associated User Role.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "version",
              "short" => "The number of times that this resource has been updated.",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "user",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/users/{id}",
                  "parts" => [
                    "users",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    BluefinShieldconexMgmtFeatures.make_feature(name)
  end
end
