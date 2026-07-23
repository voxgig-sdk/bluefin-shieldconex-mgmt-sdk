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
                            ["active"] = true,
                            ["name"] = "billing_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
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
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "direct_partner",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "mid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 10,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_email",
                                                ["orig"] = "contact_email",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_first_name",
                                                ["orig"] = "contact_first_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_is_active",
                                                ["orig"] = "contact_is_active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_last_name",
                                                ["orig"] = "contact_last_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_phone",
                                                ["orig"] = "contact_phone",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_send_welcome_email",
                                                ["orig"] = "contact_send_welcome_email",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_user_name",
                                                ["orig"] = "contact_user_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_user_role",
                                                ["orig"] = "contact_user_role",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "direct_partner_id",
                                                ["orig"] = "direct_partner_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "direct_partner_name",
                                                ["orig"] = "direct_partner_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "mid",
                                                ["orig"] = "mid",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "remove",
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
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "template_id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "billing_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
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
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "parent",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "reference",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "verification_phrase",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 10,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_email",
                                                ["orig"] = "contact_email",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_first_name",
                                                ["orig"] = "contact_first_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_is_active",
                                                ["orig"] = "contact_is_active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_last_name",
                                                ["orig"] = "contact_last_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_phone",
                                                ["orig"] = "contact_phone",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_send_welcome_email",
                                                ["orig"] = "contact_send_welcome_email",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_user_name",
                                                ["orig"] = "contact_user_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_user_role",
                                                ["orig"] = "contact_user_role",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "parent_id",
                                                ["orig"] = "parent_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "parent_name",
                                                ["orig"] = "parent_name",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "verification_phrase",
                                                ["orig"] = "verification_phrase",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "access_mode",
                            ["req"] = false,
                            ["type"] = "`$ANY`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "client",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "field_template",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "option",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "reference",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "type",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 10,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "access_mode",
                                                ["orig"] = "access_mode",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "active",
                                                ["orig"] = "active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client_id",
                                                ["orig"] = "client_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client_name",
                                                ["orig"] = "client_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "field_template",
                                                ["orig"] = "field_template",
                                                ["reqd"] = false,
                                                ["type"] = "`$ARRAY`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_custom_style",
                                                ["orig"] = "options_custom_style",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_custom_style_file",
                                                ["orig"] = "options_custom_style_file",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_domain",
                                                ["orig"] = "options_domain",
                                                ["reqd"] = false,
                                                ["type"] = "`$ARRAY`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_security_active_from",
                                                ["orig"] = "options_security_active_from",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_security_active_to",
                                                ["orig"] = "options_security_active_to",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_security_irreversible",
                                                ["orig"] = "options_security_irreversible",
                                                ["reqd"] = false,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner_id",
                                                ["orig"] = "partner_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner_name",
                                                ["orig"] = "partner_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "type",
                                                ["orig"] = "type",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "remove",
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
                            ["active"] = true,
                            ["name"] = "bfid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "client",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "complete_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "direct_partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "err_code",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "err_message",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "ip_address",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "message_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "reference",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "success",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "template_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 12,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "date_from",
                                                ["orig"] = "date_from",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "date_to",
                                                ["orig"] = "date_to",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "message_id",
                                                ["orig"] = "message_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "paging_mode",
                                                ["orig"] = "paging_mode",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "success",
                                                ["orig"] = "success",
                                                ["reqd"] = false,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "transaction_type",
                                                ["orig"] = "transaction_type",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "transaction_type",
                                                ["orig"] = "transaction_type",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "billing_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "client",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "contact",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "direct_partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "email",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "first_name",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "last_name",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "mid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "parent",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "phone",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 13,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "reference",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 14,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "send_welcome_email",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 15,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "user_name",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 16,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "user_role",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$OBJECT`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 17,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "verification_phrase",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 18,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 19,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = false,
                                                ["type"] = "`$OBJECT`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "email",
                                                ["orig"] = "email",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "first_name",
                                                ["orig"] = "first_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "last_name",
                                                ["orig"] = "last_name",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = false,
                                                ["type"] = "`$OBJECT`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "phone",
                                                ["orig"] = "phone",
                                                ["reqd"] = true,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "send_welcome_email",
                                                ["orig"] = "send_welcome_email",
                                                ["reqd"] = true,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "user_role",
                                                ["orig"] = "user_role",
                                                ["reqd"] = true,
                                                ["type"] = "`$OBJECT`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "username",
                                                ["orig"] = "username",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["update"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "update",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "access_mode",
                                                ["orig"] = "access_mode",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "active",
                                                ["orig"] = "active",
                                                ["reqd"] = false,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client_id",
                                                ["orig"] = "client_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client_name",
                                                ["orig"] = "client_name",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "field_template",
                                                ["orig"] = "field_template",
                                                ["reqd"] = false,
                                                ["type"] = "`$ARRAY`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_custom_style",
                                                ["orig"] = "options_custom_style",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_custom_style_file",
                                                ["orig"] = "options_custom_style_file",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_domain",
                                                ["orig"] = "options_domain",
                                                ["reqd"] = false,
                                                ["type"] = "`$ARRAY`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_security_active_from",
                                                ["orig"] = "options_security_active_from",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_security_active_to",
                                                ["orig"] = "options_security_active_to",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "options_security_irreversible",
                                                ["orig"] = "options_security_irreversible",
                                                ["reqd"] = false,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner_id",
                                                ["orig"] = "partner_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner_name",
                                                ["orig"] = "partner_name",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "type",
                                                ["orig"] = "type",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_id",
                                                ["orig"] = "contact_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["reqd"] = false,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "parent_id",
                                                ["orig"] = "parent_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "parent_name",
                                                ["orig"] = "parent_name",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "verification_phrase",
                                                ["orig"] = "verification_phrase",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 1,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = false,
                                                ["type"] = "`$OBJECT`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "email",
                                                ["orig"] = "email",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "first_name",
                                                ["orig"] = "first_name",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["reqd"] = false,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "last_name",
                                                ["orig"] = "last_name",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = false,
                                                ["type"] = "`$OBJECT`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "phone",
                                                ["orig"] = "phone",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "send_welcome_email",
                                                ["orig"] = "send_welcome_email",
                                                ["reqd"] = false,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "username",
                                                ["orig"] = "username",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 2,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "billing_id",
                                                ["orig"] = "billing_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "contact_id",
                                                ["orig"] = "contact_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "direct_partner_id",
                                                ["orig"] = "direct_partner_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "direct_partner_name",
                                                ["orig"] = "direct_partner_name",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "is_active",
                                                ["orig"] = "is_active",
                                                ["reqd"] = false,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "mid",
                                                ["orig"] = "mid",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "name",
                                                ["orig"] = "name",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "version",
                                                ["orig"] = "version",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["index$"] = 3,
                                },
                            },
                            ["key$"] = "update",
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
                            ["active"] = true,
                            ["name"] = "client",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "email",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "first_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "last_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "phone",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "user_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "user_role",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 12,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
