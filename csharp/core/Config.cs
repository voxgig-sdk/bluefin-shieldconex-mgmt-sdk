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
                ["version"] = "0.0.1",
                ["target"] = "csharp",
            },
            ["feature"] = new Dictionary<string, object?>
            {
                ["test"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                },
            },
            ["options"] = new Dictionary<string, object?>
            {
                ["base"] = "https://portal-cert.shieldconex.com:4010/api/v1",
                ["auth"] = new Dictionary<string, object?>
                {
                    ["prefix"] = "Basic",
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
                            ["short"] = "Billing ID",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "contact",
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
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "directPartner",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["short"] = "This property indicates if the Client account is active or disabled.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mid",
                            ["short"] = "Some Partners will have an merchant ids on their own software offerings.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "The Client's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
                        },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_email",
                                                ["orig"] = "contact_email",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_first_name",
                                                ["orig"] = "contact_first_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_is_active",
                                                ["orig"] = "contact_is_active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_last_name",
                                                ["orig"] = "contact_last_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_phone",
                                                ["orig"] = "contact_phone",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_send_welcome_email",
                                                ["orig"] = "contact_send_welcome_email",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_user_name",
                                                ["orig"] = "contact_user_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_user_role",
                                                ["orig"] = "contact_user_role",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "direct_partner_id",
                                                ["orig"] = "direct_partner_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "direct_partner_name",
                                                ["orig"] = "direct_partner_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "mid",
                                                ["orig"] = "mid",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/clients",
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/clients",
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/clients/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "DELETE",
                                    ["orig"] = "/clients/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                            ["short"] = "Unique identifier of newly added element.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "Name of Template",
                            ["type"] = "`$STRING`",
                        },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "template_id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/templates/{id}/clone",
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "template_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                "template",
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
                            ["short"] = "The Partner's billing identifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "contact",
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
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["short"] = "This property indicates if the Parter account is active or disabled.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "The Partner's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "parent",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["short"] = "The Partner's reference string.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "verificationPhrase",
                            ["short"] = "The verification phrase is a message that the Partner creates.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
                        },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_email",
                                                ["orig"] = "contact_email",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_first_name",
                                                ["orig"] = "contact_first_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_is_active",
                                                ["orig"] = "contact_is_active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_last_name",
                                                ["orig"] = "contact_last_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_phone",
                                                ["orig"] = "contact_phone",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_send_welcome_email",
                                                ["orig"] = "contact_send_welcome_email",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_user_name",
                                                ["orig"] = "contact_user_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_user_role",
                                                ["orig"] = "contact_user_role",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "parent_id",
                                                ["orig"] = "parent_id",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "parent_name",
                                                ["orig"] = "parent_name",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "verification_phrase",
                                                ["orig"] = "verification_phrase",
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/partners",
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/partners",
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/partners/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                        "{id}",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                            ["short"] = "The Template's access mode.",
                            ["type"] = "`$ANY`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "active",
                            ["short"] = "This property indicates if the Template is active or inactive.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["short"] = "Reference to the associated Client resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "fieldTemplates",
                            ["short"] = "Field Template list items",
                            ["type"] = "`$ARRAY`",
                            ["union"] = new Dictionary<string, object?>
                            {
                                ["branches"] = 9,
                                ["count"] = 1,
                                ["depth"] = 1,
                            },
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "Unique identifier of newly added element.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "The Template's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "options",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["short"] = "The Template's unique reference.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "type",
                            ["short"] = "The Template's type.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
                        },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "access_mode",
                                                ["orig"] = "access_mode",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "active",
                                                ["orig"] = "active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client_id",
                                                ["orig"] = "client_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client_name",
                                                ["orig"] = "client_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "field_template",
                                                ["orig"] = "field_template",
                                                ["type"] = "`$ARRAY`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_custom_style",
                                                ["orig"] = "options_custom_style",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_custom_style_file",
                                                ["orig"] = "options_custom_style_file",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_domain",
                                                ["orig"] = "options_domain",
                                                ["type"] = "`$ARRAY`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_security_active_from",
                                                ["orig"] = "options_security_active_from",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_security_active_to",
                                                ["orig"] = "options_security_active_to",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_security_irreversible",
                                                ["orig"] = "options_security_irreversible",
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner_id",
                                                ["orig"] = "partner_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner_name",
                                                ["orig"] = "partner_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "type",
                                                ["orig"] = "type",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/templates",
                                    ["parts"] = new List<object?>
                                    {
                                        "templates",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/templates",
                                    ["parts"] = new List<object?>
                                    {
                                        "templates",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/templates/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "templates",
                                        "{id}",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "DELETE",
                                    ["orig"] = "/templates/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "templates",
                                        "{id}",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                            ["short"] = "BFID",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["short"] = "Reference to the associated Client resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "completeDate",
                            ["short"] = "Timestamp from the beginning of the transaction.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "directPartner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "errCode",
                            ["short"] = "The error code that is sent in response to a failed decrypt API call.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "errMessage",
                            ["short"] = "The error messge that is sent in response to a failed decrypt API call.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "ipAddress",
                            ["short"] = "The IP address of the http client that makes the decrypt API call.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "messageId",
                            ["short"] = "Message ID.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["short"] = "The reference property that the Client includes in the decrypt API call.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "success",
                            ["short"] = "The success indicator.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "templateId",
                            ["short"] = "The Template's unique identifier.",
                            ["type"] = "`$STRING`",
                        },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "date_from",
                                                ["orig"] = "date_from",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "date_to",
                                                ["orig"] = "date_to",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "message_id",
                                                ["orig"] = "message_id",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "paging_mode",
                                                ["orig"] = "paging_mode",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "success",
                                                ["orig"] = "success",
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "transaction_type",
                                                ["orig"] = "transaction_type",
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/transactions",
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "transaction_type",
                                                ["orig"] = "transaction_type",
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/transactions/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                        "{id}",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                            "transaction_type",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                            ["short"] = "The Partner's billing identifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["short"] = "Reference to the associated Client resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "contact",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "directPartner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "email",
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
                            ["req"] = true,
                            ["short"] = "The User's email address.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "firstName",
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
                            ["req"] = true,
                            ["short"] = "The User's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "Unique identifier of newly added element.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["short"] = "This property indicates if the User account is active or disabled.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "lastName",
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
                            ["req"] = true,
                            ["short"] = "The User's Surname.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mid",
                            ["short"] = "Some Partners will have an merchant ids on their own software offerings.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "The Partner's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "parent",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "phone",
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
                            ["req"] = true,
                            ["short"] = "The User's phone number without dashes, spaces, or brackets (e.g.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["short"] = "The Partner's reference string.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "sendWelcomeEmail",
                            ["short"] = "If this property is set to 'true' the newly created user will be sent a welcome email.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userName",
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
                            ["req"] = true,
                            ["short"] = "The User's unique username.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userRole",
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
                            ["req"] = true,
                            ["short"] = "Reference to the associated User Role.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "verificationPhrase",
                            ["short"] = "The verification phrase is a message that the Partner creates.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
                        },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$OBJECT`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "email",
                                                ["orig"] = "email",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "first_name",
                                                ["orig"] = "first_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "last_name",
                                                ["orig"] = "last_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$OBJECT`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "phone",
                                                ["orig"] = "phone",
                                                ["reqd"] = true,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "send_welcome_email",
                                                ["orig"] = "send_welcome_email",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "user_role",
                                                ["orig"] = "user_role",
                                                ["reqd"] = true,
                                                ["type"] = "`$OBJECT`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "username",
                                                ["orig"] = "username",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/users",
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/users",
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "access_mode",
                                                ["orig"] = "access_mode",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "active",
                                                ["orig"] = "active",
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client_id",
                                                ["orig"] = "client_id",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client_name",
                                                ["orig"] = "client_name",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "field_template",
                                                ["orig"] = "field_template",
                                                ["type"] = "`$ARRAY`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_custom_style",
                                                ["orig"] = "options_custom_style",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_custom_style_file",
                                                ["orig"] = "options_custom_style_file",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_domain",
                                                ["orig"] = "options_domain",
                                                ["type"] = "`$ARRAY`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_security_active_from",
                                                ["orig"] = "options_security_active_from",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_security_active_to",
                                                ["orig"] = "options_security_active_to",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "options_security_irreversible",
                                                ["orig"] = "options_security_irreversible",
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner_id",
                                                ["orig"] = "partner_id",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner_name",
                                                ["orig"] = "partner_name",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "type",
                                                ["orig"] = "type",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/templates/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "templates",
                                        "{id}",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_id",
                                                ["orig"] = "contact_id",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "parent_id",
                                                ["orig"] = "parent_id",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "parent_name",
                                                ["orig"] = "parent_name",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "verification_phrase",
                                                ["orig"] = "verification_phrase",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/partners/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                        "{id}",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$OBJECT`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "email",
                                                ["orig"] = "email",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "first_name",
                                                ["orig"] = "first_name",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "last_name",
                                                ["orig"] = "last_name",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$OBJECT`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "phone",
                                                ["orig"] = "phone",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "send_welcome_email",
                                                ["orig"] = "send_welcome_email",
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "username",
                                                ["orig"] = "username",
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/users/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "contact_id",
                                                ["orig"] = "contact_id",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "direct_partner_id",
                                                ["orig"] = "direct_partner_id",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "direct_partner_name",
                                                ["orig"] = "direct_partner_name",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "mid",
                                                ["orig"] = "mid",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/clients/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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
                            ["short"] = "Reference to the associated Client resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "email",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "firstName",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "lastName",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "phone",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userName",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userRole",
                            ["short"] = "Reference to the associated User Role.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
                        },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/users/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
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

    public static Feature.BaseFeature MakeFeature(string name)
    {
        switch (name)
        {
            case "test":
                return new Feature.TestFeature();
            default:
                return new Feature.BaseFeature();
        }
    }
}
