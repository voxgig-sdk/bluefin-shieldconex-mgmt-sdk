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
            ("short", (Str "Billing ID"));
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
            ("format", (Str "date-time"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("short", (Str "This property indicates if the Client account is active or disabled."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "mid"));
            ("short", (Str "Some Partners will have an merchant ids on their own software offerings."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Client's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]) ]));
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
                ("parts", (ja [
                  (Str "clients") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "clients") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("clone", (jo [
        ("fields", (ja [
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "Unique identifier of newly added element."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "Name of Template"));
            ("type", (Str "`$STRING`")) ]) ]));
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
                ("rename", (jo [
                  ("param", (jo [
                    ("id", (Str "template_id")) ])) ]));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]);
                  (jo [
                    ("var", (Str "template_id")) ]);
                  (jo [
                    ("lit", (Str "clone")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "template_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "templates");
                  (Str "{template_id}");
                  (Str "clone") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "template") ]) ])) ])) ]));
      ("partner", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "billingId"));
            ("short", (Str "The Partner's billing identifier."));
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
            ("format", (Str "date-time"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("short", (Str "This property indicates if the Parter account is active or disabled."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Partner's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "parent"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("short", (Str "The Partner's reference string."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "verificationPhrase"));
            ("short", (Str "The verification phrase is a message that the Partner creates."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]) ]));
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
                ("parts", (ja [
                  (Str "partners") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "partners") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("template", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "accessMode"));
            ("short", (Str "The Template's access mode."));
            ("type", (Str "`$ANY`")) ]);
          (jo [
            ("name", (Str "active"));
            ("short", (Str "This property indicates if the Template is active or inactive."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "fieldTemplates"));
            ("short", (Str "Field Template list items"));
            ("type", (Str "`$ARRAY`"));
            ("union", (jo [
              ("branches", (Num (9.)));
              ("count", (Num (1.)));
              ("depth", (Num (1.))) ])) ]);
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "Unique identifier of newly added element."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "The Template's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "options"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("short", (Str "The Template's unique reference."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "type"));
            ("short", (Str "The Template's type."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]) ]));
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
                ("parts", (ja [
                  (Str "templates") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "templates") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "templates");
                  (Str "{id}") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "templates");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("transaction", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "bfid"));
            ("short", (Str "BFID"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "completeDate"));
            ("short", (Str "Timestamp from the beginning of the transaction."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "errCode"));
            ("short", (Str "The error code that is sent in response to a failed decrypt API call."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "errMessage"));
            ("short", (Str "The error messge that is sent in response to a failed decrypt API call."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "ipAddress"));
            ("short", (Str "The IP address of the http client that makes the decrypt API call."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "messageId"));
            ("short", (Str "Message ID."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("short", (Str "The reference property that the Client includes in the decrypt API call."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "success"));
            ("short", (Str "The success indicator."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("format", (Str "int32"));
            ("name", (Str "templateId"));
            ("short", (Str "The Template's unique identifier."));
            ("type", (Str "`$STRING`")) ]) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]) ]));
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
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "transactions") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id");
                    (Str "transaction_type") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "transactions");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("update_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "billingId"));
            ("short", (Str "The Partner's billing identifier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "contact"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "email"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("short", (Str "The User's email address."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("short", (Str "The User's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "Unique identifier of newly added element."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("short", (Str "This property indicates if the User account is active or disabled."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("short", (Str "The User's Surname."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mid"));
            ("short", (Str "Some Partners will have an merchant ids on their own software offerings."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "The Partner's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "parent"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "phone"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("short", (Str "The User's phone number without dashes, spaces, or brackets (e.g."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("short", (Str "The Partner's reference string."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "sendWelcomeEmail"));
            ("short", (Str "If this property is set to 'true' the newly created user will be sent a welcome email."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "userName"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("short", (Str "The User's unique username."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$OBJECT`")) ]));
              ("update", (jo [
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User Role."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "verificationPhrase"));
            ("short", (Str "The verification phrase is a message that the Partner creates."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]) ]));
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
                ("parts", (ja [
                  (Str "users") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "users") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "templates")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
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
                ("parts", (ja [
                  (Str "templates");
                  (Str "{id}") ])) ]);
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
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
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ])) ]);
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
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
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ])) ]);
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
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
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("user", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "email"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "phone"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("short", (Str "Reference to the associated User Role."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ])) ]) ])) ])) ]));
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
