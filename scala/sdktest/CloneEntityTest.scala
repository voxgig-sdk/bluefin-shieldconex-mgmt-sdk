// Generated basic-flow test for the clone entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped CloneTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinshieldconexmgmtsdk.core.{Helpers, BluefinShieldconexMgmtSDK}
import voxgig.bluefinshieldconexmgmtsdk.utility.struct.Struct

object CloneEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("clone.instance") {
      val testsdk = BluefinShieldconexMgmtSDK.testSDK()
      val ent = testsdk.clone(null)
      rep.check("clone.instance", ent != null, "expected non-null clone entity")
    }

    rep.scope("clone.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/clone/CloneTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinShieldconexMgmtSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("clone01", "CLONE01")
      idmap.put("clone02", "CLONE02")
      idmap.put("clone03", "CLONE03")
      idmap.put("template01", "TEMPLATE01")
      idmap.put("template02", "TEMPLATE02")
      idmap.put("template03", "TEMPLATE03")
      val now = System.currentTimeMillis()

      // CREATE
      val cloneRef01Ent = client.clone(null)
      var cloneRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.clone"), "clone_ref01"))
      cloneRef01Data.put("template_id", idmap.get("template01"))
      val cloneRef01DataResult = cloneRef01Ent.create(cloneRef01Data, null)
      cloneRef01Data = Helpers.toMapAny(cloneRef01DataResult)
      rep.check("clone.create.map", cloneRef01Data != null, "expected create result to be a map")
      rep.check("clone.create.id", cloneRef01Data != null && cloneRef01Data.get("id") != null, "expected created entity to have an id")
    }
  }
}
