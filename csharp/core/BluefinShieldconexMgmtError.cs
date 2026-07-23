// BluefinShieldconexMgmtError - the SDK error type. Carries the pipeline error code,
// the originating context and cleaned result/spec snapshots.

namespace BluefinShieldconexMgmtSdk;

public class BluefinShieldconexMgmtError : Exception
{
    public bool IsBluefinShieldconexMgmtError = true;
    public string Sdk = "BluefinShieldconexMgmt";
    public string Code;
    public Context? Ctx;
    public object? ResultVal;
    public object? SpecVal;

    public BluefinShieldconexMgmtError(string code, string msg, Context? ctx)
        : base(msg)
    {
        Code = code;
        Ctx = ctx;
    }
}
