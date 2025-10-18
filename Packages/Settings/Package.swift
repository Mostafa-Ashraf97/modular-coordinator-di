// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Settings",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Settings",
            targets: ["Settings"]
        )
    ],
    dependencies: [
        .package(path: "../Common"),
        .package(url: "https://github.com/Swinject/Swinject", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "Settings",
            dependencies: ["Common", "Swinject"],
            path: "Sources"
        )
    ]
)
