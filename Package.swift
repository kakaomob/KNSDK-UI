// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let sdkName = "KNSDK"
let version = "1.6.7"

let package = Package(
    name: sdkName,
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "KNSDK",
            targets: ["KNSDKBundle"])
    ],
    dependencies: [
        .package(url: "https://github.com/kakaomob/KMLocationSDK.git", exact: Version(stringLiteral: "1.2.23")),
    ],
    targets: [
        .binaryTarget(name: sdkName,
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/\(version)/KNSDK-UI/KNSDK.xcframework.zip",
                      checksum: "47c25f0153ad7d5af496315ed079da6223276a55b2777f4c37bd898662c25240"),
        .target(name: "KNSDKBundle",
                dependencies: [
                    .target(name: sdkName),
                    .product(name: "LocationFramework", package: "KMLocationSDK")
                ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
