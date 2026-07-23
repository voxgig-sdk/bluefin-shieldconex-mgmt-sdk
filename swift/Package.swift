// swift-tools-version:5.9
//
// BluefinShieldconexMgmt SDK - SwiftPM manifest. Zero runtime dependencies (Foundation +
// the vendored Voxgig Struct port under Sources/ProjectNameSDK/Struct).
import PackageDescription

let package = Package(
    name: "BluefinShieldconexMgmtSdk",
    products: [
        .library(name: "BluefinShieldconexMgmtSdk", targets: ["BluefinShieldconexMgmtSdk"]),
    ],
    targets: [
        .target(
            name: "BluefinShieldconexMgmtSdk",
            path: "Sources/ProjectNameSDK"),
        .testTarget(
            name: "BluefinShieldconexMgmtSdkTests",
            dependencies: ["BluefinShieldconexMgmtSdk"],
            path: "Tests/ProjectNameSDKTests"),
    ]
)
