// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyDesignSystem",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MyDesignSystem",
            targets: ["MyDesignSystem"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/tevelee/SwiftUI-Flow.git", exact: "1.1.0"),
        .package(url: "https://github.com/kean/Nuke.git", exact: "12.3.0"),
        .package(url: "https://github.com/bestswlkh0310/my-ios-util.git", exact: "1.0.1"),
    ],
    targets: [
        .target(
            name: "MyDesignSystem",
            dependencies: [
                .product(name: "Flow", package: "SwiftUI-Flow"),
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "NukeUI", package: "Nuke"),
                .product(name: "MyUtil", package: "my-ios-util")
            ],
            resources: [
                .process("Foundation/Typography/Font")
            ]
        )
    ]
)
