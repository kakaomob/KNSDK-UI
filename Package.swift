// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let sdkName = "KNSDK"
let version = "1.10.10"

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
        .package(url: "https://github.com/kakaomob/KMLocationSDK.git", exact: Version(stringLiteral: "1.103.82")),
    ],
    targets: getRealmFromNexus(),
    swiftLanguageVersions: [.v5]
)

func getRealmFromNexus() -> [Target] {
    let targets: [Target]  = [
        .binaryTarget(name: sdkName,
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/1.10.10/KNSDK-UI/KNSDK.xcframework.zip",
                      checksum: "fe1ac03547d446d9b8f419b6e89a4d8a27c98830c5db4eaa5f69817b735a2ce2"),
        .target(name: "KNSDKBundle",
                dependencies: [
                    .target(name: sdkName),
                    .product(name: "KMLocationSDK", package: "KMLocationSDK"),
                    .target(name: "Realm"),
                    .target(name: "RealmSwift")
                ],
                resources: [
                    .process("PrivacyInfo.xcprivacy")
                ]
        )
    ]
    
    #if compiler(>=6.1.0)
    // 16.3
    return targets + [
        .binaryTarget(name: "Realm",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                      checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
        .binaryTarget(name: "RealmSwift",
                      url: "https://admin-devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.4/16.3/RealmSwift.xcframework.zip",
                      checksum: "3a221836f9dfdfd267acb1dae21d7d9131de2ac7f20a658e5e41459e4230372a"),
        ]
    #elseif compiler(>=6.0.3)
    // 16.2
        return targets + [
            .binaryTarget(name: "Realm",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                          checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
            .binaryTarget(name: "RealmSwift",
                          url: "https://admin-devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.4/16.2/RealmSwift.xcframework.zip",
                          checksum: "0a250250bc2e48c83d94b976519c1e87628b6c3737ea42bd0d29ec392a1aa877"),
            ]
    #elseif compiler(>=6.0.2)
    // 16.1
    return targets + [
        .binaryTarget(name: "Realm",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                      checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
        .binaryTarget(name: "RealmSwift",
                      url: "https://admin-devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.4/16.1/RealmSwift.xcframework.zip",
                      checksum: "0fa71049c96fa75b467d847709e23fe97cda761f90ad858147b67fe5330996d5"),
        ]
    #elseif compiler(>=6.0)
    // 16.0
    return targets + [
        .binaryTarget(name: "Realm",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                      checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
        .binaryTarget(name: "RealmSwift",
                      url: "https://admin-devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.4/16.0/RealmSwift.xcframework.zip",
                      checksum: "001d91c68b86f998675bc7926337fd5df019b03d3cb18e971047599ccbe30d29"),
        ]
    #elseif compiler(>=5.10.0)
    // 15.3, 15.4
    return targets + [
        .binaryTarget(name: "Realm",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                      checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
        .binaryTarget(name: "RealmSwift",
                      url: "https://admin-devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.54.4/15.4/RealmSwift.xcframework.zip",
                      checksum: "ee2bfbef6a8b891cc60282b022febf88181d1d9db2559fdb09ab644315b8ca28"),
        ]
    #elseif compiler(>=5.9.2)
    // 15.2, 15.1
        return targets + [
            .binaryTarget(name: "Realm",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                          checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
            .binaryTarget(name: "RealmSwift",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/15.2/RealmSwift.xcframework.zip",
                          checksum: "04e554618d2bb8db1a0cb0f68d50849e0a43285be36e781abd03d3efa3586e58"),
            ]
    #elseif compiler(>=5.8.1)
    // 14.3.1
        return targets + [
            .binaryTarget(name: "Realm",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                          checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
            .binaryTarget(name: "RealmSwift",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/14.3.1/RealmSwift.xcframework.zip",
                          checksum: "67e8e0f991bf079f4831007bd1f6cc96a7c11a07c4d7dec353d91ea9fc00f09b"),
            ]
    #elseif compiler(>=5.7.2)
    // 14.2
        return targets + [
            .binaryTarget(name: "Realm",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                      checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
        .binaryTarget(name: "RealmSwift",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/14.2/RealmSwift.xcframework.zip",
                      checksum: "19b8fc09ef27beceb2a6dccb690aa149be34c9328c962e423f7c667884a2caaf"),
        ]
    #else
        return []
    #endif
}
