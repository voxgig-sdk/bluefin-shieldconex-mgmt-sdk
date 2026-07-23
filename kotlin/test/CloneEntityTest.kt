package voxgig.bluefinshieldconexmgmtsdk.sdktest

import java.nio.file.Files
import java.nio.file.Paths

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions
import org.junit.jupiter.api.Test

import voxgig.bluefinshieldconexmgmtsdk.core.Helpers
import voxgig.bluefinshieldconexmgmtsdk.core.SdkEntity
import voxgig.bluefinshieldconexmgmtsdk.core.BluefinShieldconexMgmtSDK
import voxgig.bluefinshieldconexmgmtsdk.utility.Json
import voxgig.bluefinshieldconexmgmtsdk.utility.struct.Struct

@Suppress("UNCHECKED_CAST", "UNUSED_VARIABLE", "UNUSED_VALUE")
class CloneEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinShieldconexMgmtSDK.testSDK()
    val ent = testsdk.clone(null)
    assertNotNull(ent, "expected non-null clone entity")
  }

  @Test
  fun basic() {
    val setup = cloneBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("create")) {
      val reason = RunnerSupport.skipReason("entityOp", "clone.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val cloneRef01Ent = client.clone(null)
    var cloneRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.clone"), "clone_ref01")) ?: linkedMapOf())
    cloneRef01Data["template_id"] = setup.idmap!!["template01"]

    val cloneRef01DataResult = cloneRef01Ent.create(cloneRef01Data, null)
    cloneRef01Data = Helpers.toMapAny(cloneRef01DataResult) ?: linkedMapOf()
    assertNotNull(cloneRef01Data, "expected create result to be a map")
    assertNotNull(cloneRef01Data["id"], "expected created entity to have an id")

  }

  companion object {
    fun cloneBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "clone", "CloneTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read clone test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinShieldconexMgmtSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("clone01")
      idnames.add("clone02")
      idnames.add("clone03")
      idnames.add("template01")
      idnames.add("template02")
      idnames.add("template03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID"] = idmap
      envm["BLUEFINSHIELDCONEXMGMT_TEST_LIVE"] = "FALSE"
      envm["BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINSHIELDCONEXMGMT_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID"])
      if (idmapResolved == null) {
        idmapResolved = Helpers.toMapAny(idmap) ?: linkedMapOf()
      }

      val live = "TRUE" == env["BLUEFINSHIELDCONEXMGMT_TEST_LIVE"]
      if (live) {
        val liveOpts = linkedMapOf<String, Any?>()
        liveOpts["apikey"] = env["BLUEFINSHIELDCONEXMGMT_APIKEY"]
        val mergedOpts = Struct.merge(Struct.jt(liveOpts, extra))
        client = BluefinShieldconexMgmtSDK(Helpers.toMapAny(mergedOpts))
      }

      val setup = RunnerSupport.EntityTestSetup()
      setup.client = client
      setup.data = entityData
      setup.idmap = idmapResolved
      setup.env = env
      setup.explain = "TRUE" == env["BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN"]
      setup.live = live
      setup.syntheticOnly = live && !idmapOverridden
      setup.now = System.currentTimeMillis()
      return setup
    }
  }
}
