import PackageDescription

let package = Package(
    name: "MyDesignSystem",
    products: [
        .library(
            name: "MyDesignSystem",
            targets: ["MyDesignSystem"]),
    ],
    targets: [
        .target(
            name: "MyDesignSystem"),
        .testTarget(
            name: "MyDesignSystemTests",
            dependencies: ["MyDesignSystem"]),
    ]
)
