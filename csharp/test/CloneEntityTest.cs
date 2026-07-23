// clone entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinShieldconexMgmtSdk.Test;

public class CloneEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinShieldconexMgmtSDK.TestSDK(null, null);
        var ent = testsdk.Clone();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = CloneBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "clone." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var cloneRef01Ent = client.Clone();
        var cloneRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "clone")),
            "clone_ref01"));
        cloneRef01Data!["template_id"] = setup.Idmap["template01"];

        var cloneRef01DataResult = cloneRef01Ent.Create(cloneRef01Data, null);
        cloneRef01Data = Helpers.ToMapAny(cloneRef01DataResult);
        Assert.True(cloneRef01Data != null, "expected create result to be a map");
        Assert.True(cloneRef01Data!["id"] != null, "expected created entity to have an id");

    }

    private static EntityTestSetup CloneBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "clone",
            "CloneTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse clone test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinShieldconexMgmtSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "clone01", "clone02", "clone03", "template01", "template02", "template03" },
            new Dictionary<string, object?>
            {
                ["`$PACK`"] = new List<object?>
                {
                    "",
                    new Dictionary<string, object?>
                    {
                        ["`$KEY`"] = "`$COPY`",
                        ["`$VAL`"] = new List<object?> { "`$FORMAT`", "upper", "`$COPY`" },
                    },
                },
            });

        // Detect ENTID env override before EnvOverride consumes it. When
        // live mode is on without a real override, the basic test runs
        // against synthetic IDs from the fixture and 4xx's.
        var entidEnvRaw = Environment.GetEnvironmentVariable(
            "BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID"] = idmap,
            ["BLUEFINSHIELDCONEXMGMT_TEST_LIVE"] = "FALSE",
            ["BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINSHIELDCONEXMGMT_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID"])
            ?? Helpers.ToMapAny(idmap)
            ?? new Dictionary<string, object?>();

        if (Equals(env["BLUEFINSHIELDCONEXMGMT_TEST_LIVE"], "TRUE"))
        {
            var mergedOpts = StructUtils.Merge(new List<object?>
            {
                new Dictionary<string, object?>
                {
                    ["apikey"] = env["BLUEFINSHIELDCONEXMGMT_APIKEY"],
                },
                extra,
            });
            client = new BluefinShieldconexMgmtSDK(Helpers.ToMapAny(mergedOpts));
        }

        var live = Equals(env["BLUEFINSHIELDCONEXMGMT_TEST_LIVE"], "TRUE");
        return new EntityTestSetup
        {
            Client = client,
            Data = entityData,
            Idmap = idmapResolved,
            Env = env,
            Explain = Equals(env["BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN"], "TRUE"),
            Live = live,
            SyntheticOnly = live && !idmapOverridden,
            Now = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds(),
        };
    }
}
