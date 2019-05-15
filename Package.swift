// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Yoga",
        products: [
        .library(name: "Yoga", targets: ["Yoga"]),
    ],
    targets: [
      .systemLibrary(name: "Yoga", path: "Sources/Yoga"),
    ]
)
