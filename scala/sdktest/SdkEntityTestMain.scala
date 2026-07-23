// Aggregating entry point for the generated per-entity SDK tests. Drives
// every <Entity>EntityTest / <Entity>DirectTest object through one shared
// SdkTestReport and exits non-zero on any failure.
// Run: scala-cli run . --main-class SdkEntityTestMain

object SdkEntityTestMain {

  def main(args: Array[String]): Unit = {
    val rep = new SdkTestReport()

    ClientEntityTest.run(rep)
    ClientDirectTest.run(rep)
    CloneEntityTest.run(rep)
    PartnerEntityTest.run(rep)
    PartnerDirectTest.run(rep)
    TemplateEntityTest.run(rep)
    TemplateDirectTest.run(rep)
    TransactionEntityTest.run(rep)
    TransactionDirectTest.run(rep)
    UpdateResultEntityTest.run(rep)
    UpdateResultDirectTest.run(rep)
    UserEntityTest.run(rep)
    UserDirectTest.run(rep)

    ReadmeExamplesTest.run(rep)

    rep.finish("ENTITY")
  }
}
