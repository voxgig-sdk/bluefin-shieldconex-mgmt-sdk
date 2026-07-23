package voxgig.bluefinshieldconexmgmtsdk.sdktest

import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test

import voxgig.bluefinshieldconexmgmtsdk.core.BluefinShieldconexMgmtSDK

class ExistsTest {

  @Test
  fun testMode() {
    val testsdk = BluefinShieldconexMgmtSDK.testSDK()
    assertNotNull(testsdk, "expected non-nil SDK")
  }
}
