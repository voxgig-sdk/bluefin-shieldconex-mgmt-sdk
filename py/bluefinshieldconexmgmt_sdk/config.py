# BluefinShieldconexMgmt SDK configuration


# The sekreto plugin DEFINITIONS the model selected per feature, imported
# above by name from the modules the catalogue's active `plugin.def`
# entries declare. Handed to each feature (secrets builds its Sekreto
# with them): a provider kind not listed here is unknown to that SDK.
FEATURE_PLUGINS = {
}


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "BluefinShieldconexMgmt",
            "slug": "bluefin-shieldconex-mgmt",
            "version": "0.1.1",
            "target": "py",
        },
        "feature": {
            "audit": {
        "options": {
          "active": False,
          "actor": "anonymous",
          "max": 1000,
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "sink": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "clienttrack": {
        "options": {
          "active": False,
          "clientVersion": "0.0.1",
        },
        "optspec": {
          "clientName": "`$STRING`",
          "clientVersion": "`$STRING`",
          "headers": "`$MAP`",
          "idgen": "`$FUNCTION`",
          "sessionId": "`$STRING`",
        },
        "strict": False,
        "transport": "none",
      },
            "debug": {
        "options": {
          "active": False,
          "max": 100,
          "redact": [
            "authorization",
            "cookie",
            "set-cookie",
            "api-key",
            "apikey",
            "x-api-key",
            "idempotency-key",
          ],
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "onEntry": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "idempotency": {
        "options": {
          "active": False,
          "header": "Idempotency-Key",
          "methods": [
            "POST",
            "PUT",
            "PATCH",
            "DELETE",
          ],
          "ops": [
            "create",
            "update",
            "remove",
          ],
        },
        "optspec": {
          "keygen": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "log": {
        "options": {
          "active": True,
        },
        "optspec": {
          "level": "`$STRING`",
          "logger": "`$ANY`",
        },
        "strict": False,
        "transport": "none",
      },
            "metrics": {
        "options": {
          "active": False,
        },
        "optspec": {
          "now": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "paging": {
        "options": {
          "active": False,
          "afterVar": "after",
          "cursorParam": "cursor",
          "firstVar": "first",
          "limitParam": "limit",
          "pageParam": "page",
          "startPage": 1,
        },
        "optspec": {
          "limit": "`$NUMBER`",
          "ops": "`$LIST`",
        },
        "strict": False,
        "transport": "none",
      },
            "ratelimit": {
        "options": {
          "active": False,
          "burst": 5,
          "rate": 5,
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "retry": {
        "options": {
          "active": False,
          "factor": 2,
          "maxDelay": 2000,
          "minDelay": 50,
          "retries": 2,
          "statuses": [
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          ],
        },
        "optspec": {
          "jitter": "`$BOOLEAN`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "telemetry": {
        "options": {
          "active": False,
        },
        "optspec": {
          "exporter": "`$FUNCTION`",
          "headers": "`$MAP`",
          "idgen": "`$FUNCTION`",
          "now": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "test": {
        "options": {
          "active": False,
        },
        "optspec": {
          "entity": "`$MAP`",
          "net": "`$MAP`",
        },
        "strict": False,
        "transport": "base",
      },
            "timeout": {
        "options": {
          "active": False,
          "ms": 30000,
        },
        "optspec": {
          "clearTimer": "`$FUNCTION`",
          "setTimer": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
        },
        "options": {
            "base": "https://portal-cert.shieldconex.com:4010/api/v1",
            "auth": {
                "prefix": "Basic",
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "client": {},
                "clone": {},
                "partner": {},
                "template": {},
                "transaction": {},
                "update_result": {},
                "user": {},
            },
        },
        "entity": {
      "client": {
        "fields": [
          {
            "name": "billingId",
            "title": "Billing Id",
            "type": "`$STRING`",
            "short": "Billing ID",
          },
          {
            "name": "contact",
            "title": "Contact",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
              "list": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "date-time",
          },
          {
            "name": "directPartner",
            "title": "Direct Partner",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "This resource's unique identifier.",
            "format": "int64",
          },
          {
            "name": "isActive",
            "title": "Is Active",
            "type": "`$BOOLEAN`",
            "short": "This property indicates if the Client account is active or disabled.",
          },
          {
            "name": "mid",
            "title": "Mid",
            "type": "`$STRING`",
            "short": "Some Partners will have an merchant ids on their own software offerings.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "date-time",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The Client's name.",
          },
          {
            "name": "partner",
            "title": "Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "client",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/clients",
                "segments": [
                  {
                    "lit": "clients",
                  },
                ],
                "parts": [
                  "clients",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "query": [
                    {
                      "name": "billing_id",
                      "orig": "billing_id",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "contact_email",
                      "orig": "contact_email",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_first_name",
                      "orig": "contact_first_name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_is_active",
                      "orig": "contact_is_active",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_last_name",
                      "orig": "contact_last_name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_phone",
                      "orig": "contact_phone",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_send_welcome_email",
                      "orig": "contact_send_welcome_email",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_user_name",
                      "orig": "contact_user_name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_user_role",
                      "orig": "contact_user_role",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "direct_partner_id",
                      "orig": "direct_partner_id",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "direct_partner_name",
                      "orig": "direct_partner_name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "is_active",
                      "orig": "is_active",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "mid",
                      "orig": "mid",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "name",
                      "orig": "name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                  ],
                },
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
                    "name",
                  ],
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/clients",
                "segments": [
                  {
                    "lit": "clients",
                  },
                ],
                "parts": [
                  "clients",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "partner",
                    "skip",
                    "take",
                  ],
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/clients/{id}",
                "segments": [
                  {
                    "lit": "clients",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "clients",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
              },
            ],
          },
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "kind": "http",
                "method": "DELETE",
                "orig": "/clients/{id}",
                "segments": [
                  {
                    "lit": "clients",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "clients",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "clone": {
        "fields": [
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "Unique identifier of newly added element.",
            "format": "int64",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "short": "Name of Template",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "clone",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/templates/{id}/clone",
                "segments": [
                  {
                    "lit": "templates",
                  },
                  {
                    "var": "template_id",
                  },
                  {
                    "lit": "clone",
                  },
                ],
                "parts": [
                  "templates",
                  "{template_id}",
                  "clone",
                ],
                "rename": {
                  "param": {
                    "id": "template_id",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "template_id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "template_id",
                  ],
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [
            [
              "$.main.kit.entity.template",
            ],
          ],
        },
      },
      "partner": {
        "fields": [
          {
            "name": "billingId",
            "title": "Billing Id",
            "type": "`$STRING`",
            "short": "The Partner's billing identifier.",
          },
          {
            "name": "contact",
            "title": "Contact",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
              "list": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "date-time",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "This resource's unique identifier.",
            "format": "int64",
          },
          {
            "name": "isActive",
            "title": "Is Active",
            "type": "`$BOOLEAN`",
            "short": "This property indicates if the Parter account is active or disabled.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "date-time",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The Partner's name.",
          },
          {
            "name": "parent",
            "title": "Parent",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "reference",
            "title": "Reference",
            "type": "`$STRING`",
            "short": "The Partner's reference string.",
          },
          {
            "name": "verificationPhrase",
            "title": "Verification Phrase",
            "type": "`$STRING`",
            "short": "The verification phrase is a message that the Partner creates.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "partner",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/partners",
                "segments": [
                  {
                    "lit": "partners",
                  },
                ],
                "parts": [
                  "partners",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "query": [
                    {
                      "name": "billing_id",
                      "orig": "billing_id",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_email",
                      "orig": "contact_email",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_first_name",
                      "orig": "contact_first_name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_is_active",
                      "orig": "contact_is_active",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_last_name",
                      "orig": "contact_last_name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_phone",
                      "orig": "contact_phone",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_send_welcome_email",
                      "orig": "contact_send_welcome_email",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_user_name",
                      "orig": "contact_user_name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "contact_user_role",
                      "orig": "contact_user_role",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "is_active",
                      "orig": "is_active",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "name",
                      "orig": "name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "parent_id",
                      "orig": "parent_id",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                    {
                      "name": "parent_name",
                      "orig": "parent_name",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "reference",
                      "orig": "reference",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "verification_phrase",
                      "orig": "verification_phrase",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                  ],
                },
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
                    "verification_phrase",
                  ],
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/partners",
                "segments": [
                  {
                    "lit": "partners",
                  },
                ],
                "parts": [
                  "partners",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "partner",
                    "skip",
                    "take",
                  ],
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/partners/{id}",
                "segments": [
                  {
                    "lit": "partners",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "partners",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "template": {
        "fields": [
          {
            "name": "accessMode",
            "title": "Access Mode",
            "type": "`$ANY`",
            "short": "The Template's access mode.",
          },
          {
            "name": "active",
            "title": "Active",
            "type": "`$BOOLEAN`",
            "short": "This property indicates if the Template is active or inactive.",
          },
          {
            "name": "client",
            "title": "Client",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Client resource.",
          },
          {
            "name": "fieldTemplates",
            "title": "Field Templates",
            "type": "`$ARRAY`",
            "short": "Field Template list items",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "Unique identifier of newly added element.",
            "format": "int64",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "short": "The Template's name.",
          },
          {
            "name": "options",
            "title": "Options",
            "type": "`$OBJECT`",
          },
          {
            "name": "partner",
            "title": "Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "reference",
            "title": "Reference",
            "type": "`$STRING`",
            "short": "The Template's unique reference.",
          },
          {
            "name": "type",
            "title": "Type",
            "type": "`$STRING`",
            "short": "The Template's type.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "template",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/templates",
                "segments": [
                  {
                    "lit": "templates",
                  },
                ],
                "parts": [
                  "templates",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "query": [
                    {
                      "name": "access_mode",
                      "orig": "access_mode",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "active",
                      "orig": "active",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "client_id",
                      "orig": "client_id",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "client_name",
                      "orig": "client_name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "field_template",
                      "orig": "field_template",
                      "type": "`$ARRAY`",
                      "kind": "query",
                    },
                    {
                      "name": "name",
                      "orig": "name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "options_custom_style",
                      "orig": "options_custom_style",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "options_custom_style_file",
                      "orig": "options_custom_style_file",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "options_domain",
                      "orig": "options_domain",
                      "type": "`$ARRAY`",
                      "kind": "query",
                    },
                    {
                      "name": "options_security_active_from",
                      "orig": "options_security_active_from",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "options_security_active_to",
                      "orig": "options_security_active_to",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "options_security_irreversible",
                      "orig": "options_security_irreversible",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                    },
                    {
                      "name": "partner_id",
                      "orig": "partner_id",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "partner_name",
                      "orig": "partner_name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "reference",
                      "orig": "reference",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "type",
                      "orig": "type",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "version",
                      "orig": "version",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                  ],
                },
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
                    "version",
                  ],
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/templates",
                "segments": [
                  {
                    "lit": "templates",
                  },
                ],
                "parts": [
                  "templates",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "client",
                      "orig": "client",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "client",
                    "partner",
                    "skip",
                    "take",
                  ],
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/templates/{id}",
                "segments": [
                  {
                    "lit": "templates",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "templates",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
              },
            ],
          },
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "kind": "http",
                "method": "DELETE",
                "orig": "/templates/{id}",
                "segments": [
                  {
                    "lit": "templates",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "templates",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "transaction": {
        "fields": [
          {
            "name": "bfid",
            "title": "Bfid",
            "type": "`$STRING`",
            "short": "BFID",
          },
          {
            "name": "client",
            "title": "Client",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Client resource.",
          },
          {
            "name": "completeDate",
            "title": "Complete Date",
            "type": "`$STRING`",
            "short": "Timestamp from the beginning of the transaction.",
            "format": "date-time",
          },
          {
            "name": "directPartner",
            "title": "Direct Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "errCode",
            "title": "Err Code",
            "type": "`$STRING`",
            "short": "The error code that is sent in response to a failed decrypt API call.",
          },
          {
            "name": "errMessage",
            "title": "Err Message",
            "type": "`$STRING`",
            "short": "The error messge that is sent in response to a failed decrypt API call.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "This resource's unique identifier.",
            "format": "int64",
          },
          {
            "name": "ipAddress",
            "title": "Ip Address",
            "type": "`$STRING`",
            "short": "The IP address of the http client that makes the decrypt API call.",
          },
          {
            "name": "messageId",
            "title": "Message Id",
            "type": "`$STRING`",
            "short": "Message ID.",
          },
          {
            "name": "partner",
            "title": "Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "reference",
            "title": "Reference",
            "type": "`$STRING`",
            "short": "The reference property that the Client includes in the decrypt API call.",
          },
          {
            "name": "success",
            "title": "Success",
            "type": "`$BOOLEAN`",
            "short": "The success indicator.",
          },
          {
            "name": "templateId",
            "title": "Template Id",
            "type": "`$STRING`",
            "short": "The Template's unique identifier.",
            "format": "int32",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "transaction",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/transactions",
                "segments": [
                  {
                    "lit": "transactions",
                  },
                ],
                "parts": [
                  "transactions",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "client",
                      "orig": "client",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "date_from",
                      "orig": "date_from",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "date_to",
                      "orig": "date_to",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "message_id",
                      "orig": "message_id",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "paging_mode",
                      "orig": "paging_mode",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "reference",
                      "orig": "reference",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "success",
                      "orig": "success",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                    {
                      "name": "transaction_type",
                      "orig": "transaction_type",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                  ],
                },
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
                    "transaction_type",
                  ],
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/transactions/{id}",
                "segments": [
                  {
                    "lit": "transactions",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "transactions",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                  "query": [
                    {
                      "name": "transaction_type",
                      "orig": "transaction_type",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                    "transaction_type",
                  ],
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "update_result": {
        "fields": [
          {
            "name": "billingId",
            "title": "Billing Id",
            "type": "`$STRING`",
            "short": "The Partner's billing identifier.",
          },
          {
            "name": "client",
            "title": "Client",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Client resource.",
          },
          {
            "name": "contact",
            "title": "Contact",
            "type": "`$OBJECT`",
            "req": True,
          },
          {
            "name": "directPartner",
            "title": "Direct Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "email",
            "title": "Email",
            "type": "`$STRING`",
            "req": True,
            "op": {
              "list": {
                "type": "`$STRING`",
              },
              "update": {
                "type": "`$STRING`",
              },
            },
            "short": "The User's email address.",
          },
          {
            "name": "firstName",
            "title": "First Name",
            "type": "`$STRING`",
            "req": True,
            "op": {
              "list": {
                "type": "`$STRING`",
              },
              "update": {
                "type": "`$STRING`",
              },
            },
            "short": "The User's name.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "Unique identifier of newly added element.",
            "format": "int64",
          },
          {
            "name": "isActive",
            "title": "Is Active",
            "type": "`$BOOLEAN`",
            "short": "This property indicates if the User account is active or disabled.",
          },
          {
            "name": "lastName",
            "title": "Last Name",
            "type": "`$STRING`",
            "req": True,
            "op": {
              "list": {
                "type": "`$STRING`",
              },
              "update": {
                "type": "`$STRING`",
              },
            },
            "short": "The User's Surname.",
          },
          {
            "name": "mid",
            "title": "Mid",
            "type": "`$STRING`",
            "short": "Some Partners will have an merchant ids on their own software offerings.",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "short": "The Partner's name.",
          },
          {
            "name": "parent",
            "title": "Parent",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "partner",
            "title": "Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "phone",
            "title": "Phone",
            "type": "`$STRING`",
            "req": True,
            "op": {
              "list": {
                "type": "`$STRING`",
              },
              "update": {
                "type": "`$STRING`",
              },
            },
            "short": "The User's phone number without dashes, spaces, or brackets (e.g.",
          },
          {
            "name": "reference",
            "title": "Reference",
            "type": "`$STRING`",
            "short": "The Partner's reference string.",
          },
          {
            "name": "sendWelcomeEmail",
            "title": "Send Welcome Email",
            "type": "`$BOOLEAN`",
            "short": "If this property is set to 'true' the newly created user will be sent a welcome email.",
          },
          {
            "name": "userName",
            "title": "User Name",
            "type": "`$STRING`",
            "req": True,
            "op": {
              "list": {
                "type": "`$STRING`",
              },
              "update": {
                "type": "`$STRING`",
              },
            },
            "short": "The User's unique username.",
          },
          {
            "name": "userRole",
            "title": "User Role",
            "type": "`$OBJECT`",
            "req": True,
            "op": {
              "list": {
                "type": "`$OBJECT`",
              },
              "update": {
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated User Role.",
          },
          {
            "name": "verificationPhrase",
            "title": "Verification Phrase",
            "type": "`$STRING`",
            "short": "The verification phrase is a message that the Partner creates.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "update_result",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/users",
                "segments": [
                  {
                    "lit": "users",
                  },
                ],
                "parts": [
                  "users",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "query": [
                    {
                      "name": "client",
                      "orig": "client",
                      "type": "`$OBJECT`",
                      "kind": "query",
                    },
                    {
                      "name": "email",
                      "orig": "email",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "first_name",
                      "orig": "first_name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "is_active",
                      "orig": "is_active",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "last_name",
                      "orig": "last_name",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$OBJECT`",
                      "kind": "query",
                    },
                    {
                      "name": "phone",
                      "orig": "phone",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "send_welcome_email",
                      "orig": "send_welcome_email",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "user_role",
                      "orig": "user_role",
                      "type": "`$OBJECT`",
                      "kind": "query",
                      "reqd": True,
                    },
                    {
                      "name": "username",
                      "orig": "username",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                    },
                  ],
                },
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
                    "username",
                  ],
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/users",
                "segments": [
                  {
                    "lit": "users",
                  },
                ],
                "parts": [
                  "users",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "client",
                      "orig": "client",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "client",
                    "partner",
                    "skip",
                    "take",
                  ],
                },
              },
            ],
          },
          "update": {
            "input": "data",
            "name": "update",
            "points": [
              {
                "kind": "http",
                "method": "PATCH",
                "orig": "/templates/{id}",
                "segments": [
                  {
                    "lit": "templates",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "templates",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                  "query": [
                    {
                      "name": "access_mode",
                      "orig": "access_mode",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "active",
                      "orig": "active",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                    },
                    {
                      "name": "client_id",
                      "orig": "client_id",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                    {
                      "name": "client_name",
                      "orig": "client_name",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "field_template",
                      "orig": "field_template",
                      "type": "`$ARRAY`",
                      "kind": "query",
                    },
                    {
                      "name": "name",
                      "orig": "name",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "options_custom_style",
                      "orig": "options_custom_style",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "options_custom_style_file",
                      "orig": "options_custom_style_file",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "options_domain",
                      "orig": "options_domain",
                      "type": "`$ARRAY`",
                      "kind": "query",
                    },
                    {
                      "name": "options_security_active_from",
                      "orig": "options_security_active_from",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "options_security_active_to",
                      "orig": "options_security_active_to",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "options_security_irreversible",
                      "orig": "options_security_irreversible",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                    },
                    {
                      "name": "partner_id",
                      "orig": "partner_id",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                    {
                      "name": "partner_name",
                      "orig": "partner_name",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "reference",
                      "orig": "reference",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "type",
                      "orig": "type",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "version",
                      "orig": "version",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                  ],
                },
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
                    "version",
                  ],
                },
              },
              {
                "kind": "http",
                "method": "PATCH",
                "orig": "/partners/{id}",
                "segments": [
                  {
                    "lit": "partners",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "partners",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                  "query": [
                    {
                      "name": "billing_id",
                      "orig": "billing_id",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "contact_id",
                      "orig": "contact_id",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                    {
                      "name": "is_active",
                      "orig": "is_active",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                    },
                    {
                      "name": "name",
                      "orig": "name",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "parent_id",
                      "orig": "parent_id",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                    {
                      "name": "parent_name",
                      "orig": "parent_name",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "reference",
                      "orig": "reference",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "verification_phrase",
                      "orig": "verification_phrase",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "version",
                      "orig": "version",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                  ],
                },
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
                    "version",
                  ],
                },
              },
              {
                "kind": "http",
                "method": "PATCH",
                "orig": "/users/{id}",
                "segments": [
                  {
                    "lit": "users",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "users",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                  "query": [
                    {
                      "name": "client",
                      "orig": "client",
                      "type": "`$OBJECT`",
                      "kind": "query",
                    },
                    {
                      "name": "email",
                      "orig": "email",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "first_name",
                      "orig": "first_name",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "is_active",
                      "orig": "is_active",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                    },
                    {
                      "name": "last_name",
                      "orig": "last_name",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$OBJECT`",
                      "kind": "query",
                    },
                    {
                      "name": "phone",
                      "orig": "phone",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                    {
                      "name": "send_welcome_email",
                      "orig": "send_welcome_email",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                    },
                    {
                      "name": "username",
                      "orig": "username",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                  ],
                },
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
                    "username",
                  ],
                },
              },
              {
                "kind": "http",
                "method": "PATCH",
                "orig": "/clients/{id}",
                "segments": [
                  {
                    "lit": "clients",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "clients",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                  "query": [
                    {
                      "name": "billing_id",
                      "orig": "billing_id",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "contact_id",
                      "orig": "contact_id",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                    {
                      "name": "direct_partner_id",
                      "orig": "direct_partner_id",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                    {
                      "name": "direct_partner_name",
                      "orig": "direct_partner_name",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "is_active",
                      "orig": "is_active",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                    },
                    {
                      "name": "mid",
                      "orig": "mid",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "name",
                      "orig": "name",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "version",
                      "orig": "version",
                      "type": "`$INTEGER`",
                      "kind": "query",
                    },
                  ],
                },
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
                    "version",
                  ],
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "user": {
        "fields": [
          {
            "name": "client",
            "title": "Client",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Client resource.",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "date-time",
          },
          {
            "name": "email",
            "title": "Email",
            "type": "`$STRING`",
          },
          {
            "name": "firstName",
            "title": "First Name",
            "type": "`$STRING`",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "This resource's unique identifier.",
            "format": "int64",
          },
          {
            "name": "isActive",
            "title": "Is Active",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "lastName",
            "title": "Last Name",
            "type": "`$STRING`",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "date-time",
          },
          {
            "name": "partner",
            "title": "Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "phone",
            "title": "Phone",
            "type": "`$STRING`",
          },
          {
            "name": "userName",
            "title": "User Name",
            "type": "`$STRING`",
          },
          {
            "name": "userRole",
            "title": "User Role",
            "type": "`$OBJECT`",
            "short": "Reference to the associated User Role.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "user",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/users/{id}",
                "segments": [
                  {
                    "lit": "users",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "users",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
