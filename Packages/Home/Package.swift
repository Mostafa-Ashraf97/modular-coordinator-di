// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Home",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]
        )
    ],
    dependencies: [
        .package(path: "../Common"),
        .package(url: "https://github.com/Swinject/Swinject", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: ["Common", "Swinject"],
            path: "Sources"
        )
    ]
)
