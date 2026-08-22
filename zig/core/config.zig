// Generated API configuration (mirrors go/rust core/config).

const std = @import("std");
const h = @import("helpers.zig");
const types = @import("types.zig");
const Value = h.Value;
const Feature = types.Feature;

pub fn make_config() Value {
    return h.jo(&.{
        .{ "main", h.jo(&.{
            .{ "name", h.vstr("BluefinShieldconexMgmt") },
        }) },
        .{ "feature", h.jo(&.{
            .{ "test", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
            }) },
        }) },
        .{ "options", h.jo(&.{
            .{ "base", h.vstr("https://portal-cert.shieldconex.com:4010/api/v1") },
            .{ "auth", h.jo(&.{
                .{ "prefix", h.vstr("Basic") },
            }) },
            .{ "headers", h.jo(&.{
                .{ "content-type", h.vstr("application/json") },
            }) },
            .{ "entity", h.jo(&.{
                .{ "client", h.omap() },
                .{ "clone", h.omap() },
                .{ "partner", h.omap() },
                .{ "template", h.omap() },
                .{ "transaction", h.omap() },
                .{ "update_result", h.omap() },
                .{ "user", h.omap() },
            }) },
        }) },
        .{ "entity", h.jo(&.{
            .{ "client", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("billingId") },
                        .{ "short", h.vstr("Billing ID") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contact") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                            .{ "list", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("directPartner") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "short", h.vstr("This property indicates if the Client account is active or disabled.") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mid") },
                        .{ "short", h.vstr("Some Partners will have an merchant ids on their own software offerings.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Client's name.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                }) },
                .{ "name", h.vstr("client") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("billing_id") },
                                            .{ "orig", h.vstr("billing_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_email") },
                                            .{ "orig", h.vstr("contact_email") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_first_name") },
                                            .{ "orig", h.vstr("contact_first_name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_is_active") },
                                            .{ "orig", h.vstr("contact_is_active") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_last_name") },
                                            .{ "orig", h.vstr("contact_last_name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_phone") },
                                            .{ "orig", h.vstr("contact_phone") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_send_welcome_email") },
                                            .{ "orig", h.vstr("contact_send_welcome_email") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_user_name") },
                                            .{ "orig", h.vstr("contact_user_name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_user_role") },
                                            .{ "orig", h.vstr("contact_user_role") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("direct_partner_id") },
                                            .{ "orig", h.vstr("direct_partner_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("direct_partner_name") },
                                            .{ "orig", h.vstr("direct_partner_name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("mid") },
                                            .{ "orig", h.vstr("mid") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/clients") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("billing_id"),
                                        h.vstr("contact_email"),
                                        h.vstr("contact_first_name"),
                                        h.vstr("contact_is_active"),
                                        h.vstr("contact_last_name"),
                                        h.vstr("contact_phone"),
                                        h.vstr("contact_send_welcome_email"),
                                        h.vstr("contact_user_name"),
                                        h.vstr("contact_user_role"),
                                        h.vstr("direct_partner_id"),
                                        h.vstr("direct_partner_name"),
                                        h.vstr("is_active"),
                                        h.vstr("mid"),
                                        h.vstr("name"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/clients") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("partner"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "clone", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "short", h.vstr("Unique identifier of newly added element.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "short", h.vstr("Name of Template") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("clone") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("template_id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/templates/{id}/clone") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("templates"),
                                    h.vstr("{template_id}"),
                                    h.vstr("clone"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "id", h.vstr("template_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("template_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("template"),
                        }),
                    }) },
                }) },
            }) },
            .{ "partner", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("billingId") },
                        .{ "short", h.vstr("The Partner's billing identifier.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contact") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                            .{ "list", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "short", h.vstr("This property indicates if the Parter account is active or disabled.") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Partner's name.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("parent") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "short", h.vstr("The Partner's reference string.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("verificationPhrase") },
                        .{ "short", h.vstr("The verification phrase is a message that the Partner creates.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                }) },
                .{ "name", h.vstr("partner") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("billing_id") },
                                            .{ "orig", h.vstr("billing_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_email") },
                                            .{ "orig", h.vstr("contact_email") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_first_name") },
                                            .{ "orig", h.vstr("contact_first_name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_is_active") },
                                            .{ "orig", h.vstr("contact_is_active") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_last_name") },
                                            .{ "orig", h.vstr("contact_last_name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_phone") },
                                            .{ "orig", h.vstr("contact_phone") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_send_welcome_email") },
                                            .{ "orig", h.vstr("contact_send_welcome_email") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_user_name") },
                                            .{ "orig", h.vstr("contact_user_name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_user_role") },
                                            .{ "orig", h.vstr("contact_user_role") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("parent_id") },
                                            .{ "orig", h.vstr("parent_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("parent_name") },
                                            .{ "orig", h.vstr("parent_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("verification_phrase") },
                                            .{ "orig", h.vstr("verification_phrase") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/partners") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("billing_id"),
                                        h.vstr("contact_email"),
                                        h.vstr("contact_first_name"),
                                        h.vstr("contact_is_active"),
                                        h.vstr("contact_last_name"),
                                        h.vstr("contact_phone"),
                                        h.vstr("contact_send_welcome_email"),
                                        h.vstr("contact_user_name"),
                                        h.vstr("contact_user_role"),
                                        h.vstr("is_active"),
                                        h.vstr("name"),
                                        h.vstr("parent_id"),
                                        h.vstr("parent_name"),
                                        h.vstr("reference"),
                                        h.vstr("verification_phrase"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/partners") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("partner"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/partners/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "template", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("accessMode") },
                        .{ "short", h.vstr("The Template's access mode.") },
                        .{ "type", h.vstr("`$ANY`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("active") },
                        .{ "short", h.vstr("This property indicates if the Template is active or inactive.") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("fieldTemplates") },
                        .{ "short", h.vstr("Field Template list items") },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "union", h.jo(&.{
                            .{ "branches", h.vnum(9) },
                            .{ "count", h.vnum(1) },
                            .{ "depth", h.vnum(1) },
                        }) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "short", h.vstr("Unique identifier of newly added element.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "short", h.vstr("The Template's name.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("options") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "short", h.vstr("The Template's unique reference.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("type") },
                        .{ "short", h.vstr("The Template's type.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                }) },
                .{ "name", h.vstr("template") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("access_mode") },
                                            .{ "orig", h.vstr("access_mode") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("active") },
                                            .{ "orig", h.vstr("active") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client_id") },
                                            .{ "orig", h.vstr("client_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client_name") },
                                            .{ "orig", h.vstr("client_name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("field_template") },
                                            .{ "orig", h.vstr("field_template") },
                                            .{ "type", h.vstr("`$ARRAY`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_custom_style") },
                                            .{ "orig", h.vstr("options_custom_style") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_custom_style_file") },
                                            .{ "orig", h.vstr("options_custom_style_file") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_domain") },
                                            .{ "orig", h.vstr("options_domain") },
                                            .{ "type", h.vstr("`$ARRAY`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_security_active_from") },
                                            .{ "orig", h.vstr("options_security_active_from") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_security_active_to") },
                                            .{ "orig", h.vstr("options_security_active_to") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_security_irreversible") },
                                            .{ "orig", h.vstr("options_security_irreversible") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner_id") },
                                            .{ "orig", h.vstr("partner_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner_name") },
                                            .{ "orig", h.vstr("partner_name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("type") },
                                            .{ "orig", h.vstr("type") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("version") },
                                            .{ "orig", h.vstr("version") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/templates") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("templates"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("access_mode"),
                                        h.vstr("active"),
                                        h.vstr("client_id"),
                                        h.vstr("client_name"),
                                        h.vstr("field_template"),
                                        h.vstr("name"),
                                        h.vstr("options_custom_style"),
                                        h.vstr("options_custom_style_file"),
                                        h.vstr("options_domain"),
                                        h.vstr("options_security_active_from"),
                                        h.vstr("options_security_active_to"),
                                        h.vstr("options_security_irreversible"),
                                        h.vstr("partner_id"),
                                        h.vstr("partner_name"),
                                        h.vstr("reference"),
                                        h.vstr("type"),
                                        h.vstr("version"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/templates") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("templates"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("partner"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/templates/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("templates"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/templates/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("templates"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "transaction", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("bfid") },
                        .{ "short", h.vstr("BFID") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("completeDate") },
                        .{ "short", h.vstr("Timestamp from the beginning of the transaction.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("directPartner") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("errCode") },
                        .{ "short", h.vstr("The error code that is sent in response to a failed decrypt API call.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("errMessage") },
                        .{ "short", h.vstr("The error messge that is sent in response to a failed decrypt API call.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("ipAddress") },
                        .{ "short", h.vstr("The IP address of the http client that makes the decrypt API call.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("messageId") },
                        .{ "short", h.vstr("Message ID.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "short", h.vstr("The reference property that the Client includes in the decrypt API call.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("success") },
                        .{ "short", h.vstr("The success indicator.") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("templateId") },
                        .{ "short", h.vstr("The Template's unique identifier.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("transaction") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("date_from") },
                                            .{ "orig", h.vstr("date_from") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("date_to") },
                                            .{ "orig", h.vstr("date_to") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("message_id") },
                                            .{ "orig", h.vstr("message_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("paging_mode") },
                                            .{ "orig", h.vstr("paging_mode") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("success") },
                                            .{ "orig", h.vstr("success") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("transaction_type") },
                                            .{ "orig", h.vstr("transaction_type") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/transactions") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("date_from"),
                                        h.vstr("date_to"),
                                        h.vstr("message_id"),
                                        h.vstr("paging_mode"),
                                        h.vstr("partner"),
                                        h.vstr("reference"),
                                        h.vstr("skip"),
                                        h.vstr("success"),
                                        h.vstr("take"),
                                        h.vstr("transaction_type"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("transaction_type") },
                                            .{ "orig", h.vstr("transaction_type") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/transactions/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                        h.vstr("transaction_type"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "update_result", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("billingId") },
                        .{ "short", h.vstr("The Partner's billing identifier.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contact") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("directPartner") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("email") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The User's email address.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("firstName") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The User's name.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "short", h.vstr("Unique identifier of newly added element.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "short", h.vstr("This property indicates if the User account is active or disabled.") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("lastName") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The User's Surname.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mid") },
                        .{ "short", h.vstr("Some Partners will have an merchant ids on their own software offerings.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "short", h.vstr("The Partner's name.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("parent") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("phone") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The User's phone number without dashes, spaces, or brackets (e.g.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "short", h.vstr("The Partner's reference string.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sendWelcomeEmail") },
                        .{ "short", h.vstr("If this property is set to 'true' the newly created user will be sent a welcome email.") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userName") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The User's unique username.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userRole") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User Role.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("verificationPhrase") },
                        .{ "short", h.vstr("The verification phrase is a message that the Partner creates.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                }) },
                .{ "name", h.vstr("update_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$OBJECT`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("email") },
                                            .{ "orig", h.vstr("email") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("first_name") },
                                            .{ "orig", h.vstr("first_name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("last_name") },
                                            .{ "orig", h.vstr("last_name") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$OBJECT`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("phone") },
                                            .{ "orig", h.vstr("phone") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("send_welcome_email") },
                                            .{ "orig", h.vstr("send_welcome_email") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("user_role") },
                                            .{ "orig", h.vstr("user_role") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$OBJECT`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("username") },
                                            .{ "orig", h.vstr("username") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/users") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("email"),
                                        h.vstr("first_name"),
                                        h.vstr("is_active"),
                                        h.vstr("last_name"),
                                        h.vstr("partner"),
                                        h.vstr("phone"),
                                        h.vstr("send_welcome_email"),
                                        h.vstr("user_role"),
                                        h.vstr("username"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/users") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("partner"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "update", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("update") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("access_mode") },
                                            .{ "orig", h.vstr("access_mode") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("active") },
                                            .{ "orig", h.vstr("active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client_id") },
                                            .{ "orig", h.vstr("client_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client_name") },
                                            .{ "orig", h.vstr("client_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("field_template") },
                                            .{ "orig", h.vstr("field_template") },
                                            .{ "type", h.vstr("`$ARRAY`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_custom_style") },
                                            .{ "orig", h.vstr("options_custom_style") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_custom_style_file") },
                                            .{ "orig", h.vstr("options_custom_style_file") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_domain") },
                                            .{ "orig", h.vstr("options_domain") },
                                            .{ "type", h.vstr("`$ARRAY`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_security_active_from") },
                                            .{ "orig", h.vstr("options_security_active_from") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_security_active_to") },
                                            .{ "orig", h.vstr("options_security_active_to") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("options_security_irreversible") },
                                            .{ "orig", h.vstr("options_security_irreversible") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner_id") },
                                            .{ "orig", h.vstr("partner_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner_name") },
                                            .{ "orig", h.vstr("partner_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("type") },
                                            .{ "orig", h.vstr("type") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("version") },
                                            .{ "orig", h.vstr("version") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/templates/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("templates"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("access_mode"),
                                        h.vstr("active"),
                                        h.vstr("client_id"),
                                        h.vstr("client_name"),
                                        h.vstr("field_template"),
                                        h.vstr("id"),
                                        h.vstr("name"),
                                        h.vstr("options_custom_style"),
                                        h.vstr("options_custom_style_file"),
                                        h.vstr("options_domain"),
                                        h.vstr("options_security_active_from"),
                                        h.vstr("options_security_active_to"),
                                        h.vstr("options_security_irreversible"),
                                        h.vstr("partner_id"),
                                        h.vstr("partner_name"),
                                        h.vstr("reference"),
                                        h.vstr("type"),
                                        h.vstr("version"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("billing_id") },
                                            .{ "orig", h.vstr("billing_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_id") },
                                            .{ "orig", h.vstr("contact_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("parent_id") },
                                            .{ "orig", h.vstr("parent_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("parent_name") },
                                            .{ "orig", h.vstr("parent_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("verification_phrase") },
                                            .{ "orig", h.vstr("verification_phrase") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("version") },
                                            .{ "orig", h.vstr("version") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/partners/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("billing_id"),
                                        h.vstr("contact_id"),
                                        h.vstr("id"),
                                        h.vstr("is_active"),
                                        h.vstr("name"),
                                        h.vstr("parent_id"),
                                        h.vstr("parent_name"),
                                        h.vstr("reference"),
                                        h.vstr("verification_phrase"),
                                        h.vstr("version"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$OBJECT`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("email") },
                                            .{ "orig", h.vstr("email") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("first_name") },
                                            .{ "orig", h.vstr("first_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("last_name") },
                                            .{ "orig", h.vstr("last_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$OBJECT`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("phone") },
                                            .{ "orig", h.vstr("phone") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("send_welcome_email") },
                                            .{ "orig", h.vstr("send_welcome_email") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("username") },
                                            .{ "orig", h.vstr("username") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/users/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("email"),
                                        h.vstr("first_name"),
                                        h.vstr("id"),
                                        h.vstr("is_active"),
                                        h.vstr("last_name"),
                                        h.vstr("partner"),
                                        h.vstr("phone"),
                                        h.vstr("send_welcome_email"),
                                        h.vstr("username"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("billing_id") },
                                            .{ "orig", h.vstr("billing_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("contact_id") },
                                            .{ "orig", h.vstr("contact_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("direct_partner_id") },
                                            .{ "orig", h.vstr("direct_partner_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("direct_partner_name") },
                                            .{ "orig", h.vstr("direct_partner_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("mid") },
                                            .{ "orig", h.vstr("mid") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("version") },
                                            .{ "orig", h.vstr("version") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("billing_id"),
                                        h.vstr("contact_id"),
                                        h.vstr("direct_partner_id"),
                                        h.vstr("direct_partner_name"),
                                        h.vstr("id"),
                                        h.vstr("is_active"),
                                        h.vstr("mid"),
                                        h.vstr("name"),
                                        h.vstr("version"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "user", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("email") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("firstName") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("lastName") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("phone") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userName") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userRole") },
                        .{ "short", h.vstr("Reference to the associated User Role.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                }) },
                .{ "name", h.vstr("user") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/users/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
        }) },
    });
}

// SHARED CONFIG (sdkgen rung L2).
//
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client. Above the
// size threshold make_config re-parses the whole embedded JSON, so this is the
// difference between parsing the model once and once per client.
//
// Value nodes are arena-allocated and reference-stable, so the shared value is
// genuinely one structure, not a copy.
var shared_config_val: ?Value = null;

/// The process-wide config, built once on first use.
///
/// The returned Value SHARES its nodes: treat it as read-only. Callers that
/// need to mutate should use make_config, which always returns a fresh copy.
pub fn shared_config() Value {
    if (shared_config_val) |c| return c;
    const c = make_config();
    shared_config_val = c;
    return c;
}

pub fn make_feature(name: []const u8) Feature {
    if (std.mem.eql(u8, name, "audit")) return @import("../feature/audit.zig").AuditFeature.make();
    if (std.mem.eql(u8, name, "cache")) return @import("../feature/cache.zig").CacheFeature.make();
    if (std.mem.eql(u8, name, "clienttrack")) return @import("../feature/clienttrack.zig").ClienttrackFeature.make();
    if (std.mem.eql(u8, name, "debug")) return @import("../feature/debug.zig").DebugFeature.make();
    if (std.mem.eql(u8, name, "idempotency")) return @import("../feature/idempotency.zig").IdempotencyFeature.make();
    if (std.mem.eql(u8, name, "log")) return @import("../feature/log.zig").LogFeature.make();
    if (std.mem.eql(u8, name, "metrics")) return @import("../feature/metrics.zig").MetricsFeature.make();
    if (std.mem.eql(u8, name, "netsim")) return @import("../feature/netsim.zig").NetsimFeature.make();
    if (std.mem.eql(u8, name, "paging")) return @import("../feature/paging.zig").PagingFeature.make();
    if (std.mem.eql(u8, name, "proxy")) return @import("../feature/proxy.zig").ProxyFeature.make();
    if (std.mem.eql(u8, name, "ratelimit")) return @import("../feature/ratelimit.zig").RatelimitFeature.make();
    if (std.mem.eql(u8, name, "rbac")) return @import("../feature/rbac.zig").RbacFeature.make();
    if (std.mem.eql(u8, name, "retry")) return @import("../feature/retry.zig").RetryFeature.make();
    if (std.mem.eql(u8, name, "streaming")) return @import("../feature/streaming.zig").StreamingFeature.make();
    if (std.mem.eql(u8, name, "telemetry")) return @import("../feature/telemetry.zig").TelemetryFeature.make();
    if (std.mem.eql(u8, name, "test")) return @import("../feature/test.zig").TestFeature.make();
    if (std.mem.eql(u8, name, "timeout")) return @import("../feature/timeout.zig").TimeoutFeature.make();
    return @import("../feature/base.zig").BaseFeature.make();
}
