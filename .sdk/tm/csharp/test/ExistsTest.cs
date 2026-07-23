// BluefinShieldconexMgmt SDK exists test.

using Xunit;

using BluefinShieldconexMgmtSdk;

namespace BluefinShieldconexMgmtSdk.Test;

public class ExistsTest
{
    [Fact]
    public void TestMode()
    {
        var testsdk = BluefinShieldconexMgmtSDK.TestSDK(null, null);
        Assert.NotNull(testsdk);
    }
}
