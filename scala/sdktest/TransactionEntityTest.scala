// Generated basic-flow test for the transaction entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped TransactionTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinshieldconexmgmtsdk.core.{Helpers, BluefinShieldconexMgmtSDK}
import voxgig.bluefinshieldconexmgmtsdk.utility.struct.Struct

object TransactionEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("transaction.instance") {
      val testsdk = BluefinShieldconexMgmtSDK.testSDK()
      val ent = testsdk.transaction(null)
      rep.check("transaction.instance", ent != null, "expected non-null transaction entity")
    }

    rep.scope("transaction.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/transaction/TransactionTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinShieldconexMgmtSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("transaction01", "TRANSACTION01")
      idmap.put("transaction02", "TRANSACTION02")
      idmap.put("transaction03", "TRANSACTION03")
      val now = System.currentTimeMillis()

      // LIST
      val transactionRef01Ent = client.transaction(null)
      val transactionRef01Match = new LinkedHashMap[String, Object]()
      val transactionRef01ListResult = transactionRef01Ent.list(transactionRef01Match, null)
      rep.check("transaction.list.islist", transactionRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + transactionRef01ListResult)

      // LOAD
      val transactionRef01MatchDt0 = new LinkedHashMap[String, Object]()
      transactionRef01MatchDt0.put("id", transactionRef01Data.get("id"))
      val transactionRef01DataDt0Loaded = transactionRef01Ent.load(transactionRef01MatchDt0, null)
      val transactionRef01DataDt0LoadResult = Helpers.toMapAny(transactionRef01DataDt0Loaded)
      rep.check("transaction.load.map", transactionRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("transaction.load.id", transactionRef01Data.get("id"), transactionRef01DataDt0LoadResult.get("id"))
    }
  }
}
