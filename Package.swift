// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let sdkName = "KNSDK"
let version = "1.12.21"

let package = Package(
    name: sdkName,
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "KNSDK",
            targets: ["KNSDKBundle"])
    ],
    dependencies: [
        .package(url: "https://github.com/kakaomob/KMLocationSDK.git", exact: Version(stringLiteral: "1.105.9")),
    ],
    targets: getRealmFromNexus(),
    swiftLanguageVersions: [.v5]
)

func getRealmFromNexus() -> [Target] {
    let targets: [Target]  = [
        .binaryTarget(name: sdkName,
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/1.12.21/KNSDK-UI/KNSDK.xcframework.zip",
                      checksum: "5b3e8563626c1a7853e302b88ea1b20cc53ed74439040de8820c550bb4da3807"),
        .target(name: "KNSDKBundle",
                dependencies: [
                    .target(name: sdkName),
                    .product(name: "KMLocationSDK", package: "KMLocationSDK"),
                    .target(name: "KNSDKCore"),
                ],
                resources: [
                    .process("PrivacyInfo.xcprivacy")
                ]
        )
    ]
    
    return targets + [
        .binaryTarget(name: "KNSDKCore",
                        url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/KNSDKCore/1.0.0/KNSDKCore.xcframework.zip",
                        checksum: "6f6d43d72a8ab58c216389b9f00176250d420806539e7d45ed8f3dd29959f522"),
        ]
}
