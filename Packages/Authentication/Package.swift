// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Authentication",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Authentication",
            targets: ["Authentication"]
        )
    ],
    dependencies: [
        .package(path: "../Common"),
        .package(url: "https://github.com/Swinject/Swinject", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "Authentication",
            dependencies: ["Common", "Swinject"],
            path: "Sources"
        )
    ]
)
