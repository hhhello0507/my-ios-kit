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
            name: "MyMoya",
            targets: ["MyMoya"]
        ),
        .library(
            name: "MyShared",
            targets: ["MyDateUtil"]
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
                .product(name: "NukeUI", package: "Nuke"),
                .target(name: "MyUIKitExt")
            ],
            resources: [
                .process("Resource/Font"),
                .process("Resource/Assets.xcassets")
            ]
        ),
        .target(
            name: "MyDateUtil",
            path: "Sources/MyShared/MyDateUtil"
        ),
        .target(
            name: "MyUIKitExt",
            path: "Sources/MyShared/MyUIKitExt"
        ),
        .target(
            name: "MyMoya",
            dependencies: [
                .product(name: "Moya", package: "Moya"),
                .product(name: "CombineMoya", package: "Moya"),
                .target(name: "MyDateUtil")
            ]
        ),
        .executableTarget(
            name: "MyIOSKitClient",
            dependencies: [
                .target(name: "MyDesignSystem"),
                .target(name: "MyMoya"),
                .target(name: "MyDateUtil")
            ]
        )
    ]
)
