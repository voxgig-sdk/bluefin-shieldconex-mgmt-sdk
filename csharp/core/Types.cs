// BluefinShieldconexMgmt SDK - core contracts.

namespace BluefinShieldconexMgmtSdk;

// The minimal entity contract the pipeline depends on (list-wrapping in
// MakeResult, feature hooks). Concrete entity classes derive from
// BluefinShieldconexMgmtEntityBase which implements this.
public interface IEntity
{
    string GetName();
    IEntity Make();
    object? Data(object? data = null);
    object? Match(object? match = null);
}

// Transport function: performs the HTTP (or mock) request. Returns a
// transport-shaped response map:
//   { status, statusText, headers, json: Func<object?>, body }
// Throws (typically BluefinShieldconexMgmtError) on transport-level failure - the C#
// twin of go's (any, error) return.
public delegate object? FetcherFunc(Context ctx, string fullurl, Dictionary<string, object?> fetchdef);
