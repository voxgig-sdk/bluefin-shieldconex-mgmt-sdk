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

public record ClientCreateData
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

public record PartnerCreateData
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

public record TemplateCreateData
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
}

public record TransactionListMatch
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
    public string? billingId { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public string? email { get; init; }
    public string? firstName { get; init; }
    public long? id { get; init; }
    public bool? isActive { get; init; }
    public string? lastName { get; init; }
    public string? mid { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? reference { get; init; }
    public bool? sendWelcomeEmail { get; init; }
    public string? userName { get; init; }
    public Dictionary<string, object?>? userRole { get; init; }
    public string? verificationPhrase { get; init; }
    public long? version { get; init; }
}

public record UpdateResultCreateData
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

public record UpdateResultUpdateData
{
    public string id { get; init; }
    public string? billingId { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public string? email { get; init; }
    public string? firstName { get; init; }
    public bool? isActive { get; init; }
    public string? lastName { get; init; }
    public string? mid { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? reference { get; init; }
    public bool? sendWelcomeEmail { get; init; }
    public string? userName { get; init; }
    public Dictionary<string, object?>? userRole { get; init; }
    public string? verificationPhrase { get; init; }
    public long? version { get; init; }
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

