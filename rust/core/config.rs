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
            ("version".to_string(), Value::str("0.0.1")),
            ("target".to_string(), Value::str("rust")),
        ])),
        ("feature".to_string(), Value::map_of([
            ("test".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
            ])),
        ])),
        ("options".to_string(), Value::map_of([
            ("base".to_string(), Value::str("https://portal-cert.shieldconex.com:4010/api/v1")),
            ("auth".to_string(), Value::map_of([
                ("prefix".to_string(), Value::str("Basic")),
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
                        ("short".to_string(), Value::str("Billing ID")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("contact")),
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
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("directPartner")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("short".to_string(), Value::str("This property indicates if the Client account is active or disabled.")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mid")),
                        ("short".to_string(), Value::str("Some Partners will have an merchant ids on their own software offerings.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("The Client's name.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("client")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("billing_id")),
                                            ("orig".to_string(), Value::str("billing_id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_email")),
                                            ("orig".to_string(), Value::str("contact_email")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_first_name")),
                                            ("orig".to_string(), Value::str("contact_first_name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_is_active")),
                                            ("orig".to_string(), Value::str("contact_is_active")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_last_name")),
                                            ("orig".to_string(), Value::str("contact_last_name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_phone")),
                                            ("orig".to_string(), Value::str("contact_phone")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_send_welcome_email")),
                                            ("orig".to_string(), Value::str("contact_send_welcome_email")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_user_name")),
                                            ("orig".to_string(), Value::str("contact_user_name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_user_role")),
                                            ("orig".to_string(), Value::str("contact_user_role")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("direct_partner_id")),
                                            ("orig".to_string(), Value::str("direct_partner_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("direct_partner_name")),
                                            ("orig".to_string(), Value::str("direct_partner_name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("mid")),
                                            ("orig".to_string(), Value::str("mid")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/clients")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/clients")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
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
                        ("short".to_string(), Value::str("Unique identifier of newly added element.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("short".to_string(), Value::str("Name of Template")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("clone")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("template_id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/templates/{id}/clone")),
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
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("template_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("template"),
                        ]),
                    ])),
                ])),
            ])),
            ("partner".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("billingId")),
                        ("short".to_string(), Value::str("The Partner's billing identifier.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("contact")),
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
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("short".to_string(), Value::str("This property indicates if the Parter account is active or disabled.")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("The Partner's name.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("parent")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reference")),
                        ("short".to_string(), Value::str("The Partner's reference string.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("verificationPhrase")),
                        ("short".to_string(), Value::str("The verification phrase is a message that the Partner creates.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("partner")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("billing_id")),
                                            ("orig".to_string(), Value::str("billing_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_email")),
                                            ("orig".to_string(), Value::str("contact_email")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_first_name")),
                                            ("orig".to_string(), Value::str("contact_first_name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_is_active")),
                                            ("orig".to_string(), Value::str("contact_is_active")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_last_name")),
                                            ("orig".to_string(), Value::str("contact_last_name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_phone")),
                                            ("orig".to_string(), Value::str("contact_phone")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_send_welcome_email")),
                                            ("orig".to_string(), Value::str("contact_send_welcome_email")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_user_name")),
                                            ("orig".to_string(), Value::str("contact_user_name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_user_role")),
                                            ("orig".to_string(), Value::str("contact_user_role")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("parent_id")),
                                            ("orig".to_string(), Value::str("parent_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("parent_name")),
                                            ("orig".to_string(), Value::str("parent_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("verification_phrase")),
                                            ("orig".to_string(), Value::str("verification_phrase")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/partners")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/partners")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/partners/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
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
                        ("short".to_string(), Value::str("The Template's access mode.")),
                        ("type".to_string(), Value::str("`$ANY`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("active")),
                        ("short".to_string(), Value::str("This property indicates if the Template is active or inactive.")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("fieldTemplates")),
                        ("short".to_string(), Value::str("Field Template list items")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("union".to_string(), Value::map_of([
                            ("branches".to_string(), Value::Num(9f64)),
                            ("count".to_string(), Value::Num(1f64)),
                            ("depth".to_string(), Value::Num(1f64)),
                        ])),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("short".to_string(), Value::str("Unique identifier of newly added element.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("short".to_string(), Value::str("The Template's name.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("options")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reference")),
                        ("short".to_string(), Value::str("The Template's unique reference.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("type")),
                        ("short".to_string(), Value::str("The Template's type.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("template")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("access_mode")),
                                            ("orig".to_string(), Value::str("access_mode")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("active")),
                                            ("orig".to_string(), Value::str("active")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client_id")),
                                            ("orig".to_string(), Value::str("client_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client_name")),
                                            ("orig".to_string(), Value::str("client_name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("field_template")),
                                            ("orig".to_string(), Value::str("field_template")),
                                            ("type".to_string(), Value::str("`$ARRAY`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_custom_style")),
                                            ("orig".to_string(), Value::str("options_custom_style")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_custom_style_file")),
                                            ("orig".to_string(), Value::str("options_custom_style_file")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_domain")),
                                            ("orig".to_string(), Value::str("options_domain")),
                                            ("type".to_string(), Value::str("`$ARRAY`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_security_active_from")),
                                            ("orig".to_string(), Value::str("options_security_active_from")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_security_active_to")),
                                            ("orig".to_string(), Value::str("options_security_active_to")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_security_irreversible")),
                                            ("orig".to_string(), Value::str("options_security_irreversible")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner_id")),
                                            ("orig".to_string(), Value::str("partner_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner_name")),
                                            ("orig".to_string(), Value::str("partner_name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("type")),
                                            ("orig".to_string(), Value::str("type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("version")),
                                            ("orig".to_string(), Value::str("version")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/templates")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("templates"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/templates")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("templates"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/templates/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("templates"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/templates/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("templates"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
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
                        ("short".to_string(), Value::str("BFID")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("completeDate")),
                        ("short".to_string(), Value::str("Timestamp from the beginning of the transaction.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("directPartner")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("errCode")),
                        ("short".to_string(), Value::str("The error code that is sent in response to a failed decrypt API call.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("errMessage")),
                        ("short".to_string(), Value::str("The error messge that is sent in response to a failed decrypt API call.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("ipAddress")),
                        ("short".to_string(), Value::str("The IP address of the http client that makes the decrypt API call.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("messageId")),
                        ("short".to_string(), Value::str("Message ID.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reference")),
                        ("short".to_string(), Value::str("The reference property that the Client includes in the decrypt API call.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("success")),
                        ("short".to_string(), Value::str("The success indicator.")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("templateId")),
                        ("short".to_string(), Value::str("The Template's unique identifier.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("transaction")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("date_from")),
                                            ("orig".to_string(), Value::str("date_from")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("date_to")),
                                            ("orig".to_string(), Value::str("date_to")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("message_id")),
                                            ("orig".to_string(), Value::str("message_id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("paging_mode")),
                                            ("orig".to_string(), Value::str("paging_mode")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("success")),
                                            ("orig".to_string(), Value::str("success")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("transaction_type")),
                                            ("orig".to_string(), Value::str("transaction_type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/transactions")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("transaction_type")),
                                            ("orig".to_string(), Value::str("transaction_type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/transactions/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                        Value::str("transaction_type"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
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
                        ("short".to_string(), Value::str("The Partner's billing identifier.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("contact")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("directPartner")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("email")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("The User's email address.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("firstName")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("The User's name.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("short".to_string(), Value::str("Unique identifier of newly added element.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("short".to_string(), Value::str("This property indicates if the User account is active or disabled.")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("lastName")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("The User's Surname.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mid")),
                        ("short".to_string(), Value::str("Some Partners will have an merchant ids on their own software offerings.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("short".to_string(), Value::str("The Partner's name.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("parent")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("phone")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("The User's phone number without dashes, spaces, or brackets (e.g.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reference")),
                        ("short".to_string(), Value::str("The Partner's reference string.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("sendWelcomeEmail")),
                        ("short".to_string(), Value::str("If this property is set to 'true' the newly created user will be sent a welcome email.")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userName")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("The User's unique username.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userRole")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated User Role.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("verificationPhrase")),
                        ("short".to_string(), Value::str("The verification phrase is a message that the Partner creates.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("update_result")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$OBJECT`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("email")),
                                            ("orig".to_string(), Value::str("email")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("first_name")),
                                            ("orig".to_string(), Value::str("first_name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("last_name")),
                                            ("orig".to_string(), Value::str("last_name")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$OBJECT`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("phone")),
                                            ("orig".to_string(), Value::str("phone")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("send_welcome_email")),
                                            ("orig".to_string(), Value::str("send_welcome_email")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("user_role")),
                                            ("orig".to_string(), Value::str("user_role")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$OBJECT`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("username")),
                                            ("orig".to_string(), Value::str("username")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/users")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/users")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("update".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("update")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("access_mode")),
                                            ("orig".to_string(), Value::str("access_mode")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("active")),
                                            ("orig".to_string(), Value::str("active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client_id")),
                                            ("orig".to_string(), Value::str("client_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client_name")),
                                            ("orig".to_string(), Value::str("client_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("field_template")),
                                            ("orig".to_string(), Value::str("field_template")),
                                            ("type".to_string(), Value::str("`$ARRAY`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_custom_style")),
                                            ("orig".to_string(), Value::str("options_custom_style")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_custom_style_file")),
                                            ("orig".to_string(), Value::str("options_custom_style_file")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_domain")),
                                            ("orig".to_string(), Value::str("options_domain")),
                                            ("type".to_string(), Value::str("`$ARRAY`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_security_active_from")),
                                            ("orig".to_string(), Value::str("options_security_active_from")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_security_active_to")),
                                            ("orig".to_string(), Value::str("options_security_active_to")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("options_security_irreversible")),
                                            ("orig".to_string(), Value::str("options_security_irreversible")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner_id")),
                                            ("orig".to_string(), Value::str("partner_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner_name")),
                                            ("orig".to_string(), Value::str("partner_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("type")),
                                            ("orig".to_string(), Value::str("type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("version")),
                                            ("orig".to_string(), Value::str("version")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/templates/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("templates"),
                                    Value::str("{id}"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("billing_id")),
                                            ("orig".to_string(), Value::str("billing_id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_id")),
                                            ("orig".to_string(), Value::str("contact_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("parent_id")),
                                            ("orig".to_string(), Value::str("parent_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("parent_name")),
                                            ("orig".to_string(), Value::str("parent_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("verification_phrase")),
                                            ("orig".to_string(), Value::str("verification_phrase")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("version")),
                                            ("orig".to_string(), Value::str("version")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/partners/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                    Value::str("{id}"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$OBJECT`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("email")),
                                            ("orig".to_string(), Value::str("email")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("first_name")),
                                            ("orig".to_string(), Value::str("first_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("last_name")),
                                            ("orig".to_string(), Value::str("last_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$OBJECT`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("phone")),
                                            ("orig".to_string(), Value::str("phone")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("send_welcome_email")),
                                            ("orig".to_string(), Value::str("send_welcome_email")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("username")),
                                            ("orig".to_string(), Value::str("username")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/users/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                    Value::str("{id}"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("billing_id")),
                                            ("orig".to_string(), Value::str("billing_id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("contact_id")),
                                            ("orig".to_string(), Value::str("contact_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("direct_partner_id")),
                                            ("orig".to_string(), Value::str("direct_partner_id")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("direct_partner_name")),
                                            ("orig".to_string(), Value::str("direct_partner_name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("is_active")),
                                            ("orig".to_string(), Value::str("is_active")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("mid")),
                                            ("orig".to_string(), Value::str("mid")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("name")),
                                            ("orig".to_string(), Value::str("name")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("version")),
                                            ("orig".to_string(), Value::str("version")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
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
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("email")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("firstName")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("lastName")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("phone")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userName")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userRole")),
                        ("short".to_string(), Value::str("Reference to the associated User Role.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("user")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/users/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
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
        "test" => Rc::new(RefCell::new(crate::feature::test::TestFeature::new())),
        _ => Rc::new(RefCell::new(crate::feature::base::BaseFeature::new())),
    }
}
