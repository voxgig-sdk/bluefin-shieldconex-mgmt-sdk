(* Generated API configuration (mirrors go core/config.go).
 *
 * make_config () — the embedded API model as a voxgig struct value.
 * make_feature name — the N-feature-safe factory the client uses. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Sdk_features

let make_config () : value =
  (jo [
    ("main", (jo [
      ("name", (Str "BluefinShieldconexMgmt")) ]));
    ("feature", (jo [
      ("test", (jo [
        ("options", (jo [
          ("active", (Bool false)) ])) ])) ]));
    ("options", (jo [
      ("base", (Str "https://portal-cert.shieldconex.com:4010/api/v1"));
      ("headers", (jo [
        ("content-type", (Str "application/json")) ]));
      ("entity", (jo [
        ("client", (empty_map ()));
        ("clone", (empty_map ()));
        ("partner", (empty_map ()));
        ("template", (empty_map ()));
        ("transaction", (empty_map ()));
        ("update_result", (empty_map ()));
        ("user", (empty_map ())) ]));
      ("auth", (jo [
        ("prefix", (Str "Basic")) ])) ]));
    ("entity", (jo [
      ("client", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "billingId"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "contact"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ]));
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "mid"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "client"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_email"));
                      ("orig", (Str "contact_email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_first_name"));
                      ("orig", (Str "contact_first_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_is_active"));
                      ("orig", (Str "contact_is_active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_last_name"));
                      ("orig", (Str "contact_last_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_phone"));
                      ("orig", (Str "contact_phone"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_send_welcome_email"));
                      ("orig", (Str "contact_send_welcome_email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_user_name"));
                      ("orig", (Str "contact_user_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_user_role"));
                      ("orig", (Str "contact_user_role"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "direct_partner_id"));
                      ("orig", (Str "direct_partner_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "direct_partner_name"));
                      ("orig", (Str "direct_partner_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "mid"));
                      ("orig", (Str "mid"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/clients"));
                ("parts", (ja [
                  (Str "clients") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "billing_id");
                    (Str "contact_email");
                    (Str "contact_first_name");
                    (Str "contact_is_active");
                    (Str "contact_last_name");
                    (Str "contact_phone");
                    (Str "contact_send_welcome_email");
                    (Str "contact_user_name");
                    (Str "contact_user_role");
                    (Str "direct_partner_id");
                    (Str "direct_partner_name");
                    (Str "is_active");
                    (Str "mid");
                    (Str "name") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/clients"));
                ("parts", (ja [
                  (Str "clients") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/clients/{id}"));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/clients/{id}"));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("clone", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "clone"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "template_id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/templates/{id}/clone"));
                ("parts", (ja [
                  (Str "templates");
                  (Str "{template_id}");
                  (Str "clone") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("id", (Str "template_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "template_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "template") ]) ])) ])) ]));
      ("partner", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "billingId"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "contact"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ]));
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "parent"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "verificationPhrase"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "partner"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_email"));
                      ("orig", (Str "contact_email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_first_name"));
                      ("orig", (Str "contact_first_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_is_active"));
                      ("orig", (Str "contact_is_active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_last_name"));
                      ("orig", (Str "contact_last_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_phone"));
                      ("orig", (Str "contact_phone"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_send_welcome_email"));
                      ("orig", (Str "contact_send_welcome_email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_user_name"));
                      ("orig", (Str "contact_user_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_user_role"));
                      ("orig", (Str "contact_user_role"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "parent_id"));
                      ("orig", (Str "parent_id"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "parent_name"));
                      ("orig", (Str "parent_name"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "verification_phrase"));
                      ("orig", (Str "verification_phrase"));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/partners"));
                ("parts", (ja [
                  (Str "partners") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "billing_id");
                    (Str "contact_email");
                    (Str "contact_first_name");
                    (Str "contact_is_active");
                    (Str "contact_last_name");
                    (Str "contact_phone");
                    (Str "contact_send_welcome_email");
                    (Str "contact_user_name");
                    (Str "contact_user_role");
                    (Str "is_active");
                    (Str "name");
                    (Str "parent_id");
                    (Str "parent_name");
                    (Str "reference");
                    (Str "verification_phrase") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/partners"));
                ("parts", (ja [
                  (Str "partners") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/partners/{id}"));
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("template", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "accessMode"));
            ("type", (Str "`$ANY`")) ]);
          (jo [
            ("name", (Str "active"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "client"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "fieldTemplates"));
            ("type", (Str "`$ARRAY`"));
            ("union", (jo [
              ("branches", (Num (9.)));
              ("count", (Num (1.)));
              ("depth", (Num (1.))) ])) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "options"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "type"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "template"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "access_mode"));
                      ("orig", (Str "access_mode"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "active"));
                      ("orig", (Str "active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client_id"));
                      ("orig", (Str "client_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client_name"));
                      ("orig", (Str "client_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "field_template"));
                      ("orig", (Str "field_template"));
                      ("type", (Str "`$ARRAY`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_custom_style"));
                      ("orig", (Str "options_custom_style"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_custom_style_file"));
                      ("orig", (Str "options_custom_style_file"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_domain"));
                      ("orig", (Str "options_domain"));
                      ("type", (Str "`$ARRAY`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_active_from"));
                      ("orig", (Str "options_security_active_from"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_active_to"));
                      ("orig", (Str "options_security_active_to"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_irreversible"));
                      ("orig", (Str "options_security_irreversible"));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner_id"));
                      ("orig", (Str "partner_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner_name"));
                      ("orig", (Str "partner_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "type"));
                      ("orig", (Str "type"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/templates"));
                ("parts", (ja [
                  (Str "templates") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "access_mode");
                    (Str "active");
                    (Str "client_id");
                    (Str "client_name");
                    (Str "field_template");
                    (Str "name");
                    (Str "options_custom_style");
                    (Str "options_custom_style_file");
                    (Str "options_domain");
                    (Str "options_security_active_from");
                    (Str "options_security_active_to");
                    (Str "options_security_irreversible");
                    (Str "partner_id");
                    (Str "partner_name");
                    (Str "reference");
                    (Str "type");
                    (Str "version") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/templates"));
                ("parts", (ja [
                  (Str "templates") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/templates/{id}"));
                ("parts", (ja [
                  (Str "templates");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/templates/{id}"));
                ("parts", (ja [
                  (Str "templates");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("transaction", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "bfid"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "completeDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "errCode"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "errMessage"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "ipAddress"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "messageId"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "success"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "templateId"));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "transaction"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "date_from"));
                      ("orig", (Str "date_from"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "date_to"));
                      ("orig", (Str "date_to"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "message_id"));
                      ("orig", (Str "message_id"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "paging_mode"));
                      ("orig", (Str "paging_mode"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "success"));
                      ("orig", (Str "success"));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "transaction_type"));
                      ("orig", (Str "transaction_type"));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/transactions"));
                ("parts", (ja [
                  (Str "transactions") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "date_from");
                    (Str "date_to");
                    (Str "message_id");
                    (Str "paging_mode");
                    (Str "partner");
                    (Str "reference");
                    (Str "skip");
                    (Str "success");
                    (Str "take");
                    (Str "transaction_type") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "transaction_type"));
                      ("orig", (Str "transaction_type"));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/transactions/{id}"));
                ("parts", (ja [
                  (Str "transactions");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id");
                    (Str "transaction_type") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("update_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "billingId"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "contact"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "email"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mid"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "parent"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "phone"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "sendWelcomeEmail"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "userName"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$OBJECT`")) ]));
              ("update", (jo [
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "verificationPhrase"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "update_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$OBJECT`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "email"));
                      ("orig", (Str "email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "first_name"));
                      ("orig", (Str "first_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "last_name"));
                      ("orig", (Str "last_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$OBJECT`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "phone"));
                      ("orig", (Str "phone"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "send_welcome_email"));
                      ("orig", (Str "send_welcome_email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "user_role"));
                      ("orig", (Str "user_role"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$OBJECT`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "username"));
                      ("orig", (Str "username"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/users"));
                ("parts", (ja [
                  (Str "users") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "email");
                    (Str "first_name");
                    (Str "is_active");
                    (Str "last_name");
                    (Str "partner");
                    (Str "phone");
                    (Str "send_welcome_email");
                    (Str "user_role");
                    (Str "username") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/users"));
                ("parts", (ja [
                  (Str "users") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "access_mode"));
                      ("orig", (Str "access_mode"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "active"));
                      ("orig", (Str "active"));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client_id"));
                      ("orig", (Str "client_id"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client_name"));
                      ("orig", (Str "client_name"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "field_template"));
                      ("orig", (Str "field_template"));
                      ("type", (Str "`$ARRAY`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_custom_style"));
                      ("orig", (Str "options_custom_style"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_custom_style_file"));
                      ("orig", (Str "options_custom_style_file"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_domain"));
                      ("orig", (Str "options_domain"));
                      ("type", (Str "`$ARRAY`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_active_from"));
                      ("orig", (Str "options_security_active_from"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_active_to"));
                      ("orig", (Str "options_security_active_to"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_irreversible"));
                      ("orig", (Str "options_security_irreversible"));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner_id"));
                      ("orig", (Str "partner_id"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner_name"));
                      ("orig", (Str "partner_name"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "type"));
                      ("orig", (Str "type"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/templates/{id}"));
                ("parts", (ja [
                  (Str "templates");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "access_mode");
                    (Str "active");
                    (Str "client_id");
                    (Str "client_name");
                    (Str "field_template");
                    (Str "id");
                    (Str "name");
                    (Str "options_custom_style");
                    (Str "options_custom_style_file");
                    (Str "options_domain");
                    (Str "options_security_active_from");
                    (Str "options_security_active_to");
                    (Str "options_security_irreversible");
                    (Str "partner_id");
                    (Str "partner_name");
                    (Str "reference");
                    (Str "type");
                    (Str "version") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_id"));
                      ("orig", (Str "contact_id"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "parent_id"));
                      ("orig", (Str "parent_id"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "parent_name"));
                      ("orig", (Str "parent_name"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "verification_phrase"));
                      ("orig", (Str "verification_phrase"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/partners/{id}"));
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "billing_id");
                    (Str "contact_id");
                    (Str "id");
                    (Str "is_active");
                    (Str "name");
                    (Str "parent_id");
                    (Str "parent_name");
                    (Str "reference");
                    (Str "verification_phrase");
                    (Str "version") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$OBJECT`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "email"));
                      ("orig", (Str "email"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "first_name"));
                      ("orig", (Str "first_name"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "last_name"));
                      ("orig", (Str "last_name"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$OBJECT`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "phone"));
                      ("orig", (Str "phone"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "send_welcome_email"));
                      ("orig", (Str "send_welcome_email"));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "username"));
                      ("orig", (Str "username"));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/users/{id}"));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "email");
                    (Str "first_name");
                    (Str "id");
                    (Str "is_active");
                    (Str "last_name");
                    (Str "partner");
                    (Str "phone");
                    (Str "send_welcome_email");
                    (Str "username") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "contact_id"));
                      ("orig", (Str "contact_id"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "direct_partner_id"));
                      ("orig", (Str "direct_partner_id"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "direct_partner_name"));
                      ("orig", (Str "direct_partner_name"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "mid"));
                      ("orig", (Str "mid"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/clients/{id}"));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "billing_id");
                    (Str "contact_id");
                    (Str "direct_partner_id");
                    (Str "direct_partner_name");
                    (Str "id");
                    (Str "is_active");
                    (Str "mid");
                    (Str "name");
                    (Str "version") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("user", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "client"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "email"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "phone"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "user"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/users/{id}"));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

let make_feature (name : string) : feature =
  match name with
  | "test" -> test_feature ()
  | _ -> base_feature ()
