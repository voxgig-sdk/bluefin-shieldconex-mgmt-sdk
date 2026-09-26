// Generated API configuration (mirrors go core/config.go).

use std::cell::RefCell;
use std::rc::Rc;

use crate::core::types::FeatureRef;
use crate::utility::voxgigstruct::Value;

pub fn make_config() -> Value {
    Value::map_of([
        ("main".to_string(), Value::map_of([
            ("name".to_string(), Value::str("BluefinShieldconexMgmt")),
            ("slug".to_string(), Value::str("bluefin-shieldconex-mgmt")),
            ("version".to_string(), Value::str("0.1.1")),
            ("target".to_string(), Value::str("rust")),
        ])),
        ("feature".to_string(), Value::map_of([
            ("audit".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("actor".to_string(), Value::str("anonymous")),
                    ("max".to_string(), Value::Num(1000f64)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                    ("sink".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("clienttrack".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("clientVersion".to_string(), Value::str("0.0.1")),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("clientName".to_string(), Value::str("`$STRING`")),
                    ("clientVersion".to_string(), Value::str("`$STRING`")),
                    ("headers".to_string(), Value::str("`$MAP`")),
                    ("idgen".to_string(), Value::str("`$FUNCTION`")),
                    ("sessionId".to_string(), Value::str("`$STRING`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("debug".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("max".to_string(), Value::Num(100f64)),
                    ("redact".to_string(), Value::list(vec![
                        Value::str("authorization"),
                        Value::str("cookie"),
                        Value::str("set-cookie"),
                        Value::str("api-key"),
                        Value::str("apikey"),
                        Value::str("x-api-key"),
                        Value::str("idempotency-key"),
                    ])),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                    ("onEntry".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("idempotency".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("header".to_string(), Value::str("Idempotency-Key")),
                    ("methods".to_string(), Value::list(vec![
                        Value::str("POST"),
                        Value::str("PUT"),
                        Value::str("PATCH"),
                        Value::str("DELETE"),
                    ])),
                    ("ops".to_string(), Value::list(vec![
                        Value::str("create"),
                        Value::str("update"),
                        Value::str("remove"),
                    ])),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("keygen".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("log".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(true)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("level".to_string(), Value::str("`$STRING`")),
                    ("logger".to_string(), Value::str("`$ANY`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("metrics".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("paging".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("afterVar".to_string(), Value::str("after")),
                    ("cursorParam".to_string(), Value::str("cursor")),
                    ("firstVar".to_string(), Value::str("first")),
                    ("limitParam".to_string(), Value::str("limit")),
                    ("pageParam".to_string(), Value::str("page")),
                    ("startPage".to_string(), Value::Num(1f64)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("limit".to_string(), Value::str("`$NUMBER`")),
                    ("ops".to_string(), Value::str("`$LIST`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("ratelimit".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("burst".to_string(), Value::Num(5f64)),
                    ("rate".to_string(), Value::Num(5f64)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                    ("sleep".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("wrap")),
            ])),
            ("retry".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("factor".to_string(), Value::Num(2f64)),
                    ("maxDelay".to_string(), Value::Num(2000f64)),
                    ("minDelay".to_string(), Value::Num(50f64)),
                    ("retries".to_string(), Value::Num(2f64)),
                    ("statuses".to_string(), Value::list(vec![
                        Value::Num(408f64),
                        Value::Num(425f64),
                        Value::Num(429f64),
                        Value::Num(500f64),
                        Value::Num(502f64),
                        Value::Num(503f64),
                        Value::Num(504f64),
                    ])),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("jitter".to_string(), Value::str("`$BOOLEAN`")),
                    ("sleep".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("wrap")),
            ])),
            ("telemetry".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("exporter".to_string(), Value::str("`$FUNCTION`")),
                    ("headers".to_string(), Value::str("`$MAP`")),
                    ("idgen".to_string(), Value::str("`$FUNCTION`")),
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("test".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("entity".to_string(), Value::str("`$MAP`")),
                    ("net".to_string(), Value::str("`$MAP`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("base")),
            ])),
            ("timeout".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("ms".to_string(), Value::Num(30000f64)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("clearTimer".to_string(), Value::str("`$FUNCTION`")),
                    ("setTimer".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("wrap")),
            ])),
        ])),
        ("options".to_string(), Value::map_of([
            ("base".to_string(), Value::str("https://portal-cert.shieldconex.com:4010/api/v1")),
            ("auth".to_string(), Value::map_of([
                ("prefix".to_string(), Value::str("Basic")),
                ("basic".to_string(), Value::Bool(true)),
            ])),
            ("headers".to_string(), Value::map_of([
                ("content-type".to_string(), Value::str("application/json")),
            ])),
            ("entity".to_string(), Value::map_of([
                ("client".to_string(), Value::empty_map()),
                ("clone".to_string(), Value::empty_map()),
                ("partner".to_string(), Value::empty_map()),
                ("template".to_string(), Value::empty_map()),
                ("transaction".to_string(), Value::empty_map()),
                ("update_result".to_string(), Value::empty_map()),
                ("user".to_string(), Value::empty_map()),
            ])),
        ])),
        ("entity".to_string(), Value::map_of([
            ("client".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("billingId")),
                        ("title".to_string(), Value::str("Billing Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Billing ID")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("contact")),
                        ("title".to_string(), Value::str("Contact")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                            ("list".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("directPartner")),
                        ("title".to_string(), Value::str("Direct Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("title".to_string(), Value::str("Is Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This property indicates if the Client account is active or disabled.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mid")),
                        ("title".to_string(), Value::str("Mid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Some Partners will have an merchant ids on their own software offerings.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("The Client's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("title".to_string(), Value::str("Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("client")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/clients")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("clients")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("billing_id")),
                                            ("orig".to_string(), Value::str("billing_id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_email")),
                                            ("orig".to_string(), Value::str("contact_email")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_first_name")),
                                            ("orig".to_string(), Value::str("contact_first_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_is_active")),
                                            ("orig".to_string(), Value::str("contact_is_active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_last_name")),
                                            ("orig".to_string(), Value::str("contact_last_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_phone")),
                                            ("orig".to_string(), Value::str("contact_phone")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_send_welcome_email")),
                                            ("orig".to_string(), Value::str("contact_send_welcome_email")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_user_name")),
                                            ("orig".to_string(), Value::str("contact_user_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_user_role")),
                                            ("orig".to_string(), Value::str("contact_user_role")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("direct_partner_id")),
                                            ("orig".to_string(), Value::str("direct_partner_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("direct_partner_name")),
                                            ("orig".to_string(), Value::str("direct_partner_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("mid")),
                                            ("orig".to_string(), Value::str("mid")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("billing_id"),
                                        Value::str("contact_email"),
                                        Value::str("contact_first_name"),
                                        Value::str("contact_is_active"),
                                        Value::str("contact_last_name"),
                                        Value::str("contact_phone"),
                                        Value::str("contact_send_welcome_email"),
                                        Value::str("contact_user_name"),
                                        Value::str("contact_user_role"),
                                        Value::str("direct_partner_id"),
                                        Value::str("direct_partner_name"),
                                        Value::str("is_active"),
                                        Value::str("mid"),
                                        Value::str("name"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/clients")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("clients")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("clients")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("clients")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("clone".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("Unique identifier of newly added element.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Name of Template")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("clone")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/templates/{id}/clone")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("templates")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("template_id")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("clone")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("templates"),
                                    Value::str("{template_id}"),
                                    Value::str("clone"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("id".to_string(), Value::str("template_id")),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("template_id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("template_id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("$.main.kit.entity.template"),
                        ]),
                    ])),
                ])),
            ])),
            ("partner".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("billingId")),
                        ("title".to_string(), Value::str("Billing Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Partner's billing identifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("contact")),
                        ("title".to_string(), Value::str("Contact")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                            ("list".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("title".to_string(), Value::str("Is Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This property indicates if the Parter account is active or disabled.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("The Partner's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("parent")),
                        ("title".to_string(), Value::str("Parent")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reference")),
                        ("title".to_string(), Value::str("Reference")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Partner's reference string.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("verificationPhrase")),
                        ("title".to_string(), Value::str("Verification Phrase")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The verification phrase is a message that the Partner creates.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("partner")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/partners")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("partners")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("billing_id")),
                                            ("orig".to_string(), Value::str("billing_id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_email")),
                                            ("orig".to_string(), Value::str("contact_email")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_first_name")),
                                            ("orig".to_string(), Value::str("contact_first_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_is_active")),
                                            ("orig".to_string(), Value::str("contact_is_active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_last_name")),
                                            ("orig".to_string(), Value::str("contact_last_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_phone")),
                                            ("orig".to_string(), Value::str("contact_phone")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_send_welcome_email")),
                                            ("orig".to_string(), Value::str("contact_send_welcome_email")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_user_name")),
                                            ("orig".to_string(), Value::str("contact_user_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_user_role")),
                                            ("orig".to_string(), Value::str("contact_user_role")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("parent_id")),
                                            ("orig".to_string(), Value::str("parent_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("parent_name")),
                                            ("orig".to_string(), Value::str("parent_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("verification_phrase")),
                                            ("orig".to_string(), Value::str("verification_phrase")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("billing_id"),
                                        Value::str("contact_email"),
                                        Value::str("contact_first_name"),
                                        Value::str("contact_is_active"),
                                        Value::str("contact_last_name"),
                                        Value::str("contact_phone"),
                                        Value::str("contact_send_welcome_email"),
                                        Value::str("contact_user_name"),
                                        Value::str("contact_user_role"),
                                        Value::str("is_active"),
                                        Value::str("name"),
                                        Value::str("parent_id"),
                                        Value::str("parent_name"),
                                        Value::str("reference"),
                                        Value::str("verification_phrase"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/partners")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("partners")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/partners/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("partners")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("template".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("accessMode")),
                        ("title".to_string(), Value::str("Access Mode")),
                        ("type".to_string(), Value::str("`$ANY`")),
                        ("short".to_string(), Value::str("The Template's access mode.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("active")),
                        ("title".to_string(), Value::str("Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This property indicates if the Template is active or inactive.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("title".to_string(), Value::str("Client")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("fieldTemplates")),
                        ("title".to_string(), Value::str("Field Templates")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("short".to_string(), Value::str("Field Template list items")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("Unique identifier of newly added element.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Template's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("options")),
                        ("title".to_string(), Value::str("Options")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("title".to_string(), Value::str("Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reference")),
                        ("title".to_string(), Value::str("Reference")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Template's unique reference.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("type")),
                        ("title".to_string(), Value::str("Type")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Template's type.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("template")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/templates")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("templates")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("templates"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("access_mode")),
                                            ("orig".to_string(), Value::str("access_mode")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("active")),
                                            ("orig".to_string(), Value::str("active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client_id")),
                                            ("orig".to_string(), Value::str("client_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client_name")),
                                            ("orig".to_string(), Value::str("client_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("field_template")),
                                            ("orig".to_string(), Value::str("field_template")),
                                            ("type".to_string(), Value::str("`$ARRAY`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_custom_style")),
                                            ("orig".to_string(), Value::str("options_custom_style")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_custom_style_file")),
                                            ("orig".to_string(), Value::str("options_custom_style_file")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_domain")),
                                            ("orig".to_string(), Value::str("options_domain")),
                                            ("type".to_string(), Value::str("`$ARRAY`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_security_active_from")),
                                            ("orig".to_string(), Value::str("options_security_active_from")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_security_active_to")),
                                            ("orig".to_string(), Value::str("options_security_active_to")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_security_irreversible")),
                                            ("orig".to_string(), Value::str("options_security_irreversible")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner_id")),
                                            ("orig".to_string(), Value::str("partner_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner_name")),
                                            ("orig".to_string(), Value::str("partner_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("type")),
                                            ("orig".to_string(), Value::str("type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("version")),
                                            ("orig".to_string(), Value::str("version")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("access_mode"),
                                        Value::str("active"),
                                        Value::str("client_id"),
                                        Value::str("client_name"),
                                        Value::str("field_template"),
                                        Value::str("name"),
                                        Value::str("options_custom_style"),
                                        Value::str("options_custom_style_file"),
                                        Value::str("options_domain"),
                                        Value::str("options_security_active_from"),
                                        Value::str("options_security_active_to"),
                                        Value::str("options_security_irreversible"),
                                        Value::str("partner_id"),
                                        Value::str("partner_name"),
                                        Value::str("reference"),
                                        Value::str("type"),
                                        Value::str("version"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/templates")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("templates")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("templates"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/templates/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("templates")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("templates"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/templates/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("templates")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("templates"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("transaction".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("bfid")),
                        ("title".to_string(), Value::str("Bfid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("BFID")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("title".to_string(), Value::str("Client")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("completeDate")),
                        ("title".to_string(), Value::str("Complete Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Timestamp from the beginning of the transaction.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("directPartner")),
                        ("title".to_string(), Value::str("Direct Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("errCode")),
                        ("title".to_string(), Value::str("Err Code")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The error code that is sent in response to a failed decrypt API call.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("errMessage")),
                        ("title".to_string(), Value::str("Err Message")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The error messge that is sent in response to a failed decrypt API call.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("ipAddress")),
                        ("title".to_string(), Value::str("Ip Address")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The IP address of the http client that makes the decrypt API call.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("messageId")),
                        ("title".to_string(), Value::str("Message Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Message ID.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("title".to_string(), Value::str("Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reference")),
                        ("title".to_string(), Value::str("Reference")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The reference property that the Client includes in the decrypt API call.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("success")),
                        ("title".to_string(), Value::str("Success")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("The success indicator.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("templateId")),
                        ("title".to_string(), Value::str("Template Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Template's unique identifier.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("transaction")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/transactions")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("transactions")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("date_from")),
                                            ("orig".to_string(), Value::str("date_from")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("date_to")),
                                            ("orig".to_string(), Value::str("date_to")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("message_id")),
                                            ("orig".to_string(), Value::str("message_id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("paging_mode")),
                                            ("orig".to_string(), Value::str("paging_mode")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("success")),
                                            ("orig".to_string(), Value::str("success")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("transaction_type")),
                                            ("orig".to_string(), Value::str("transaction_type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("date_from"),
                                        Value::str("date_to"),
                                        Value::str("message_id"),
                                        Value::str("paging_mode"),
                                        Value::str("partner"),
                                        Value::str("reference"),
                                        Value::str("skip"),
                                        Value::str("success"),
                                        Value::str("take"),
                                        Value::str("transaction_type"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/transactions/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("transactions")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("transaction_type")),
                                            ("orig".to_string(), Value::str("transaction_type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                        Value::str("transaction_type"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("update_result".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("billingId")),
                        ("title".to_string(), Value::str("Billing Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Partner's billing identifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("title".to_string(), Value::str("Client")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("contact")),
                        ("title".to_string(), Value::str("Contact")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("directPartner")),
                        ("title".to_string(), Value::str("Direct Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("email")),
                        ("title".to_string(), Value::str("Email")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("The User's email address.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("firstName")),
                        ("title".to_string(), Value::str("First Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("The User's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("Unique identifier of newly added element.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("title".to_string(), Value::str("Is Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This property indicates if the User account is active or disabled.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("lastName")),
                        ("title".to_string(), Value::str("Last Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("The User's Surname.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mid")),
                        ("title".to_string(), Value::str("Mid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Some Partners will have an merchant ids on their own software offerings.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Partner's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("parent")),
                        ("title".to_string(), Value::str("Parent")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("title".to_string(), Value::str("Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("phone")),
                        ("title".to_string(), Value::str("Phone")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("The User's phone number without dashes, spaces, or brackets (e.g.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reference")),
                        ("title".to_string(), Value::str("Reference")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Partner's reference string.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("sendWelcomeEmail")),
                        ("title".to_string(), Value::str("Send Welcome Email")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("If this property is set to 'true' the newly created user will be sent a welcome email.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userName")),
                        ("title".to_string(), Value::str("User Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("The User's unique username.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userRole")),
                        ("title".to_string(), Value::str("User Role")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("Reference to the associated User Role.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("verificationPhrase")),
                        ("title".to_string(), Value::str("Verification Phrase")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The verification phrase is a message that the Partner creates.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("update_result")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/users")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("users")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$OBJECT`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("email")),
                                            ("orig".to_string(), Value::str("email")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("first_name")),
                                            ("orig".to_string(), Value::str("first_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("last_name")),
                                            ("orig".to_string(), Value::str("last_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$OBJECT`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("phone")),
                                            ("orig".to_string(), Value::str("phone")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("send_welcome_email")),
                                            ("orig".to_string(), Value::str("send_welcome_email")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("user_role")),
                                            ("orig".to_string(), Value::str("user_role")),
                                            ("type".to_string(), Value::str("`$OBJECT`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("username")),
                                            ("orig".to_string(), Value::str("username")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("email"),
                                        Value::str("first_name"),
                                        Value::str("is_active"),
                                        Value::str("last_name"),
                                        Value::str("partner"),
                                        Value::str("phone"),
                                        Value::str("send_welcome_email"),
                                        Value::str("user_role"),
                                        Value::str("username"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/users")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("users")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("update".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("update")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/templates/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("templates")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("templates"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("access_mode")),
                                            ("orig".to_string(), Value::str("access_mode")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("active")),
                                            ("orig".to_string(), Value::str("active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client_id")),
                                            ("orig".to_string(), Value::str("client_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client_name")),
                                            ("orig".to_string(), Value::str("client_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("field_template")),
                                            ("orig".to_string(), Value::str("field_template")),
                                            ("type".to_string(), Value::str("`$ARRAY`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_custom_style")),
                                            ("orig".to_string(), Value::str("options_custom_style")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_custom_style_file")),
                                            ("orig".to_string(), Value::str("options_custom_style_file")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_domain")),
                                            ("orig".to_string(), Value::str("options_domain")),
                                            ("type".to_string(), Value::str("`$ARRAY`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_security_active_from")),
                                            ("orig".to_string(), Value::str("options_security_active_from")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_security_active_to")),
                                            ("orig".to_string(), Value::str("options_security_active_to")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("options_security_irreversible")),
                                            ("orig".to_string(), Value::str("options_security_irreversible")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner_id")),
                                            ("orig".to_string(), Value::str("partner_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner_name")),
                                            ("orig".to_string(), Value::str("partner_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("type")),
                                            ("orig".to_string(), Value::str("type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("version")),
                                            ("orig".to_string(), Value::str("version")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("access_mode"),
                                        Value::str("active"),
                                        Value::str("client_id"),
                                        Value::str("client_name"),
                                        Value::str("field_template"),
                                        Value::str("id"),
                                        Value::str("name"),
                                        Value::str("options_custom_style"),
                                        Value::str("options_custom_style_file"),
                                        Value::str("options_domain"),
                                        Value::str("options_security_active_from"),
                                        Value::str("options_security_active_to"),
                                        Value::str("options_security_irreversible"),
                                        Value::str("partner_id"),
                                        Value::str("partner_name"),
                                        Value::str("reference"),
                                        Value::str("type"),
                                        Value::str("version"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/partners/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("partners")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("billing_id")),
                                            ("orig".to_string(), Value::str("billing_id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_id")),
                                            ("orig".to_string(), Value::str("contact_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("parent_id")),
                                            ("orig".to_string(), Value::str("parent_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("parent_name")),
                                            ("orig".to_string(), Value::str("parent_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("verification_phrase")),
                                            ("orig".to_string(), Value::str("verification_phrase")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("version")),
                                            ("orig".to_string(), Value::str("version")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("billing_id"),
                                        Value::str("contact_id"),
                                        Value::str("id"),
                                        Value::str("is_active"),
                                        Value::str("name"),
                                        Value::str("parent_id"),
                                        Value::str("parent_name"),
                                        Value::str("reference"),
                                        Value::str("verification_phrase"),
                                        Value::str("version"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/users/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("users")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$OBJECT`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("email")),
                                            ("orig".to_string(), Value::str("email")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("first_name")),
                                            ("orig".to_string(), Value::str("first_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("last_name")),
                                            ("orig".to_string(), Value::str("last_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$OBJECT`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("phone")),
                                            ("orig".to_string(), Value::str("phone")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("send_welcome_email")),
                                            ("orig".to_string(), Value::str("send_welcome_email")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("username")),
                                            ("orig".to_string(), Value::str("username")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("email"),
                                        Value::str("first_name"),
                                        Value::str("id"),
                                        Value::str("is_active"),
                                        Value::str("last_name"),
                                        Value::str("partner"),
                                        Value::str("phone"),
                                        Value::str("send_welcome_email"),
                                        Value::str("username"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("clients")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("billing_id")),
                                            ("orig".to_string(), Value::str("billing_id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("contact_id")),
                                            ("orig".to_string(), Value::str("contact_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("direct_partner_id")),
                                            ("orig".to_string(), Value::str("direct_partner_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("direct_partner_name")),
                                            ("orig".to_string(), Value::str("direct_partner_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("mid")),
                                            ("orig".to_string(), Value::str("mid")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("version")),
                                            ("orig".to_string(), Value::str("version")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("billing_id"),
                                        Value::str("contact_id"),
                                        Value::str("direct_partner_id"),
                                        Value::str("direct_partner_name"),
                                        Value::str("id"),
                                        Value::str("is_active"),
                                        Value::str("mid"),
                                        Value::str("name"),
                                        Value::str("version"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("user".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("title".to_string(), Value::str("Client")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("email")),
                        ("title".to_string(), Value::str("Email")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("firstName")),
                        ("title".to_string(), Value::str("First Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("title".to_string(), Value::str("Is Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("lastName")),
                        ("title".to_string(), Value::str("Last Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("title".to_string(), Value::str("Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("phone")),
                        ("title".to_string(), Value::str("Phone")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userName")),
                        ("title".to_string(), Value::str("User Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userRole")),
                        ("title".to_string(), Value::str("User Role")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated User Role.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("user")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/users/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("users")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
        ])),
    ])
}

// SHARED CONFIG (sdkgen rung L2).
//
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client. Above the
// size threshold make_config re-parses the whole embedded JSON, so this is the
// difference between parsing the model once and once per client.
//
// THREAD-LOCAL, not a global: Value is Rc/RefCell-backed and so is neither
// Send nor Sync. One config per thread is the widest scope that is sound here,
// and the clone is an Rc bump, not a deep copy.
thread_local! {
    static SHARED_CONFIG: Value = make_config();
}

/// The per-thread config, built once on first use.
///
/// The returned Value SHARES its nodes: treat it as read-only. Callers that
/// need to mutate should use make_config, which always returns a fresh copy.
pub fn shared_config() -> Value {
    SHARED_CONFIG.with(|c| c.clone())
}

pub fn make_feature(name: &str) -> FeatureRef {
    match name {
        "audit" => Rc::new(RefCell::new(crate::feature::audit::AuditFeature::new())),
        "clienttrack" => Rc::new(RefCell::new(crate::feature::clienttrack::ClienttrackFeature::new())),
        "debug" => Rc::new(RefCell::new(crate::feature::debug::DebugFeature::new())),
        "idempotency" => Rc::new(RefCell::new(crate::feature::idempotency::IdempotencyFeature::new())),
        "log" => Rc::new(RefCell::new(crate::feature::log::LogFeature::new())),
        "metrics" => Rc::new(RefCell::new(crate::feature::metrics::MetricsFeature::new())),
        "paging" => Rc::new(RefCell::new(crate::feature::paging::PagingFeature::new())),
        "ratelimit" => Rc::new(RefCell::new(crate::feature::ratelimit::RatelimitFeature::new())),
        "retry" => Rc::new(RefCell::new(crate::feature::retry::RetryFeature::new())),
        "telemetry" => Rc::new(RefCell::new(crate::feature::telemetry::TelemetryFeature::new())),
        "test" => Rc::new(RefCell::new(crate::feature::test::TestFeature::new())),
        "timeout" => Rc::new(RefCell::new(crate::feature::timeout::TimeoutFeature::new())),
        _ => Rc::new(RefCell::new(crate::feature::base::BaseFeature::new())),
    }
}
