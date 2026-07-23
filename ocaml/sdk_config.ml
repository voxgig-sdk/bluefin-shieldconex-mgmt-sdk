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
            ("active", (Bool true));
            ("name", (Str "billing_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "contact"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ]));
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "direct_partner"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "mid"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (10.))) ]) ]));
        ("name", (Str "client"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_email"));
                      ("orig", (Str "contact_email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_first_name"));
                      ("orig", (Str "contact_first_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_is_active"));
                      ("orig", (Str "contact_is_active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_last_name"));
                      ("orig", (Str "contact_last_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_phone"));
                      ("orig", (Str "contact_phone"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_send_welcome_email"));
                      ("orig", (Str "contact_send_welcome_email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_user_name"));
                      ("orig", (Str "contact_user_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_user_role"));
                      ("orig", (Str "contact_user_role"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "direct_partner_id"));
                      ("orig", (Str "direct_partner_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "direct_partner_name"));
                      ("orig", (Str "direct_partner_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "mid"));
                      ("orig", (Str "mid"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "remove")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("clone", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]) ]));
        ("name", (Str "clone"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "template_id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "template") ]) ])) ])) ]));
      ("partner", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "billing_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "contact"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ]));
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "parent"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "reference"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "verification_phrase"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (10.))) ]) ]));
        ("name", (Str "partner"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_email"));
                      ("orig", (Str "contact_email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_first_name"));
                      ("orig", (Str "contact_first_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_is_active"));
                      ("orig", (Str "contact_is_active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_last_name"));
                      ("orig", (Str "contact_last_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_phone"));
                      ("orig", (Str "contact_phone"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_send_welcome_email"));
                      ("orig", (Str "contact_send_welcome_email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_user_name"));
                      ("orig", (Str "contact_user_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_user_role"));
                      ("orig", (Str "contact_user_role"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "parent_id"));
                      ("orig", (Str "parent_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "parent_name"));
                      ("orig", (Str "parent_name"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "verification_phrase"));
                      ("orig", (Str "verification_phrase"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("template", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "access_mode"));
            ("req", (Bool false));
            ("type", (Str "`$ANY`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "client"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "field_template"));
            ("req", (Bool false));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "option"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "reference"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "type"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (10.))) ]) ]));
        ("name", (Str "template"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "access_mode"));
                      ("orig", (Str "access_mode"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "active"));
                      ("orig", (Str "active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client_id"));
                      ("orig", (Str "client_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client_name"));
                      ("orig", (Str "client_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "field_template"));
                      ("orig", (Str "field_template"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$ARRAY`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_custom_style"));
                      ("orig", (Str "options_custom_style"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_custom_style_file"));
                      ("orig", (Str "options_custom_style_file"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_domain"));
                      ("orig", (Str "options_domain"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$ARRAY`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_active_from"));
                      ("orig", (Str "options_security_active_from"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_active_to"));
                      ("orig", (Str "options_security_active_to"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_irreversible"));
                      ("orig", (Str "options_security_irreversible"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner_id"));
                      ("orig", (Str "partner_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner_name"));
                      ("orig", (Str "partner_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "type"));
                      ("orig", (Str "type"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "remove")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("transaction", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "bfid"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "client"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "complete_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "direct_partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "err_code"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "err_message"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "ip_address"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "message_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "reference"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "success"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "template_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (12.))) ]) ]));
        ("name", (Str "transaction"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "date_from"));
                      ("orig", (Str "date_from"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "date_to"));
                      ("orig", (Str "date_to"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "message_id"));
                      ("orig", (Str "message_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "paging_mode"));
                      ("orig", (Str "paging_mode"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "success"));
                      ("orig", (Str "success"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "transaction_type"));
                      ("orig", (Str "transaction_type"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "transaction_type"));
                      ("orig", (Str "transaction_type"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("update_result", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "billing_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "client"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "contact"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "direct_partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "email"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "first_name"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "last_name"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "mid"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "parent"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (12.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "phone"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (13.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "reference"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (14.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "send_welcome_email"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (15.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "user_name"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (16.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "user_role"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool false));
                ("type", (Str "`$OBJECT`")) ]));
              ("update", (jo [
                ("req", (Bool false));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (17.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "verification_phrase"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (18.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (19.))) ]) ]));
        ("name", (Str "update_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$OBJECT`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "email"));
                      ("orig", (Str "email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "first_name"));
                      ("orig", (Str "first_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "last_name"));
                      ("orig", (Str "last_name"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$OBJECT`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "phone"));
                      ("orig", (Str "phone"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "send_welcome_email"));
                      ("orig", (Str "send_welcome_email"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "user_role"));
                      ("orig", (Str "user_role"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$OBJECT`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "username"));
                      ("orig", (Str "username"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "access_mode"));
                      ("orig", (Str "access_mode"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "active"));
                      ("orig", (Str "active"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client_id"));
                      ("orig", (Str "client_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client_name"));
                      ("orig", (Str "client_name"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "field_template"));
                      ("orig", (Str "field_template"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$ARRAY`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_custom_style"));
                      ("orig", (Str "options_custom_style"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_custom_style_file"));
                      ("orig", (Str "options_custom_style_file"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_domain"));
                      ("orig", (Str "options_domain"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$ARRAY`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_active_from"));
                      ("orig", (Str "options_security_active_from"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_active_to"));
                      ("orig", (Str "options_security_active_to"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "options_security_irreversible"));
                      ("orig", (Str "options_security_irreversible"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner_id"));
                      ("orig", (Str "partner_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner_name"));
                      ("orig", (Str "partner_name"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "type"));
                      ("orig", (Str "type"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_id"));
                      ("orig", (Str "contact_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "parent_id"));
                      ("orig", (Str "parent_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "parent_name"));
                      ("orig", (Str "parent_name"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "verification_phrase"));
                      ("orig", (Str "verification_phrase"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (1.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$OBJECT`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "email"));
                      ("orig", (Str "email"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "first_name"));
                      ("orig", (Str "first_name"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "last_name"));
                      ("orig", (Str "last_name"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$OBJECT`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "phone"));
                      ("orig", (Str "phone"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "send_welcome_email"));
                      ("orig", (Str "send_welcome_email"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "username"));
                      ("orig", (Str "username"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (2.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "contact_id"));
                      ("orig", (Str "contact_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "direct_partner_id"));
                      ("orig", (Str "direct_partner_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "direct_partner_name"));
                      ("orig", (Str "direct_partner_name"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "mid"));
                      ("orig", (Str "mid"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (3.))) ]) ]));
            ("key$", (Str "update")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("user", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "client"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "email"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "first_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "last_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "phone"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "user_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "user_role"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (12.))) ]) ]));
        ("name", (Str "user"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

let make_feature (name : string) : feature =
  match name with
  | "test" -> test_feature ()
  | _ -> base_feature ()
