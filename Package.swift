// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyDesignSystem",
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
        .executable(
            name: "MyIOSKitClient",
            targets: ["MyIOSKitClient"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Nuke.git", exact: "12.3.0")
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
        .executableTarget(
            name: "MyIOSKitClient",
            dependencies: [
                .target(name: "MyDesignSystem"),
                .target(name: "MyShared")
            ]
        )
    ]
)
