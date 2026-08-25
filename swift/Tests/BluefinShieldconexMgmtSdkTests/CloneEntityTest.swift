// clone entity test (generated from the API model).

import XCTest

@testable import BluefinShieldconexMgmtSdk

final class CloneEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinShieldconexMgmtSDK.testSDK(nil, nil)
    let ent = sdk.Clone()
    XCTAssertEqual(ent.getName(), "clone")
  }
}
