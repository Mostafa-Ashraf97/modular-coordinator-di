// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Profile",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Profile",
            targets: ["Profile"]
        )
    ],
    dependencies: [
        .package(path: "../Common"),
        .package(url: "https://github.com/Swinject/Swinject", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "Profile",
            dependencies: ["Common", "Swinject"],
            path: "Sources"
        )
    ]
)
