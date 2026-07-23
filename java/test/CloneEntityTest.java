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
public class CloneEntityTest {

  @Test
  public void instance() {
    BluefinShieldconexMgmtSDK testsdk = BluefinShieldconexMgmtSDK.testSDK();
    SdkEntity ent = testsdk.clone(null);
    assertNotNull(ent, "expected non-null clone entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = cloneBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "create" }) {
      String reason = RunnerSupport.skipReason("entityOp", "clone." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID JSON to run live");
    BluefinShieldconexMgmtSDK client = setup.client;

    // CREATE
    SdkEntity cloneRef01Ent = client.clone(null);
    Map<String, Object> cloneRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.clone"), "clone_ref01"));
    cloneRef01Data.put("template_id", setup.idmap.get("template01"));

    Object cloneRef01DataResult = cloneRef01Ent.create(cloneRef01Data, null);
    cloneRef01Data = Helpers.toMapAny(cloneRef01DataResult);
    assertNotNull(cloneRef01Data, "expected create result to be a map");
    assertNotNull(cloneRef01Data.get("id"), "expected created entity to have an id");

  }

  static RunnerSupport.EntityTestSetup cloneBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "clone", "CloneTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read clone test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinShieldconexMgmtSDK client = BluefinShieldconexMgmtSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("clone01");
    idnames.add("clone02");
    idnames.add("clone03");
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
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID", idmap);
    envm.put("BLUEFINSHIELDCONEXMGMT_TEST_LIVE", "FALSE");
    envm.put("BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINSHIELDCONEXMGMT_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID"));
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
