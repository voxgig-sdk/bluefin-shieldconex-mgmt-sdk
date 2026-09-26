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
      ("name", (Str "BluefinShieldconexMgmt"));
      ("slug", (Str "bluefin-shieldconex-mgmt"));
      ("version", (Str "0.1.1"));
      ("target", (Str "ocaml")) ]));
    ("feature", (jo [
      ("audit", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("actor", (Str "anonymous"));
          ("max", (Num (1000.))) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("sink", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("clienttrack", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("clientVersion", (Str "0.0.1")) ]));
        ("optspec", (jo [
          ("clientName", (Str "`$STRING`"));
          ("clientVersion", (Str "`$STRING`"));
          ("headers", (Str "`$MAP`"));
          ("idgen", (Str "`$FUNCTION`"));
          ("sessionId", (Str "`$STRING`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("debug", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("max", (Num (100.)));
          ("redact", (ja [
            (Str "authorization");
            (Str "cookie");
            (Str "set-cookie");
            (Str "api-key");
            (Str "apikey");
            (Str "x-api-key");
            (Str "idempotency-key") ])) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("onEntry", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("idempotency", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("header", (Str "Idempotency-Key"));
          ("methods", (ja [
            (Str "POST");
            (Str "PUT");
            (Str "PATCH");
            (Str "DELETE") ]));
          ("ops", (ja [
            (Str "create");
            (Str "update");
            (Str "remove") ])) ]));
        ("optspec", (jo [
          ("keygen", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("log", (jo [
        ("options", (jo [
          ("active", (Bool true)) ]));
        ("optspec", (jo [
          ("level", (Str "`$STRING`"));
          ("logger", (Str "`$ANY`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("metrics", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("paging", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("afterVar", (Str "after"));
          ("cursorParam", (Str "cursor"));
          ("firstVar", (Str "first"));
          ("limitParam", (Str "limit"));
          ("pageParam", (Str "page"));
          ("startPage", (Num (1.))) ]));
        ("optspec", (jo [
          ("limit", (Str "`$NUMBER`"));
          ("ops", (Str "`$LIST`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("ratelimit", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("burst", (Num (5.)));
          ("rate", (Num (5.))) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("sleep", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "wrap")) ]));
      ("retry", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("factor", (Num (2.)));
          ("maxDelay", (Num (2000.)));
          ("minDelay", (Num (50.)));
          ("retries", (Num (2.)));
          ("statuses", (ja [
            (Num (408.));
            (Num (425.));
            (Num (429.));
            (Num (500.));
            (Num (502.));
            (Num (503.));
            (Num (504.)) ])) ]));
        ("optspec", (jo [
          ("jitter", (Str "`$BOOLEAN`"));
          ("sleep", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "wrap")) ]));
      ("telemetry", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("exporter", (Str "`$FUNCTION`"));
          ("headers", (Str "`$MAP`"));
          ("idgen", (Str "`$FUNCTION`"));
          ("now", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("test", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("entity", (Str "`$MAP`"));
          ("net", (Str "`$MAP`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "base")) ]));
      ("timeout", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("ms", (Num (30000.))) ]));
        ("optspec", (jo [
          ("clearTimer", (Str "`$FUNCTION`"));
          ("setTimer", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "wrap")) ])) ]));
    ("options", (jo [
      ("base", (Str "https://portal-cert.shieldconex.com:4010/api/v1"));
      ("auth", (jo [
        ("prefix", (Str "Basic"));
        ("basic", (Bool true)) ]));
      ("headers", (jo [
        ("content-type", (Str "application/json")) ]));
      ("entity", (jo [
        ("client", (empty_map ()));
        ("clone", (empty_map ()));
        ("partner", (empty_map ()));
        ("template", (empty_map ()));
        ("transaction", (empty_map ()));
        ("update_result", (empty_map ()));
        ("user", (empty_map ())) ])) ]));
    ("entity", (jo [
      ("client", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "billingId"));
            ("title", (Str "Billing Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Billing ID")) ]);
          (jo [
            ("name", (Str "contact"));
            ("title", (Str "Contact"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ]));
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ])) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("title", (Str "Direct Partner"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "This resource's unique identifier."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("title", (Str "Is Active"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This property indicates if the Client account is active or disabled.")) ]);
          (jo [
            ("name", (Str "mid"));
            ("title", (Str "Mid"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Some Partners will have an merchant ids on their own software offerings.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Client's name.")) ]);
          (jo [
            ("name", (Str "partner"));
            ("title", (Str "Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "client"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/clients"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]) ]));
                ("parts", (ja [
                  (Str "clients") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "contact_email"));
                      ("orig", (Str "contact_email"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_first_name"));
                      ("orig", (Str "contact_first_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_is_active"));
                      ("orig", (Str "contact_is_active"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_last_name"));
                      ("orig", (Str "contact_last_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_phone"));
                      ("orig", (Str "contact_phone"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_send_welcome_email"));
                      ("orig", (Str "contact_send_welcome_email"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_user_name"));
                      ("orig", (Str "contact_user_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_user_role"));
                      ("orig", (Str "contact_user_role"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "direct_partner_id"));
                      ("orig", (Str "direct_partner_id"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "direct_partner_name"));
                      ("orig", (Str "direct_partner_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "mid"));
                      ("orig", (Str "mid"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]) ])) ]));
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
                    (Str "name") ])) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/clients"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]) ]));
                ("parts", (ja [
                  (Str "clients") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/clients/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/clients/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("clone", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "Unique identifier of newly added element."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Name of Template")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "clone"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/templates/{id}/clone"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]);
                  (jo [
                    ("var", (Str "template_id")) ]);
                  (jo [
                    ("lit", (Str "clone")) ]) ]));
                ("parts", (ja [
                  (Str "templates");
                  (Str "{template_id}");
                  (Str "clone") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("id", (Str "template_id")) ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "template_id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "template_id") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "$.main.kit.entity.template") ]) ])) ])) ]));
      ("partner", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "billingId"));
            ("title", (Str "Billing Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Partner's billing identifier.")) ]);
          (jo [
            ("name", (Str "contact"));
            ("title", (Str "Contact"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ]));
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ])) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "This resource's unique identifier."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("title", (Str "Is Active"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This property indicates if the Parter account is active or disabled.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Partner's name.")) ]);
          (jo [
            ("name", (Str "parent"));
            ("title", (Str "Parent"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "reference"));
            ("title", (Str "Reference"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Partner's reference string.")) ]);
          (jo [
            ("name", (Str "verificationPhrase"));
            ("title", (Str "Verification Phrase"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The verification phrase is a message that the Partner creates.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "partner"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/partners"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]) ]));
                ("parts", (ja [
                  (Str "partners") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_email"));
                      ("orig", (Str "contact_email"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_first_name"));
                      ("orig", (Str "contact_first_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_is_active"));
                      ("orig", (Str "contact_is_active"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_last_name"));
                      ("orig", (Str "contact_last_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_phone"));
                      ("orig", (Str "contact_phone"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_send_welcome_email"));
                      ("orig", (Str "contact_send_welcome_email"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_user_name"));
                      ("orig", (Str "contact_user_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "contact_user_role"));
                      ("orig", (Str "contact_user_role"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "parent_id"));
                      ("orig", (Str "parent_id"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "parent_name"));
                      ("orig", (Str "parent_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "verification_phrase"));
                      ("orig", (Str "verification_phrase"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]) ])) ]));
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
                    (Str "verification_phrase") ])) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/partners"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]) ]));
                ("parts", (ja [
                  (Str "partners") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/partners/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("template", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "accessMode"));
            ("title", (Str "Access Mode"));
            ("type", (Str "`$ANY`"));
            ("short", (Str "The Template's access mode.")) ]);
          (jo [
            ("name", (Str "active"));
            ("title", (Str "Active"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This property indicates if the Template is active or inactive.")) ]);
          (jo [
            ("name", (Str "client"));
            ("title", (Str "Client"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Client resource.")) ]);
          (jo [
            ("name", (Str "fieldTemplates"));
            ("title", (Str "Field Templates"));
            ("type", (Str "`$ARRAY`"));
            ("short", (Str "Field Template list items")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "Unique identifier of newly added element."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Template's name.")) ]);
          (jo [
            ("name", (Str "options"));
            ("title", (Str "Options"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("title", (Str "Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "reference"));
            ("title", (Str "Reference"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Template's unique reference.")) ]);
          (jo [
            ("name", (Str "type"));
            ("title", (Str "Type"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Template's type.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "template"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/templates"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]) ]));
                ("parts", (ja [
                  (Str "templates") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "access_mode"));
                      ("orig", (Str "access_mode"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "active"));
                      ("orig", (Str "active"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "client_id"));
                      ("orig", (Str "client_id"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "client_name"));
                      ("orig", (Str "client_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "field_template"));
                      ("orig", (Str "field_template"));
                      ("type", (Str "`$ARRAY`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "options_custom_style"));
                      ("orig", (Str "options_custom_style"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "options_custom_style_file"));
                      ("orig", (Str "options_custom_style_file"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "options_domain"));
                      ("orig", (Str "options_domain"));
                      ("type", (Str "`$ARRAY`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "options_security_active_from"));
                      ("orig", (Str "options_security_active_from"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "options_security_active_to"));
                      ("orig", (Str "options_security_active_to"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "options_security_irreversible"));
                      ("orig", (Str "options_security_irreversible"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "partner_id"));
                      ("orig", (Str "partner_id"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "partner_name"));
                      ("orig", (Str "partner_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "type"));
                      ("orig", (Str "type"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]) ])) ]));
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
                    (Str "version") ])) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/templates"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]) ]));
                ("parts", (ja [
                  (Str "templates") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/templates/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "templates");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/templates/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "templates");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("transaction", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "bfid"));
            ("title", (Str "Bfid"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "BFID")) ]);
          (jo [
            ("name", (Str "client"));
            ("title", (Str "Client"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Client resource.")) ]);
          (jo [
            ("name", (Str "completeDate"));
            ("title", (Str "Complete Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Timestamp from the beginning of the transaction."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("title", (Str "Direct Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "errCode"));
            ("title", (Str "Err Code"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The error code that is sent in response to a failed decrypt API call.")) ]);
          (jo [
            ("name", (Str "errMessage"));
            ("title", (Str "Err Message"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The error messge that is sent in response to a failed decrypt API call.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "This resource's unique identifier."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "ipAddress"));
            ("title", (Str "Ip Address"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The IP address of the http client that makes the decrypt API call.")) ]);
          (jo [
            ("name", (Str "messageId"));
            ("title", (Str "Message Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Message ID.")) ]);
          (jo [
            ("name", (Str "partner"));
            ("title", (Str "Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "reference"));
            ("title", (Str "Reference"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The reference property that the Client includes in the decrypt API call.")) ]);
          (jo [
            ("name", (Str "success"));
            ("title", (Str "Success"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "The success indicator.")) ]);
          (jo [
            ("name", (Str "templateId"));
            ("title", (Str "Template Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Template's unique identifier."));
            ("format", (Str "int32")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "transaction"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/transactions"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]) ]));
                ("parts", (ja [
                  (Str "transactions") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "date_from"));
                      ("orig", (Str "date_from"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "date_to"));
                      ("orig", (Str "date_to"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "message_id"));
                      ("orig", (Str "message_id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "paging_mode"));
                      ("orig", (Str "paging_mode"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "success"));
                      ("orig", (Str "success"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]);
                    (jo [
                      ("name", (Str "transaction_type"));
                      ("orig", (Str "transaction_type"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]) ])) ]));
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
                    (Str "transaction_type") ])) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/transactions/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "transactions");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("name", (Str "transaction_type"));
                      ("orig", (Str "transaction_type"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id");
                    (Str "transaction_type") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("update_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "billingId"));
            ("title", (Str "Billing Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Partner's billing identifier.")) ]);
          (jo [
            ("name", (Str "client"));
            ("title", (Str "Client"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Client resource.")) ]);
          (jo [
            ("name", (Str "contact"));
            ("title", (Str "Contact"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("title", (Str "Direct Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "email"));
            ("title", (Str "Email"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The User's email address.")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("title", (Str "First Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The User's name.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "Unique identifier of newly added element."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("title", (Str "Is Active"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This property indicates if the User account is active or disabled.")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("title", (Str "Last Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The User's Surname.")) ]);
          (jo [
            ("name", (Str "mid"));
            ("title", (Str "Mid"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Some Partners will have an merchant ids on their own software offerings.")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Partner's name.")) ]);
          (jo [
            ("name", (Str "parent"));
            ("title", (Str "Parent"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "partner"));
            ("title", (Str "Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "phone"));
            ("title", (Str "Phone"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The User's phone number without dashes, spaces, or brackets (e.g.")) ]);
          (jo [
            ("name", (Str "reference"));
            ("title", (Str "Reference"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Partner's reference string.")) ]);
          (jo [
            ("name", (Str "sendWelcomeEmail"));
            ("title", (Str "Send Welcome Email"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "If this property is set to 'true' the newly created user will be sent a welcome email.")) ]);
          (jo [
            ("name", (Str "userName"));
            ("title", (Str "User Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The User's unique username.")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("title", (Str "User Role"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$OBJECT`")) ]));
              ("update", (jo [
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated User Role.")) ]);
          (jo [
            ("name", (Str "verificationPhrase"));
            ("title", (Str "Verification Phrase"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The verification phrase is a message that the Partner creates.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "update_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/users"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]) ]));
                ("parts", (ja [
                  (Str "users") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$OBJECT`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "email"));
                      ("orig", (Str "email"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "first_name"));
                      ("orig", (Str "first_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "last_name"));
                      ("orig", (Str "last_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$OBJECT`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "phone"));
                      ("orig", (Str "phone"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "send_welcome_email"));
                      ("orig", (Str "send_welcome_email"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "user_role"));
                      ("orig", (Str "user_role"));
                      ("type", (Str "`$OBJECT`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "username"));
                      ("orig", (Str "username"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true)) ]) ])) ]));
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
                    (Str "username") ])) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/users"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]) ]));
                ("parts", (ja [
                  (Str "users") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ])) ]) ])) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/templates/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "templates");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("name", (Str "access_mode"));
                      ("orig", (Str "access_mode"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "active"));
                      ("orig", (Str "active"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "client_id"));
                      ("orig", (Str "client_id"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "client_name"));
                      ("orig", (Str "client_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "field_template"));
                      ("orig", (Str "field_template"));
                      ("type", (Str "`$ARRAY`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "options_custom_style"));
                      ("orig", (Str "options_custom_style"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "options_custom_style_file"));
                      ("orig", (Str "options_custom_style_file"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "options_domain"));
                      ("orig", (Str "options_domain"));
                      ("type", (Str "`$ARRAY`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "options_security_active_from"));
                      ("orig", (Str "options_security_active_from"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "options_security_active_to"));
                      ("orig", (Str "options_security_active_to"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "options_security_irreversible"));
                      ("orig", (Str "options_security_irreversible"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "partner_id"));
                      ("orig", (Str "partner_id"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "partner_name"));
                      ("orig", (Str "partner_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "type"));
                      ("orig", (Str "type"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]) ])) ]));
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
                    (Str "version") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/partners/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "contact_id"));
                      ("orig", (Str "contact_id"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "parent_id"));
                      ("orig", (Str "parent_id"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "parent_name"));
                      ("orig", (Str "parent_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "verification_phrase"));
                      ("orig", (Str "verification_phrase"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]) ])) ]));
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
                    (Str "version") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/users/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$OBJECT`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "email"));
                      ("orig", (Str "email"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "first_name"));
                      ("orig", (Str "first_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "last_name"));
                      ("orig", (Str "last_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$OBJECT`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "phone"));
                      ("orig", (Str "phone"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "send_welcome_email"));
                      ("orig", (Str "send_welcome_email"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "username"));
                      ("orig", (Str "username"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]) ])) ]));
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
                    (Str "username") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/clients/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("name", (Str "billing_id"));
                      ("orig", (Str "billing_id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "contact_id"));
                      ("orig", (Str "contact_id"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "direct_partner_id"));
                      ("orig", (Str "direct_partner_id"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "direct_partner_name"));
                      ("orig", (Str "direct_partner_name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "is_active"));
                      ("orig", (Str "is_active"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "mid"));
                      ("orig", (Str "mid"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "name"));
                      ("orig", (Str "name"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "version"));
                      ("orig", (Str "version"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query")) ]) ])) ]));
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
                    (Str "version") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("user", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "client"));
            ("title", (Str "Client"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Client resource.")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "email"));
            ("title", (Str "Email"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("title", (Str "First Name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "This resource's unique identifier."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("title", (Str "Is Active"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("title", (Str "Last Name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "partner"));
            ("title", (Str "Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "phone"));
            ("title", (Str "Phone"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userName"));
            ("title", (Str "User Name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("title", (Str "User Role"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated User Role.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "user"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/users/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

(* The plugin definitions the model selected, per feature: none - no
 * plugin-bearing feature is active in this SDK. *)
let feature_plugins (_name : string) = []

let make_feature (name : string) : feature =
  match name with
  | "audit" -> audit_feature ()
  | "clienttrack" -> clienttrack_feature ()
  | "debug" -> debug_feature ()
  | "idempotency" -> idempotency_feature ()
  | "log" -> log_feature ()
  | "metrics" -> metrics_feature ()
  | "paging" -> paging_feature ()
  | "ratelimit" -> ratelimit_feature ()
  | "retry" -> retry_feature ()
  | "telemetry" -> telemetry_feature ()
  | "test" -> test_feature ()
  | "timeout" -> timeout_feature ()
  | _ -> base_feature ()
