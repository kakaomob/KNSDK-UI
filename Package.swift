// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let sdkName = "KNSDK"
let version = "1.12.12"

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
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/1.12.12/KNSDK-UI/KNSDK.xcframework.zip",
                      checksum: "a85989c20a7a9962f7b2b10ce090f2ed19beafbeff1f1d66cf5128342f1cc844"),
        .target(name: "KNSDKBundle",
                dependencies: [
                    .target(name: sdkName),
                    .product(name: "KMLocationSDK", package: "KMLocationSDK"),
                    .target(name: "Realm"),
                    .target(name: "RealmSwift"),
                    .target(name: "KNSDKCore"),
                ],
                resources: [
                    .process("PrivacyInfo.xcprivacy")
                ]
        )
    ]

    #if compiler(>=6.1.2)
    // 16.4
    return targets + [
        .binaryTarget(name: "Realm",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.5/Realm/Realm.xcframework.zip",
                      checksum: "3c919a3283aa50c91bc6163117e76f3c1c136c0e1a1852bd079330be45275be1"),
        .binaryTarget(name: "RealmSwift",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.5/16.4/RealmSwift.xcframework.zip",
                      checksum: "7bc9e9ee16a457c49c4f772ceafd4435a73fc15799eb67311d2eb5bcdc2518c3"),
        .binaryTarget(name: "KNSDKCore",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/KNSDKCore/1.0.0/KNSDKCore.xcframework.zip",
                      checksum: "6f6d43d72a8ab58c216389b9f00176250d420806539e7d45ed8f3dd29959f522"),
        ]
    
    #elseif compiler(>=6.1.0)
    // 16.3
    return targets + [
        .binaryTarget(name: "Realm",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.5/Realm/Realm.xcframework.zip",
                      checksum: "3c919a3283aa50c91bc6163117e76f3c1c136c0e1a1852bd079330be45275be1"),
        .binaryTarget(name: "RealmSwift",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.5/16.3/RealmSwift.xcframework.zip",
                      checksum: "5726c1e2e33d3dd0ce4583424517fb5feb73b43b3d4b9cc6c2d258e6ce3f2f50"),
        .binaryTarget(name: "KNSDKCore",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/KNSDKCore/1.0.0/KNSDKCore.xcframework.zip",
                      checksum: "6f6d43d72a8ab58c216389b9f00176250d420806539e7d45ed8f3dd29959f522"),
        ]
    #elseif compiler(>=6.0.3)
    // 16.2
        return targets + [
        .binaryTarget(name: "Realm",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.5/Realm/Realm.xcframework.zip",
                      checksum: "3c919a3283aa50c91bc6163117e76f3c1c136c0e1a1852bd079330be45275be1"),
        .binaryTarget(name: "RealmSwift",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.5/16.2/RealmSwift.xcframework.zip",
                      checksum: "2d03d25c8b52914a3c3bbc64184b66b8ce3d93f7a7c4b0ef0af300805827ce61"),
        .binaryTarget(name: "KNSDKCore",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/KNSDKCore/1.0.0/KNSDKCore.xcframework.zip",
                      checksum: "6f6d43d72a8ab58c216389b9f00176250d420806539e7d45ed8f3dd29959f522"),
            ]
    #elseif compiler(>=5.10.0)
    // 15.4
    return targets + [
        .binaryTarget(name: "Realm",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.5/Realm/Realm.xcframework.zip",
                      checksum: "3c919a3283aa50c91bc6163117e76f3c1c136c0e1a1852bd079330be45275be1"),
        .binaryTarget(name: "RealmSwift",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.5/15.4/RealmSwift.xcframework.zip",
                      checksum: "a06b55cfd4b08cd82fae28b5cebc628baf1a1d238bd9a1c2c308e52a5b1587bc"),
        .binaryTarget(name: "KNSDKCore",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/KNSDKCore/1.0.0/KNSDKCore.xcframework.zip",
                      checksum: "6f6d43d72a8ab58c216389b9f00176250d420806539e7d45ed8f3dd29959f522"),
        ]
    #else
        return []
    #endif
}
