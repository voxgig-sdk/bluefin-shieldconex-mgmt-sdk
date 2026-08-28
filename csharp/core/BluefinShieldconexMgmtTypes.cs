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
    public string? billingId { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public long? id { get; init; }
    public bool? isActive { get; init; }
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
    public string partner { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record ClientCreateData
{
    public string? billing_id { get; init; }
    public string contact_email { get; init; }
    public string contact_first_name { get; init; }
    public bool contact_is_active { get; init; }
    public string contact_last_name { get; init; }
    public string contact_phone { get; init; }
    public bool contact_send_welcome_email { get; init; }
    public string contact_user_name { get; init; }
    public string contact_user_role { get; init; }
    public long direct_partner_id { get; init; }
    public string direct_partner_name { get; init; }
    public bool is_active { get; init; }
    public string? mid { get; init; }
    public string name { get; init; }
    public string? billingId { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public long? id { get; init; }
    public bool? isActive { get; init; }
    public string? modified { get; init; }
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
    public long? id { get; init; }
    public string? name { get; init; }
}

public record Partner
{
    public string? billingId { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public long? id { get; init; }
    public bool? isActive { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public string? reference { get; init; }
    public string? verificationPhrase { get; init; }
    public long? version { get; init; }
}

public record PartnerLoadMatch
{
    public string id { get; init; }
}

public record PartnerListMatch
{
    public string? partner { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record PartnerCreateData
{
    public string billing_id { get; init; }
    public string contact_email { get; init; }
    public string contact_first_name { get; init; }
    public bool contact_is_active { get; init; }
    public string contact_last_name { get; init; }
    public string contact_phone { get; init; }
    public bool contact_send_welcome_email { get; init; }
    public string contact_user_name { get; init; }
    public string contact_user_role { get; init; }
    public bool is_active { get; init; }
    public string name { get; init; }
    public long? parent_id { get; init; }
    public string? parent_name { get; init; }
    public string reference { get; init; }
    public string? verification_phrase { get; init; }
    public string? billingId { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public long? id { get; init; }
    public bool? isActive { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public string? verificationPhrase { get; init; }
    public long? version { get; init; }
}

public record Template
{
    public object? accessMode { get; init; }
    public bool? active { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public List<object?>? fieldTemplates { get; init; }
    public long? id { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? options { get; init; }
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
    public string? client { get; init; }
    public string? partner { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record TemplateCreateData
{
    public string? access_mode { get; init; }
    public bool active { get; init; }
    public long client_id { get; init; }
    public string client_name { get; init; }
    public List<object?>? field_template { get; init; }
    public string name { get; init; }
    public string? options_custom_style { get; init; }
    public string? options_custom_style_file { get; init; }
    public List<object?>? options_domain { get; init; }
    public string? options_security_active_from { get; init; }
    public string? options_security_active_to { get; init; }
    public bool? options_security_irreversible { get; init; }
    public long partner_id { get; init; }
    public string partner_name { get; init; }
    public string reference { get; init; }
    public string? type { get; init; }
    public long? version { get; init; }
    public object? accessMode { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public List<object?>? fieldTemplates { get; init; }
    public long? id { get; init; }
    public Dictionary<string, object?>? options { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
}

public record TemplateRemoveMatch
{
    public string id { get; init; }
}

public record Transaction
{
    public string? bfid { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? completeDate { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public string? errCode { get; init; }
    public string? errMessage { get; init; }
    public long? id { get; init; }
    public string? ipAddress { get; init; }
    public string? messageId { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? reference { get; init; }
    public bool? success { get; init; }
    public string? templateId { get; init; }
}

public record TransactionLoadMatch
{
    public string id { get; init; }
    public string? transaction_type { get; init; }
}

public record TransactionListMatch
{
    public string? client { get; init; }
    public string? date_from { get; init; }
    public string? date_to { get; init; }
    public string? message_id { get; init; }
    public string? paging_mode { get; init; }
    public string? partner { get; init; }
    public string? reference { get; init; }
    public long? skip { get; init; }
    public bool? success { get; init; }
    public long? take { get; init; }
    public string? transaction_type { get; init; }
}

public record UpdateResult
{
    public string? billingId { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public Dictionary<string, object?> contact { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public string email { get; init; }
    public string firstName { get; init; }
    public long? id { get; init; }
    public bool? isActive { get; init; }
    public string lastName { get; init; }
    public string? mid { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string phone { get; init; }
    public string? reference { get; init; }
    public bool? sendWelcomeEmail { get; init; }
    public string userName { get; init; }
    public Dictionary<string, object?> userRole { get; init; }
    public string? verificationPhrase { get; init; }
    public long? version { get; init; }
}

public record UpdateResultListMatch
{
    public string? client { get; init; }
    public string? partner { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record UpdateResultCreateData
{
    public Dictionary<string, object?>? client { get; init; }
    public string email { get; init; }
    public string first_name { get; init; }
    public bool is_active { get; init; }
    public string last_name { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public long phone { get; init; }
    public bool send_welcome_email { get; init; }
    public Dictionary<string, object?> user_role { get; init; }
    public string username { get; init; }
    public string? billingId { get; init; }
    public Dictionary<string, object?> contact { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public string firstName { get; init; }
    public long? id { get; init; }
    public bool? isActive { get; init; }
    public string lastName { get; init; }
    public string? mid { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public string? reference { get; init; }
    public bool? sendWelcomeEmail { get; init; }
    public string userName { get; init; }
    public Dictionary<string, object?> userRole { get; init; }
    public string? verificationPhrase { get; init; }
    public long? version { get; init; }
}

public record UpdateResultUpdateData
{
    public string id { get; init; }
    public string? access_mode { get; init; }
    public bool? active { get; init; }
    public long? client_id { get; init; }
    public string? client_name { get; init; }
    public List<object?>? field_template { get; init; }
    public string? name { get; init; }
    public string? options_custom_style { get; init; }
    public string? options_custom_style_file { get; init; }
    public List<object?>? options_domain { get; init; }
    public string? options_security_active_from { get; init; }
    public string? options_security_active_to { get; init; }
    public bool? options_security_irreversible { get; init; }
    public long? partner_id { get; init; }
    public string? partner_name { get; init; }
    public string? reference { get; init; }
    public string? type { get; init; }
    public long? version { get; init; }
    public string? billing_id { get; init; }
    public long? contact_id { get; init; }
    public bool? is_active { get; init; }
    public long? parent_id { get; init; }
    public string? parent_name { get; init; }
    public string? verification_phrase { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? email { get; init; }
    public string? first_name { get; init; }
    public string? last_name { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public long? phone { get; init; }
    public bool? send_welcome_email { get; init; }
    public string? username { get; init; }
    public long? direct_partner_id { get; init; }
    public string? direct_partner_name { get; init; }
    public string? mid { get; init; }
    public string? billingId { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public string? firstName { get; init; }
    public bool? isActive { get; init; }
    public string? lastName { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public bool? sendWelcomeEmail { get; init; }
    public string? userName { get; init; }
    public Dictionary<string, object?>? userRole { get; init; }
    public string? verificationPhrase { get; init; }
}

public record User
{
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public string? email { get; init; }
    public string? firstName { get; init; }
    public long? id { get; init; }
    public bool? isActive { get; init; }
    public string? lastName { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? userName { get; init; }
    public Dictionary<string, object?>? userRole { get; init; }
    public long? version { get; init; }
}

public record UserLoadMatch
{
    public string id { get; init; }
}

