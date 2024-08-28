// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyIOSKit",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "MyDesignSystem",
            targets: ["MyDesignSystem"]
        ),
        .library(
            name: "MyShared",
            targets: ["MyShared"]
        ),
        .library(
            name: "MyMoya",
            targets: ["MyMoya"]
        ),
        .executable(
            name: "MyIOSKitClient",
            targets: ["MyIOSKitClient"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Nuke.git", exact: "12.3.0"),
        .package(url: "https://github.com/Moya/Moya.git", from: "15.0.3")
    ],
    targets: [
        .target(
            name: "MyDesignSystem",
            dependencies: [
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "NukeUI", package: "Nuke")
            ],
            resources: [
                .process("Resource/Font"),
                .process("Resource/Assets.xcassets")
            ]
        ),
        .target(
            name: "MyShared",
            dependencies: []
        ),
        .target(
            name: "MyMoya",
            dependencies: [
                .product(name: "Moya", package: "Moya"),
                .product(name: "CombineMoya", package: "Moya")
            ]
        ),
        .executableTarget(
            name: "MyIOSKitClient",
            dependencies: [
                .target(name: "MyDesignSystem"),
                .target(name: "MyShared")
            ]
        )
    ]
)
