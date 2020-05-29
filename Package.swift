// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoremIpsum",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v8),
        .watchOS(.v2),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "LoremIpsum",
            targets: ["LoremIpsum"]),
    ],
    targets: [
        .target(
            name: "LoremIpsum",
            dependencies: []),
    ]
)
