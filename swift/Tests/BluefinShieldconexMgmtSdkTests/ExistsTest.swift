// BluefinShieldconexMgmt SDK exists test.

import XCTest

@testable import BluefinShieldconexMgmtSdk

final class ExistsTest: XCTestCase {
  func testMode() {
    let testsdk = BluefinShieldconexMgmtSDK.testSDK(nil, nil)
    XCTAssertEqual(testsdk.mode, "test")
  }
}
