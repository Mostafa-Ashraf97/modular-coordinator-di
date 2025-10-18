// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Common",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Common",
            targets: ["Common"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "Common",
            dependencies: ["Swinject"],
            path: "Sources"
        ),
        .testTarget(
            name: "CommonTests",
            dependencies: ["Common"]
        )
    ]
)
