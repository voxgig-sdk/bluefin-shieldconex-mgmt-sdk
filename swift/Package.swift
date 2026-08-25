// swift-tools-version:5.9
//
// BluefinShieldconexMgmt SDK - SwiftPM manifest. The runtime itself is dependency-free
// (Foundation + the vendored Voxgig Struct port under
// Sources/ProjectNameSDK/Struct); declared feature/target deps (if any)
// appear below.
import PackageDescription

let package = Package(
    name: "BluefinShieldconexMgmtSdk",
    products: [
        .library(name: "BluefinShieldconexMgmtSdk", targets: ["BluefinShieldconexMgmtSdk"]),
    ],
    targets: [
        .target(
            name: "BluefinShieldconexMgmtSdk",
            path: "Sources/BluefinShieldconexMgmtSdk"),
        .testTarget(
            name: "BluefinShieldconexMgmtSdkTests",
            dependencies: ["BluefinShieldconexMgmtSdk"],
            path: "Tests/BluefinShieldconexMgmtSdkTests"),
    ]
)
