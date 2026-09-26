// BluefinShieldconexMgmt SDK - generated model configuration and feature
// factory. GENERATED from the API model - do not edit by hand.

namespace BluefinShieldconexMgmtSdk;

public static class SdkConfig
{
    public static Dictionary<string, object?> MakeConfig()
    {
        return new Dictionary<string, object?>
        {
            ["main"] = new Dictionary<string, object?>
            {
                ["name"] = "BluefinShieldconexMgmt",
                ["slug"] = "bluefin-shieldconex-mgmt",
                ["version"] = "0.1.1",
                ["target"] = "csharp",
            },
            ["feature"] = new Dictionary<string, object?>
            {
                ["audit"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["actor"] = "anonymous",
                        ["max"] = 1000,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                        ["sink"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["clienttrack"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["clientVersion"] = "0.0.1",
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["clientName"] = "`$STRING`",
                        ["clientVersion"] = "`$STRING`",
                        ["headers"] = "`$MAP`",
                        ["idgen"] = "`$FUNCTION`",
                        ["sessionId"] = "`$STRING`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["debug"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["max"] = 100,
                        ["redact"] = new List<object?>
                        {
                            "authorization",
                            "cookie",
                            "set-cookie",
                            "api-key",
                            "apikey",
                            "x-api-key",
                            "idempotency-key",
                        },
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                        ["onEntry"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["idempotency"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["header"] = "Idempotency-Key",
                        ["methods"] = new List<object?>
                        {
                            "POST",
                            "PUT",
                            "PATCH",
                            "DELETE",
                        },
                        ["ops"] = new List<object?>
                        {
                            "create",
                            "update",
                            "remove",
                        },
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["keygen"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["log"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = true,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["level"] = "`$STRING`",
                        ["logger"] = "`$ANY`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["metrics"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["paging"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["afterVar"] = "after",
                        ["cursorParam"] = "cursor",
                        ["firstVar"] = "first",
                        ["limitParam"] = "limit",
                        ["pageParam"] = "page",
                        ["startPage"] = 1,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["limit"] = "`$NUMBER`",
                        ["ops"] = "`$LIST`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["ratelimit"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["burst"] = 5,
                        ["rate"] = 5,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                        ["sleep"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "wrap",
                },
                ["retry"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["factor"] = 2,
                        ["maxDelay"] = 2000,
                        ["minDelay"] = 50,
                        ["retries"] = 2,
                        ["statuses"] = new List<object?>
                        {
                            408,
                            425,
                            429,
                            500,
                            502,
                            503,
                            504,
                        },
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["jitter"] = "`$BOOLEAN`",
                        ["sleep"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "wrap",
                },
                ["telemetry"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["exporter"] = "`$FUNCTION`",
                        ["headers"] = "`$MAP`",
                        ["idgen"] = "`$FUNCTION`",
                        ["now"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["test"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["entity"] = "`$MAP`",
                        ["net"] = "`$MAP`",
                    },
                    ["strict"] = false,
                    ["transport"] = "base",
                },
                ["timeout"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["ms"] = 30000,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["clearTimer"] = "`$FUNCTION`",
                        ["setTimer"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "wrap",
                },
            },
            ["options"] = new Dictionary<string, object?>
            {
                ["base"] = "https://portal-cert.shieldconex.com:4010/api/v1",
                ["auth"] = new Dictionary<string, object?>
                {
                    ["prefix"] = "Basic",
                    ["basic"] = true,
                },
                ["headers"] = new Dictionary<string, object?>
                {
                    ["content-type"] = "application/json",
                },
                ["entity"] = new Dictionary<string, object?>
                {
                    ["client"] = new Dictionary<string, object?>(),
                    ["clone"] = new Dictionary<string, object?>(),
                    ["partner"] = new Dictionary<string, object?>(),
                    ["template"] = new Dictionary<string, object?>(),
                    ["transaction"] = new Dictionary<string, object?>(),
                    ["update_result"] = new Dictionary<string, object?>(),
                    ["user"] = new Dictionary<string, object?>(),
                },
            },
            ["entity"] = new Dictionary<string, object?>
            {
                ["client"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "billingId",
                            ["title"] = "Billing Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "Billing ID",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "contact",
                            ["title"] = "Contact",
                            ["type"] = "`$OBJECT`",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "directPartner",
                            ["title"] = "Direct Partner",
                            ["type"] = "`$OBJECT`",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "This resource's unique identifier.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["title"] = "Is Active",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This property indicates if the Client account is active or disabled.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mid",
                            ["title"] = "Mid",
                            ["type"] = "`$STRING`",
                            ["short"] = "Some Partners will have an merchant ids on their own software offerings.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "The Client's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["title"] = "Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "client",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/clients",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "clients",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_email",
                                                ["orig"] = "contact_email",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_first_name",
                                                ["orig"] = "contact_first_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_is_active",
                                                ["orig"] = "contact_is_active",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_last_name",
                                                ["orig"] = "contact_last_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_phone",
                                                ["orig"] = "contact_phone",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_send_welcome_email",
                                                ["orig"] = "contact_send_welcome_email",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_user_name",
                                                ["orig"] = "contact_user_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_user_role",
                                                ["orig"] = "contact_user_role",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "direct_partner_id",
                                                ["orig"] = "direct_partner_id",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "direct_partner_name",
                                                ["orig"] = "direct_partner_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "mid",
                                                ["orig"] = "mid",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                                        },
                                    },
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/clients",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "clients",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "partner",
                                            "skip",
                                            "take",
                                        },
                                    },
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/clients/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "clients",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "DELETE",
                                    ["orig"] = "/clients/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "clients",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["clone"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "Unique identifier of newly added element.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "Name of Template",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "clone",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/templates/{id}/clone",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "templates",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "template_id",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "clone",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "templates",
                                        "{template_id}",
                                        "clone",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["id"] = "template_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "template_id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "template_id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "$.main.kit.entity.template",
                            },
                        },
                    },
                },
                ["partner"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "billingId",
                            ["title"] = "Billing Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Partner's billing identifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "contact",
                            ["title"] = "Contact",
                            ["type"] = "`$OBJECT`",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "This resource's unique identifier.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["title"] = "Is Active",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This property indicates if the Parter account is active or disabled.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "The Partner's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "parent",
                            ["title"] = "Parent",
                            ["type"] = "`$OBJECT`",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["title"] = "Reference",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Partner's reference string.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "verificationPhrase",
                            ["title"] = "Verification Phrase",
                            ["type"] = "`$STRING`",
                            ["short"] = "The verification phrase is a message that the Partner creates.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "partner",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/partners",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "partners",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_email",
                                                ["orig"] = "contact_email",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_first_name",
                                                ["orig"] = "contact_first_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_is_active",
                                                ["orig"] = "contact_is_active",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_last_name",
                                                ["orig"] = "contact_last_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_phone",
                                                ["orig"] = "contact_phone",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_send_welcome_email",
                                                ["orig"] = "contact_send_welcome_email",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_user_name",
                                                ["orig"] = "contact_user_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_user_role",
                                                ["orig"] = "contact_user_role",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "parent_id",
                                                ["orig"] = "parent_id",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "parent_name",
                                                ["orig"] = "parent_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "verification_phrase",
                                                ["orig"] = "verification_phrase",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                                        },
                                    },
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/partners",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "partners",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "partner",
                                            "skip",
                                            "take",
                                        },
                                    },
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/partners/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "partners",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["template"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "accessMode",
                            ["title"] = "Access Mode",
                            ["type"] = "`$ANY`",
                            ["short"] = "The Template's access mode.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "active",
                            ["title"] = "Active",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This property indicates if the Template is active or inactive.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["title"] = "Client",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Client resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "fieldTemplates",
                            ["title"] = "Field Templates",
                            ["type"] = "`$ARRAY`",
                            ["short"] = "Field Template list items",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "Unique identifier of newly added element.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Template's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "options",
                            ["title"] = "Options",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["title"] = "Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["title"] = "Reference",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Template's unique reference.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "type",
                            ["title"] = "Type",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Template's type.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "template",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/templates",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "templates",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "templates",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "access_mode",
                                                ["orig"] = "access_mode",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "active",
                                                ["orig"] = "active",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client_id",
                                                ["orig"] = "client_id",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client_name",
                                                ["orig"] = "client_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "field_template",
                                                ["orig"] = "field_template",
                                                ["type"] = "`$ARRAY`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_custom_style",
                                                ["orig"] = "options_custom_style",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_custom_style_file",
                                                ["orig"] = "options_custom_style_file",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_domain",
                                                ["orig"] = "options_domain",
                                                ["type"] = "`$ARRAY`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_security_active_from",
                                                ["orig"] = "options_security_active_from",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_security_active_to",
                                                ["orig"] = "options_security_active_to",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_security_irreversible",
                                                ["orig"] = "options_security_irreversible",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner_id",
                                                ["orig"] = "partner_id",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner_name",
                                                ["orig"] = "partner_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "type",
                                                ["orig"] = "type",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                                        },
                                    },
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/templates",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "templates",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "templates",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "client",
                                            "partner",
                                            "skip",
                                            "take",
                                        },
                                    },
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/templates/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "templates",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "templates",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "DELETE",
                                    ["orig"] = "/templates/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "templates",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "templates",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["transaction"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "bfid",
                            ["title"] = "Bfid",
                            ["type"] = "`$STRING`",
                            ["short"] = "BFID",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["title"] = "Client",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Client resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "completeDate",
                            ["title"] = "Complete Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "Timestamp from the beginning of the transaction.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "directPartner",
                            ["title"] = "Direct Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "errCode",
                            ["title"] = "Err Code",
                            ["type"] = "`$STRING`",
                            ["short"] = "The error code that is sent in response to a failed decrypt API call.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "errMessage",
                            ["title"] = "Err Message",
                            ["type"] = "`$STRING`",
                            ["short"] = "The error messge that is sent in response to a failed decrypt API call.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "This resource's unique identifier.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "ipAddress",
                            ["title"] = "Ip Address",
                            ["type"] = "`$STRING`",
                            ["short"] = "The IP address of the http client that makes the decrypt API call.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "messageId",
                            ["title"] = "Message Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "Message ID.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["title"] = "Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["title"] = "Reference",
                            ["type"] = "`$STRING`",
                            ["short"] = "The reference property that the Client includes in the decrypt API call.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "success",
                            ["title"] = "Success",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "The success indicator.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "templateId",
                            ["title"] = "Template Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Template's unique identifier.",
                            ["format"] = "int32",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "transaction",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/transactions",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "transactions",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "date_from",
                                                ["orig"] = "date_from",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "date_to",
                                                ["orig"] = "date_to",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "message_id",
                                                ["orig"] = "message_id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "paging_mode",
                                                ["orig"] = "paging_mode",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "success",
                                                ["orig"] = "success",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "transaction_type",
                                                ["orig"] = "transaction_type",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                                        },
                                    },
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/transactions/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "transactions",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "transaction_type",
                                                ["orig"] = "transaction_type",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                            "transaction_type",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["update_result"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "billingId",
                            ["title"] = "Billing Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Partner's billing identifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["title"] = "Client",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Client resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "contact",
                            ["title"] = "Contact",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "directPartner",
                            ["title"] = "Direct Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "email",
                            ["title"] = "Email",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "The User's email address.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "firstName",
                            ["title"] = "First Name",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "The User's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "Unique identifier of newly added element.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["title"] = "Is Active",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This property indicates if the User account is active or disabled.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "lastName",
                            ["title"] = "Last Name",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "The User's Surname.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mid",
                            ["title"] = "Mid",
                            ["type"] = "`$STRING`",
                            ["short"] = "Some Partners will have an merchant ids on their own software offerings.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Partner's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "parent",
                            ["title"] = "Parent",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["title"] = "Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "phone",
                            ["title"] = "Phone",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "The User's phone number without dashes, spaces, or brackets (e.g.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["title"] = "Reference",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Partner's reference string.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "sendWelcomeEmail",
                            ["title"] = "Send Welcome Email",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "If this property is set to 'true' the newly created user will be sent a welcome email.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userName",
                            ["title"] = "User Name",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "The User's unique username.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userRole",
                            ["title"] = "User Role",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$OBJECT`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["short"] = "Reference to the associated User Role.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "verificationPhrase",
                            ["title"] = "Verification Phrase",
                            ["type"] = "`$STRING`",
                            ["short"] = "The verification phrase is a message that the Partner creates.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "update_result",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/users",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "users",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$OBJECT`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "email",
                                                ["orig"] = "email",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "first_name",
                                                ["orig"] = "first_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "last_name",
                                                ["orig"] = "last_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$OBJECT`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "phone",
                                                ["orig"] = "phone",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "send_welcome_email",
                                                ["orig"] = "send_welcome_email",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "user_role",
                                                ["orig"] = "user_role",
                                                ["type"] = "`$OBJECT`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "username",
                                                ["orig"] = "username",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                                        },
                                    },
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/users",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "users",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "client",
                                            "partner",
                                            "skip",
                                            "take",
                                        },
                                    },
                                },
                            },
                        },
                        ["update"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "update",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/templates/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "templates",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "templates",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "access_mode",
                                                ["orig"] = "access_mode",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "active",
                                                ["orig"] = "active",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client_id",
                                                ["orig"] = "client_id",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client_name",
                                                ["orig"] = "client_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "field_template",
                                                ["orig"] = "field_template",
                                                ["type"] = "`$ARRAY`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_custom_style",
                                                ["orig"] = "options_custom_style",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_custom_style_file",
                                                ["orig"] = "options_custom_style_file",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_domain",
                                                ["orig"] = "options_domain",
                                                ["type"] = "`$ARRAY`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_security_active_from",
                                                ["orig"] = "options_security_active_from",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_security_active_to",
                                                ["orig"] = "options_security_active_to",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "options_security_irreversible",
                                                ["orig"] = "options_security_irreversible",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner_id",
                                                ["orig"] = "partner_id",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner_name",
                                                ["orig"] = "partner_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "type",
                                                ["orig"] = "type",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/partners/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "partners",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_id",
                                                ["orig"] = "contact_id",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "parent_id",
                                                ["orig"] = "parent_id",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "parent_name",
                                                ["orig"] = "parent_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "verification_phrase",
                                                ["orig"] = "verification_phrase",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/users/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "users",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$OBJECT`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "email",
                                                ["orig"] = "email",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "first_name",
                                                ["orig"] = "first_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "last_name",
                                                ["orig"] = "last_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$OBJECT`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "phone",
                                                ["orig"] = "phone",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "send_welcome_email",
                                                ["orig"] = "send_welcome_email",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "username",
                                                ["orig"] = "username",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/clients/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "clients",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "contact_id",
                                                ["orig"] = "contact_id",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "direct_partner_id",
                                                ["orig"] = "direct_partner_id",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "direct_partner_name",
                                                ["orig"] = "direct_partner_name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "mid",
                                                ["orig"] = "mid",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "billing_id",
                                            "contact_id",
                                            "direct_partner_id",
                                            "direct_partner_name",
                                            "id",
                                            "is_active",
                                            "mid",
                                            "name",
                                            "version",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["user"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["title"] = "Client",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Client resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "email",
                            ["title"] = "Email",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "firstName",
                            ["title"] = "First Name",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "This resource's unique identifier.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["title"] = "Is Active",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "lastName",
                            ["title"] = "Last Name",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["title"] = "Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "phone",
                            ["title"] = "Phone",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userName",
                            ["title"] = "User Name",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userRole",
                            ["title"] = "User Role",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated User Role.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "user",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/users/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "users",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
            },
        };
    }

    private static readonly Lazy<Dictionary<string, object?>> SharedConfigVal =
        new(MakeConfig);

    // The process-wide config, built once on first use.
    //
    // The returned dictionary is SHARED: treat it as read-only. Callers that
    // need to mutate should use MakeConfig, which always returns a fresh copy.
    public static Dictionary<string, object?> SharedConfig()
    {
        return SharedConfigVal.Value;
    }

    public static List<object?> FeaturePlugins(string name)
    {
        switch (name)
        {
            default:
                return new List<object?>();
        }
    }

    public static Feature.BaseFeature MakeFeature(string name)
    {
        switch (name)
        {
            case "audit":
                return new Feature.AuditFeature();
            case "clienttrack":
                return new Feature.ClienttrackFeature();
            case "debug":
                return new Feature.DebugFeature();
            case "idempotency":
                return new Feature.IdempotencyFeature();
            case "log":
                return new Feature.LogFeature();
            case "metrics":
                return new Feature.MetricsFeature();
            case "paging":
                return new Feature.PagingFeature();
            case "ratelimit":
                return new Feature.RatelimitFeature();
            case "retry":
                return new Feature.RetryFeature();
            case "telemetry":
                return new Feature.TelemetryFeature();
            case "test":
                return new Feature.TestFeature();
            case "timeout":
                return new Feature.TimeoutFeature();
            default:
                return new Feature.BaseFeature();
        }
    }
}
