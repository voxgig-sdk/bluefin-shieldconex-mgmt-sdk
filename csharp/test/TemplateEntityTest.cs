// template entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinShieldconexMgmtSdk.Test;

public class TemplateEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinShieldconexMgmtSDK.TestSDK(null, null);
        var ent = testsdk.Template();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = TemplateBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list", "load", "remove" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "template." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var templateRef01Ent = client.Template();
        var templateRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "template")),
            "template_ref01"));

        var templateRef01DataResult = templateRef01Ent.Create(templateRef01Data, null);
        templateRef01Data = Helpers.ToMapAny(templateRef01DataResult);
        Assert.True(templateRef01Data != null, "expected create result to be a map");
        Assert.True(templateRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var templateRef01Match = new Dictionary<string, object?>();

        var templateRef01ListResult = templateRef01Ent.List(templateRef01Match, null);
        var templateRef01List = templateRef01ListResult as List<object?>;
        Assert.True(templateRef01List != null,
            $"expected list result to be a list, got {templateRef01ListResult?.GetType()}");

        var templateRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(templateRef01List!),
            new Dictionary<string, object?> { ["id"] = templateRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(templateRef01ListFound),
            "expected to find created entity in list");

        // LOAD
        var templateRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = templateRef01Data!["id"],
        };
        var templateRef01DataDt0Loaded = templateRef01Ent.Load(templateRef01MatchDt0, null);
        var templateRef01DataDt0LoadResult = Helpers.ToMapAny(templateRef01DataDt0Loaded);
        Assert.True(templateRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(templateRef01DataDt0LoadResult!["id"], templateRef01Data["id"]),
            "expected load result id to match");

        // REMOVE
        var templateRef01MatchRm0 = new Dictionary<string, object?>
        {
            ["id"] = templateRef01Data!["id"],
        };
        templateRef01Ent.Remove(templateRef01MatchRm0, null);

        // LIST
        var templateRef01MatchRt0 = new Dictionary<string, object?>();

        var templateRef01ListRt0Result = templateRef01Ent.List(templateRef01MatchRt0, null);
        var templateRef01ListRt0 = templateRef01ListRt0Result as List<object?>;
        Assert.True(templateRef01ListRt0 != null,
            $"expected list result to be a list, got {templateRef01ListRt0Result?.GetType()}");

        var templateRef01ListRt0NotFound = StructUtils.Select(
            TestRunner.EntityListToData(templateRef01ListRt0!),
            new Dictionary<string, object?> { ["id"] = templateRef01Data!["id"] });
        Assert.True(StructUtils.IsEmpty(templateRef01ListRt0NotFound),
            "expected removed entity to not be in list");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = TemplateBasicSetup(new Dictionary<string, object?>
        {
            ["feature"] = new Dictionary<string, object?>
            {
                ["streaming"] = new Dictionary<string, object?> { ["active"] = true },
            },
        });
        if (setup.Live)
        {
            return; // unit mode only - streams the seeded fixture data
        }

        var ent = setup.Client.Template();
        var match = new Dictionary<string, object?>();

        // Materialised list result for the same op.
        var listed = ent.List(match, null) as List<object?> ?? new List<object?>();

        // stream("list") yields items via the streaming feature's iterator.
        var streamed = new List<object?>();
        await foreach (var item in ent.Stream("list", match, null))
        {
            streamed.Add(item);
        }
        Assert.True(streamed.Count > 0, "expected stream to yield items");
        Assert.Equal(listed.Count, streamed.Count);

        // Fallback: with streaming inactive, stream still yields the
        // materialised items.
        var setup2 = TemplateBasicSetup(null);
        var ent2 = setup2.Client.Template();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup TemplateBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "template",
            "TemplateTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse template test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinShieldconexMgmtSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "template01", "template02", "template03" },
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
            "BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID"] = idmap,
            ["BLUEFINSHIELDCONEXMGMT_TEST_LIVE"] = "FALSE",
            ["BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINSHIELDCONEXMGMT_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID"])
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
