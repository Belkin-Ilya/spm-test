// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "CloudpaymentsSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "sdk",
            targets: ["sdk"]
        ),
        .library(
            name: "CloudpaymentsNetworking",
            targets: ["CloudpaymentsNetworking"]
        )
    ],
    targets: [
        .target(
            name: "sdk",
            dependencies: [
                "CloudpaymentsNetworking"
            ],
            path: "sdk",
            exclude: [
                "Pods",
                "sdk-Bridging-Header.h"
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "CloudpaymentsNetworking",
            path: "networking",
            sources: ["source"]
        ),
        .testTarget(
            name: "CloudpaymentsNetworkingTests",
            dependencies: ["CloudpaymentsNetworking"],
            path: "networking/Tests"
        )
    ],
    swiftLanguageVersions: [.v5]
)
