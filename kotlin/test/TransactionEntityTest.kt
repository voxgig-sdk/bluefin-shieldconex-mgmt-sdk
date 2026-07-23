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
class TransactionEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinShieldconexMgmtSDK.testSDK()
    val ent = testsdk.transaction(null)
    assertNotNull(ent, "expected non-null transaction entity")
  }

  @Test
  fun basic() {
    val setup = transactionBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("list", "load")) {
      val reason = RunnerSupport.skipReason("entityOp", "transaction.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINSHIELDCONEXMGMT_TEST_TRANSACTION_ENTID JSON to run live",
    )
    val client = setup.client

    // Bootstrap entity data from existing test data (no create step in flow).
    val transactionRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.transaction")))
    val transactionRef01Data: MutableMap<String, Any?> = if (transactionRef01DataRaw.isEmpty())
        linkedMapOf() else (Helpers.toMapAny(transactionRef01DataRaw[0][1]) ?: linkedMapOf())

    // LIST
    val transactionRef01Ent = client.transaction(null)
    val transactionRef01Match = linkedMapOf<String, Any?>()

    val transactionRef01ListResult = transactionRef01Ent.list(transactionRef01Match, null)
    assertTrue(transactionRef01ListResult is List<*>,
        "expected list result to be an array, got " + transactionRef01ListResult)

    // LOAD
    val transactionRef01MatchDt0 = linkedMapOf<String, Any?>()
    transactionRef01MatchDt0["id"] = transactionRef01Data["id"]
    val transactionRef01DataDt0Loaded = transactionRef01Ent.load(transactionRef01MatchDt0, null)
    val transactionRef01DataDt0LoadResult = Helpers.toMapAny(transactionRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(transactionRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(transactionRef01Data["id"], transactionRef01DataDt0LoadResult["id"],
        "expected load result id to match")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = transactionBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.transaction(null)
    val match = linkedMapOf<String, Any?>()

    // Materialised list result for the same op.
    val listedResult = ent.list(match, null)
    val listed = (listedResult as? List<Any?>) ?: emptyList<Any?>()

    // stream("list") yields items via the streaming feature's iterator.
    val streamed = ent.stream("list", match, null).toList()
    assertTrue(streamed.size > 0, "expected stream to yield items")
    assertEquals(listed.size, streamed.size, "expected stream to match list count")

    // Fallback: with streaming inactive, stream still yields the materialised
    // items.
    val setup2 = transactionBasicSetup(null)
    val ent2 = setup2.client.transaction(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun transactionBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "transaction", "TransactionTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read transaction test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinShieldconexMgmtSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("transaction01")
      idnames.add("transaction02")
      idnames.add("transaction03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINSHIELDCONEXMGMT_TEST_TRANSACTION_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINSHIELDCONEXMGMT_TEST_TRANSACTION_ENTID"] = idmap
      envm["BLUEFINSHIELDCONEXMGMT_TEST_LIVE"] = "FALSE"
      envm["BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINSHIELDCONEXMGMT_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINSHIELDCONEXMGMT_TEST_TRANSACTION_ENTID"])
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
