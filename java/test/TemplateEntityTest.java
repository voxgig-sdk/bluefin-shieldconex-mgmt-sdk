package voxgig.bluefinshieldconexmgmtsdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Assumptions;
import org.junit.jupiter.api.Test;

import voxgig.bluefinshieldconexmgmtsdk.core.Helpers;
import voxgig.bluefinshieldconexmgmtsdk.core.SdkEntity;
import voxgig.bluefinshieldconexmgmtsdk.core.BluefinShieldconexMgmtSDK;
import voxgig.bluefinshieldconexmgmtsdk.utility.Json;
import voxgig.bluefinshieldconexmgmtsdk.utility.struct.Struct;

@SuppressWarnings({"unchecked", "unused"})
public class TemplateEntityTest {

  @Test
  public void instance() {
    BluefinShieldconexMgmtSDK testsdk = BluefinShieldconexMgmtSDK.testSDK();
    SdkEntity ent = testsdk.template(null);
    assertNotNull(ent, "expected non-null template entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = templateBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "create", "list", "load", "remove" }) {
      String reason = RunnerSupport.skipReason("entityOp", "template." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID JSON to run live");
    BluefinShieldconexMgmtSDK client = setup.client;

    // CREATE
    SdkEntity templateRef01Ent = client.template(null);
    Map<String, Object> templateRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.template"), "template_ref01"));

    Object templateRef01DataResult = templateRef01Ent.create(templateRef01Data, null);
    templateRef01Data = Helpers.toMapAny(templateRef01DataResult);
    assertNotNull(templateRef01Data, "expected create result to be a map");
    assertNotNull(templateRef01Data.get("id"), "expected created entity to have an id");

    // LIST
    Map<String, Object> templateRef01Match = new LinkedHashMap<>();

    Object templateRef01ListResult = templateRef01Ent.list(templateRef01Match, null);
    assertTrue(templateRef01ListResult instanceof List,
        "expected list result to be an array, got " + templateRef01ListResult);
    List<Object> templateRef01List = (List<Object>) templateRef01ListResult;

    List<Object> foundItem = Struct.select(
        RunnerSupport.entityListToData(templateRef01List),
        Struct.jm("id", templateRef01Data.get("id")));
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list");

    // LOAD
    Map<String, Object> templateRef01MatchDt0 = new LinkedHashMap<>();
    templateRef01MatchDt0.put("id", templateRef01Data.get("id"));
    Object templateRef01DataDt0Loaded = templateRef01Ent.load(templateRef01MatchDt0, null);
    Map<String, Object> templateRef01DataDt0LoadResult = Helpers.toMapAny(templateRef01DataDt0Loaded);
    assertNotNull(templateRef01DataDt0LoadResult, "expected load result to be a map");
    assertEquals(templateRef01Data.get("id"), templateRef01DataDt0LoadResult.get("id"),
        "expected load result id to match");

    // REMOVE
    Map<String, Object> templateRef01MatchRm0 = new LinkedHashMap<>();
    templateRef01MatchRm0.put("id", templateRef01Data.get("id"));
    templateRef01Ent.remove(templateRef01MatchRm0, null);

    // LIST
    Map<String, Object> templateRef01MatchRt0 = new LinkedHashMap<>();

    Object templateRef01ListRt0Result = templateRef01Ent.list(templateRef01MatchRt0, null);
    assertTrue(templateRef01ListRt0Result instanceof List,
        "expected list result to be an array, got " + templateRef01ListRt0Result);
    List<Object> templateRef01ListRt0 = (List<Object>) templateRef01ListRt0Result;

    List<Object> notFoundItem = Struct.select(
        RunnerSupport.entityListToData(templateRef01ListRt0),
        Struct.jm("id", templateRef01Data.get("id")));
    assertTrue(Struct.isempty(notFoundItem), "expected removed entity to not be in list");

  }

  @Test
  public void stream() {
    Map<String, Object> streamingActive = new LinkedHashMap<>();
    Map<String, Object> streamingOpts = new LinkedHashMap<>();
    streamingOpts.put("active", true);
    Map<String, Object> featureOpts = new LinkedHashMap<>();
    featureOpts.put("streaming", streamingOpts);
    streamingActive.put("feature", featureOpts);

    RunnerSupport.EntityTestSetup setup = templateBasicSetup(streamingActive);
    Assumptions.assumeFalse(setup.live,
        "stream test streams the seeded fixture data (unit mode only)");

    SdkEntity ent = setup.client.template(null);
    Map<String, Object> match = new LinkedHashMap<>();

    // Materialised list result for the same op.
    Object listedResult = ent.list(match, null);
    List<Object> listed = listedResult instanceof List
        ? (List<Object>) listedResult : new ArrayList<>();

    // stream("list") yields items via the streaming feature's iterator.
    List<Object> streamed = ent.stream("list", match, null)
        .collect(Collectors.toList());
    assertTrue(streamed.size() > 0, "expected stream to yield items");
    assertEquals(listed.size(), streamed.size(),
        "expected stream to yield the same item count as list");

    // Fallback: with streaming inactive, stream still yields the
    // materialised items.
    RunnerSupport.EntityTestSetup setup2 = templateBasicSetup(null);
    SdkEntity ent2 = setup2.client.template(null);
    List<Object> streamed2 = ent2.stream("list", match, null)
        .collect(Collectors.toList());
    assertEquals(listed.size(), streamed2.size(),
        "expected fallback stream to yield the materialised items");
  }

  static RunnerSupport.EntityTestSetup templateBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "template", "TemplateTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read template test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinShieldconexMgmtSDK client = BluefinShieldconexMgmtSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("template01");
    idnames.add("template02");
    idnames.add("template03");
    Object idmap = Struct.transform(idnames, Json.parse(
        "{\"`$PACK`\": [\"\", {"
        + "\"`$KEY`\": \"`$COPY`\","
        + "\"`$VAL`\": [\"`$FORMAT`\", \"upper\", \"`$COPY`\"]"
        + "}]}"));

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's. Surface this so the test
    // can skip.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID", idmap);
    envm.put("BLUEFINSHIELDCONEXMGMT_TEST_LIVE", "FALSE");
    envm.put("BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINSHIELDCONEXMGMT_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID"));
    if (idmapResolved == null) {
      idmapResolved = Helpers.toMapAny(idmap);
    }

    boolean live = "TRUE".equals(env.get("BLUEFINSHIELDCONEXMGMT_TEST_LIVE"));
    if (live) {
      Map<String, Object> liveOpts = new LinkedHashMap<>();
      liveOpts.put("apikey", env.get("BLUEFINSHIELDCONEXMGMT_APIKEY"));
      Object mergedOpts = Struct.merge(Struct.jt(liveOpts, extra));
      client = new BluefinShieldconexMgmtSDK(Helpers.toMapAny(mergedOpts));
    }

    RunnerSupport.EntityTestSetup setup = new RunnerSupport.EntityTestSetup();
    setup.client = client;
    setup.data = entityData;
    setup.idmap = idmapResolved;
    setup.env = env;
    setup.explain = "TRUE".equals(env.get("BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN"));
    setup.live = live;
    setup.syntheticOnly = live && !idmapOverridden;
    setup.now = System.currentTimeMillis();
    return setup;
  }
}
