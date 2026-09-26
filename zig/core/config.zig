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
            .{ "slug", h.vstr("bluefin-shieldconex-mgmt") },
            .{ "version", h.vstr("0.1.1") },
            .{ "target", h.vstr("zig") },
        }) },
        .{ "feature", h.jo(&.{
            .{ "audit", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "actor", h.vstr("anonymous") },
                    .{ "max", h.vnum(1000) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "sink", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "clienttrack", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "clientVersion", h.vstr("0.0.1") },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "clientName", h.vstr("`$STRING`") },
                    .{ "clientVersion", h.vstr("`$STRING`") },
                    .{ "headers", h.vstr("`$MAP`") },
                    .{ "idgen", h.vstr("`$FUNCTION`") },
                    .{ "sessionId", h.vstr("`$STRING`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "debug", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "max", h.vnum(100) },
                    .{ "redact", h.ja(&.{
                        h.vstr("authorization"),
                        h.vstr("cookie"),
                        h.vstr("set-cookie"),
                        h.vstr("api-key"),
                        h.vstr("apikey"),
                        h.vstr("x-api-key"),
                        h.vstr("idempotency-key"),
                    }) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "onEntry", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "idempotency", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "header", h.vstr("Idempotency-Key") },
                    .{ "methods", h.ja(&.{
                        h.vstr("POST"),
                        h.vstr("PUT"),
                        h.vstr("PATCH"),
                        h.vstr("DELETE"),
                    }) },
                    .{ "ops", h.ja(&.{
                        h.vstr("create"),
                        h.vstr("update"),
                        h.vstr("remove"),
                    }) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "keygen", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "log", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(true) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "level", h.vstr("`$STRING`") },
                    .{ "logger", h.vstr("`$ANY`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "metrics", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "paging", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "afterVar", h.vstr("after") },
                    .{ "cursorParam", h.vstr("cursor") },
                    .{ "firstVar", h.vstr("first") },
                    .{ "limitParam", h.vstr("limit") },
                    .{ "pageParam", h.vstr("page") },
                    .{ "startPage", h.vnum(1) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "limit", h.vstr("`$NUMBER`") },
                    .{ "ops", h.vstr("`$LIST`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "ratelimit", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "burst", h.vnum(5) },
                    .{ "rate", h.vnum(5) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "sleep", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("wrap") },
            }) },
            .{ "retry", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "factor", h.vnum(2) },
                    .{ "maxDelay", h.vnum(2000) },
                    .{ "minDelay", h.vnum(50) },
                    .{ "retries", h.vnum(2) },
                    .{ "statuses", h.ja(&.{
                        h.vnum(408),
                        h.vnum(425),
                        h.vnum(429),
                        h.vnum(500),
                        h.vnum(502),
                        h.vnum(503),
                        h.vnum(504),
                    }) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "jitter", h.vstr("`$BOOLEAN`") },
                    .{ "sleep", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("wrap") },
            }) },
            .{ "telemetry", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "exporter", h.vstr("`$FUNCTION`") },
                    .{ "headers", h.vstr("`$MAP`") },
                    .{ "idgen", h.vstr("`$FUNCTION`") },
                    .{ "now", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "test", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "entity", h.vstr("`$MAP`") },
                    .{ "net", h.vstr("`$MAP`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("base") },
            }) },
            .{ "timeout", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "ms", h.vnum(30000) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "clearTimer", h.vstr("`$FUNCTION`") },
                    .{ "setTimer", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("wrap") },
            }) },
        }) },
        .{ "options", h.jo(&.{
            .{ "base", h.vstr("https://portal-cert.shieldconex.com:4010/api/v1") },
            .{ "auth", h.jo(&.{
                .{ "prefix", h.vstr("Basic") },
                .{ "basic", h.vbool(true) },
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
                        .{ "title", h.vstr("Billing Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Billing ID") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contact") },
                        .{ "title", h.vstr("Contact") },
                        .{ "type", h.vstr("`$OBJECT`") },
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
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("directPartner") },
                        .{ "title", h.vstr("Direct Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "title", h.vstr("Is Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This property indicates if the Client account is active or disabled.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mid") },
                        .{ "title", h.vstr("Mid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Some Partners will have an merchant ids on their own software offerings.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Client's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "title", h.vstr("Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("client") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/clients") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("clients") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("billing_id") },
                                            .{ "orig", h.vstr("billing_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_email") },
                                            .{ "orig", h.vstr("contact_email") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_first_name") },
                                            .{ "orig", h.vstr("contact_first_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_is_active") },
                                            .{ "orig", h.vstr("contact_is_active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_last_name") },
                                            .{ "orig", h.vstr("contact_last_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_phone") },
                                            .{ "orig", h.vstr("contact_phone") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_send_welcome_email") },
                                            .{ "orig", h.vstr("contact_send_welcome_email") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_user_name") },
                                            .{ "orig", h.vstr("contact_user_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_user_role") },
                                            .{ "orig", h.vstr("contact_user_role") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("direct_partner_id") },
                                            .{ "orig", h.vstr("direct_partner_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("direct_partner_name") },
                                            .{ "orig", h.vstr("direct_partner_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("mid") },
                                            .{ "orig", h.vstr("mid") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
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
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/clients") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("clients") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("partner"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("clients") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("clients") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
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
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("Unique identifier of newly added element.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Name of Template") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("clone") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/templates/{id}/clone") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("templates") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("template_id") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("clone") },
                                    }),
                                }) },
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
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("template_id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("template_id"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("$.main.kit.entity.template"),
                        }),
                    }) },
                }) },
            }) },
            .{ "partner", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("billingId") },
                        .{ "title", h.vstr("Billing Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Partner's billing identifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contact") },
                        .{ "title", h.vstr("Contact") },
                        .{ "type", h.vstr("`$OBJECT`") },
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
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "title", h.vstr("Is Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This property indicates if the Parter account is active or disabled.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Partner's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("parent") },
                        .{ "title", h.vstr("Parent") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "title", h.vstr("Reference") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Partner's reference string.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("verificationPhrase") },
                        .{ "title", h.vstr("Verification Phrase") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The verification phrase is a message that the Partner creates.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("partner") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/partners") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("partners") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("billing_id") },
                                            .{ "orig", h.vstr("billing_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_email") },
                                            .{ "orig", h.vstr("contact_email") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_first_name") },
                                            .{ "orig", h.vstr("contact_first_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_is_active") },
                                            .{ "orig", h.vstr("contact_is_active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_last_name") },
                                            .{ "orig", h.vstr("contact_last_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_phone") },
                                            .{ "orig", h.vstr("contact_phone") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_send_welcome_email") },
                                            .{ "orig", h.vstr("contact_send_welcome_email") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_user_name") },
                                            .{ "orig", h.vstr("contact_user_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_user_role") },
                                            .{ "orig", h.vstr("contact_user_role") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("parent_id") },
                                            .{ "orig", h.vstr("parent_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("parent_name") },
                                            .{ "orig", h.vstr("parent_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("verification_phrase") },
                                            .{ "orig", h.vstr("verification_phrase") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                    }) },
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
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/partners") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("partners") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("partner"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/partners/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("partners") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
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
                        .{ "title", h.vstr("Access Mode") },
                        .{ "type", h.vstr("`$ANY`") },
                        .{ "short", h.vstr("The Template's access mode.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("active") },
                        .{ "title", h.vstr("Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This property indicates if the Template is active or inactive.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "title", h.vstr("Client") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("fieldTemplates") },
                        .{ "title", h.vstr("Field Templates") },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "short", h.vstr("Field Template list items") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("Unique identifier of newly added element.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Template's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("options") },
                        .{ "title", h.vstr("Options") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "title", h.vstr("Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "title", h.vstr("Reference") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Template's unique reference.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("type") },
                        .{ "title", h.vstr("Type") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Template's type.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("template") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/templates") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("templates") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("templates"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("access_mode") },
                                            .{ "orig", h.vstr("access_mode") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("active") },
                                            .{ "orig", h.vstr("active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("client_id") },
                                            .{ "orig", h.vstr("client_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("client_name") },
                                            .{ "orig", h.vstr("client_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("field_template") },
                                            .{ "orig", h.vstr("field_template") },
                                            .{ "type", h.vstr("`$ARRAY`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_custom_style") },
                                            .{ "orig", h.vstr("options_custom_style") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_custom_style_file") },
                                            .{ "orig", h.vstr("options_custom_style_file") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_domain") },
                                            .{ "orig", h.vstr("options_domain") },
                                            .{ "type", h.vstr("`$ARRAY`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_security_active_from") },
                                            .{ "orig", h.vstr("options_security_active_from") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_security_active_to") },
                                            .{ "orig", h.vstr("options_security_active_to") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_security_irreversible") },
                                            .{ "orig", h.vstr("options_security_irreversible") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner_id") },
                                            .{ "orig", h.vstr("partner_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner_name") },
                                            .{ "orig", h.vstr("partner_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("type") },
                                            .{ "orig", h.vstr("type") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("version") },
                                            .{ "orig", h.vstr("version") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                    }) },
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
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/templates") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("templates") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("templates"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("partner"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/templates/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("templates") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("templates"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/templates/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("templates") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("templates"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
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
                        .{ "title", h.vstr("Bfid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("BFID") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "title", h.vstr("Client") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("completeDate") },
                        .{ "title", h.vstr("Complete Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Timestamp from the beginning of the transaction.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("directPartner") },
                        .{ "title", h.vstr("Direct Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("errCode") },
                        .{ "title", h.vstr("Err Code") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The error code that is sent in response to a failed decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("errMessage") },
                        .{ "title", h.vstr("Err Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The error messge that is sent in response to a failed decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("ipAddress") },
                        .{ "title", h.vstr("Ip Address") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The IP address of the http client that makes the decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("messageId") },
                        .{ "title", h.vstr("Message Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Message ID.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "title", h.vstr("Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "title", h.vstr("Reference") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The reference property that the Client includes in the decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("success") },
                        .{ "title", h.vstr("Success") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("The success indicator.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("templateId") },
                        .{ "title", h.vstr("Template Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Template's unique identifier.") },
                        .{ "format", h.vstr("int32") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("transaction") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/transactions") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("transactions") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("date_from") },
                                            .{ "orig", h.vstr("date_from") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("date_to") },
                                            .{ "orig", h.vstr("date_to") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("message_id") },
                                            .{ "orig", h.vstr("message_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("paging_mode") },
                                            .{ "orig", h.vstr("paging_mode") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("success") },
                                            .{ "orig", h.vstr("success") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("transaction_type") },
                                            .{ "orig", h.vstr("transaction_type") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                    }) },
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
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/transactions/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("transactions") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("transaction_type") },
                                            .{ "orig", h.vstr("transaction_type") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                        h.vstr("transaction_type"),
                                    }) },
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
                        .{ "title", h.vstr("Billing Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Partner's billing identifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "title", h.vstr("Client") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contact") },
                        .{ "title", h.vstr("Contact") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("directPartner") },
                        .{ "title", h.vstr("Direct Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("email") },
                        .{ "title", h.vstr("Email") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The User's email address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("firstName") },
                        .{ "title", h.vstr("First Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The User's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("Unique identifier of newly added element.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "title", h.vstr("Is Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This property indicates if the User account is active or disabled.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("lastName") },
                        .{ "title", h.vstr("Last Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The User's Surname.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mid") },
                        .{ "title", h.vstr("Mid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Some Partners will have an merchant ids on their own software offerings.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Partner's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("parent") },
                        .{ "title", h.vstr("Parent") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "title", h.vstr("Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("phone") },
                        .{ "title", h.vstr("Phone") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The User's phone number without dashes, spaces, or brackets (e.g.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "title", h.vstr("Reference") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Partner's reference string.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sendWelcomeEmail") },
                        .{ "title", h.vstr("Send Welcome Email") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("If this property is set to 'true' the newly created user will be sent a welcome email.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userName") },
                        .{ "title", h.vstr("User Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The User's unique username.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userRole") },
                        .{ "title", h.vstr("User Role") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated User Role.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("verificationPhrase") },
                        .{ "title", h.vstr("Verification Phrase") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The verification phrase is a message that the Partner creates.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("update_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/users") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("users") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$OBJECT`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("email") },
                                            .{ "orig", h.vstr("email") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("first_name") },
                                            .{ "orig", h.vstr("first_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("last_name") },
                                            .{ "orig", h.vstr("last_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$OBJECT`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("phone") },
                                            .{ "orig", h.vstr("phone") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("send_welcome_email") },
                                            .{ "orig", h.vstr("send_welcome_email") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("user_role") },
                                            .{ "orig", h.vstr("user_role") },
                                            .{ "type", h.vstr("`$OBJECT`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("username") },
                                            .{ "orig", h.vstr("username") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
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
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/users") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("users") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("partner"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "update", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("update") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/templates/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("templates") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("templates"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("access_mode") },
                                            .{ "orig", h.vstr("access_mode") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("active") },
                                            .{ "orig", h.vstr("active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("client_id") },
                                            .{ "orig", h.vstr("client_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("client_name") },
                                            .{ "orig", h.vstr("client_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("field_template") },
                                            .{ "orig", h.vstr("field_template") },
                                            .{ "type", h.vstr("`$ARRAY`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_custom_style") },
                                            .{ "orig", h.vstr("options_custom_style") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_custom_style_file") },
                                            .{ "orig", h.vstr("options_custom_style_file") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_domain") },
                                            .{ "orig", h.vstr("options_domain") },
                                            .{ "type", h.vstr("`$ARRAY`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_security_active_from") },
                                            .{ "orig", h.vstr("options_security_active_from") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_security_active_to") },
                                            .{ "orig", h.vstr("options_security_active_to") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("options_security_irreversible") },
                                            .{ "orig", h.vstr("options_security_irreversible") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner_id") },
                                            .{ "orig", h.vstr("partner_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner_name") },
                                            .{ "orig", h.vstr("partner_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("type") },
                                            .{ "orig", h.vstr("type") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("version") },
                                            .{ "orig", h.vstr("version") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                    }) },
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
                            }),
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/partners/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("partners") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("billing_id") },
                                            .{ "orig", h.vstr("billing_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_id") },
                                            .{ "orig", h.vstr("contact_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("parent_id") },
                                            .{ "orig", h.vstr("parent_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("parent_name") },
                                            .{ "orig", h.vstr("parent_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("verification_phrase") },
                                            .{ "orig", h.vstr("verification_phrase") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("version") },
                                            .{ "orig", h.vstr("version") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                    }) },
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
                            }),
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/users/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("users") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$OBJECT`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("email") },
                                            .{ "orig", h.vstr("email") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("first_name") },
                                            .{ "orig", h.vstr("first_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("last_name") },
                                            .{ "orig", h.vstr("last_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$OBJECT`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("phone") },
                                            .{ "orig", h.vstr("phone") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("send_welcome_email") },
                                            .{ "orig", h.vstr("send_welcome_email") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("username") },
                                            .{ "orig", h.vstr("username") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                    }) },
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
                            }),
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("clients") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("billing_id") },
                                            .{ "orig", h.vstr("billing_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("contact_id") },
                                            .{ "orig", h.vstr("contact_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("direct_partner_id") },
                                            .{ "orig", h.vstr("direct_partner_id") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("direct_partner_name") },
                                            .{ "orig", h.vstr("direct_partner_name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("is_active") },
                                            .{ "orig", h.vstr("is_active") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("mid") },
                                            .{ "orig", h.vstr("mid") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("name") },
                                            .{ "orig", h.vstr("name") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("version") },
                                            .{ "orig", h.vstr("version") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                    }) },
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
                        .{ "title", h.vstr("Client") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("email") },
                        .{ "title", h.vstr("Email") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("firstName") },
                        .{ "title", h.vstr("First Name") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "title", h.vstr("Is Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("lastName") },
                        .{ "title", h.vstr("Last Name") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "title", h.vstr("Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("phone") },
                        .{ "title", h.vstr("Phone") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userName") },
                        .{ "title", h.vstr("User Name") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userRole") },
                        .{ "title", h.vstr("User Role") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated User Role.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("user") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/users/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("users") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
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
    if (std.mem.eql(u8, name, "cost")) return @import("../feature/cost.zig").CostFeature.make();
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
