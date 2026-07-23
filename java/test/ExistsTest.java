package voxgig.bluefinshieldconexmgmtsdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;

import voxgig.bluefinshieldconexmgmtsdk.core.BluefinShieldconexMgmtSDK;

public class ExistsTest {

  @Test
  public void testMode() {
    BluefinShieldconexMgmtSDK testsdk = BluefinShieldconexMgmtSDK.testSDK();
    assertNotNull(testsdk, "expected non-nil SDK");
  }
}
