// Typed reference models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These records are documentation/DX reference shapes ONLY. The SDK ops take
// and return the loose object model (Dictionary<string, object?> / object?) at
// runtime, so these types are not wired into the op signatures — use them to
// describe a payload before converting it to a dictionary. Optional (req:false)
// keys are modelled as nullable properties.

namespace BluefinShieldconexMgmtSdk.Types;

public record Client
{
    public string? billing_id { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string? mid { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public long? version { get; init; }
}

public record ClientLoadMatch
{
    public string id { get; init; }
}

public record ClientListMatch
{
    public string? billing_id { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string? mid { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public long? version { get; init; }
}

public record ClientCreateData
{
    public string? billing_id { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string? mid { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public long? version { get; init; }
}

public record ClientRemoveMatch
{
    public string id { get; init; }
}

public record Clone
{
    public long? id { get; init; }
    public string? name { get; init; }
}

public record CloneCreateData
{
    public string template_id { get; init; }
}

public record Partner
{
    public string? billing_id { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public string? reference { get; init; }
    public string? verification_phrase { get; init; }
    public long? version { get; init; }
}

public record PartnerLoadMatch
{
    public string id { get; init; }
}

public record PartnerListMatch
{
    public string? billing_id { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public string? reference { get; init; }
    public string? verification_phrase { get; init; }
    public long? version { get; init; }
}

public record PartnerCreateData
{
    public string? billing_id { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public string? reference { get; init; }
    public string? verification_phrase { get; init; }
    public long? version { get; init; }
}

public record Template
{
    public object? access_mode { get; init; }
    public bool? active { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public List<object?>? field_template { get; init; }
    public long? id { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? option { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? reference { get; init; }
    public string? type { get; init; }
    public long? version { get; init; }
}

public record TemplateLoadMatch
{
    public string id { get; init; }
}

public record TemplateListMatch
{
    public object? access_mode { get; init; }
    public bool? active { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public List<object?>? field_template { get; init; }
    public long? id { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? option { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? reference { get; init; }
    public string? type { get; init; }
    public long? version { get; init; }
}

public record TemplateCreateData
{
    public object? access_mode { get; init; }
    public bool? active { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public List<object?>? field_template { get; init; }
    public long? id { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? option { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? reference { get; init; }
    public string? type { get; init; }
    public long? version { get; init; }
}

public record TemplateRemoveMatch
{
    public string id { get; init; }
}

public record Transaction
{
    public string? bfid { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? complete_date { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public string? err_code { get; init; }
    public string? err_message { get; init; }
    public long? id { get; init; }
    public string? ip_address { get; init; }
    public string? message_id { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? reference { get; init; }
    public bool? success { get; init; }
    public string? template_id { get; init; }
}

public record TransactionLoadMatch
{
    public string id { get; init; }
}

public record TransactionListMatch
{
    public string? bfid { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? complete_date { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public string? err_code { get; init; }
    public string? err_message { get; init; }
    public long? id { get; init; }
    public string? ip_address { get; init; }
    public string? message_id { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? reference { get; init; }
    public bool? success { get; init; }
    public string? template_id { get; init; }
}

public record UpdateResult
{
    public string? billing_id { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public Dictionary<string, object?> contact { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public string email { get; init; }
    public string first_name { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string last_name { get; init; }
    public string? mid { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string phone { get; init; }
    public string? reference { get; init; }
    public bool? send_welcome_email { get; init; }
    public string user_name { get; init; }
    public Dictionary<string, object?> user_role { get; init; }
    public string? verification_phrase { get; init; }
    public long? version { get; init; }
}

public record UpdateResultListMatch
{
    public string? billing_id { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public string? email { get; init; }
    public string? first_name { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string? last_name { get; init; }
    public string? mid { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? reference { get; init; }
    public bool? send_welcome_email { get; init; }
    public string? user_name { get; init; }
    public Dictionary<string, object?>? user_role { get; init; }
    public string? verification_phrase { get; init; }
    public long? version { get; init; }
}

public record UpdateResultCreateData
{
    public string? billing_id { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public Dictionary<string, object?> contact { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public string email { get; init; }
    public string first_name { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string last_name { get; init; }
    public string? mid { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string phone { get; init; }
    public string? reference { get; init; }
    public bool? send_welcome_email { get; init; }
    public string user_name { get; init; }
    public Dictionary<string, object?> user_role { get; init; }
    public string? verification_phrase { get; init; }
    public long? version { get; init; }
}

public record UpdateResultUpdateData
{
    public string id { get; init; }
}

public record User
{
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public string? email { get; init; }
    public string? first_name { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string? last_name { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? user_name { get; init; }
    public Dictionary<string, object?>? user_role { get; init; }
    public long? version { get; init; }
}

public record UserLoadMatch
{
    public string id { get; init; }
}

