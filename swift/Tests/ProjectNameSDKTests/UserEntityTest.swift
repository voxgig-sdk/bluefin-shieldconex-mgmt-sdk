// user entity test (generated from the API model).

import XCTest

@testable import BluefinShieldconexMgmtSdk

final class UserEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinShieldconexMgmtSDK.testSDK(nil, nil)
    let ent = sdk.User()
    XCTAssertEqual(ent.getName(), "user")
  }
}
