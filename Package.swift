// swift-tools-version:5.2

/*
*        __                                 ____
*       / /   ____  ________  ____ ___     /  _/___  _______  ______ ___
*      / /   / __ \/ ___/ _ \/ __ `__ \    / // __ \/ ___/ / / / __ `__ \
*     / /___/ /_/ / /  /  __/ / / / / /  _/ // /_/ (__  ) /_/ / / / / / /
*    /_____/\____/_/   \___/_/ /_/ /_/  /___/ .___/____/\__,_/_/ /_/ /_/
*                                          /_/
*
*                                 Package.swift
*                   http://github.com/lukaskubanek/LoremIpsum
*             2013-2020 (c) Lukas Kubanek (http://lukaskubanek.com)
*/

import PackageDescription

let package = Package(
    name: "LoremIpsum",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v9),
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
