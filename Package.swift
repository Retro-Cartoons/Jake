// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Jake",
  platforms: [
    .iOS(.v11),
  ],
  products: [
    .library(
      name: "Jake",
      targets: ["Jake"]),
  ],
  targets: [
    .target(
      name: "Jake",
      path: "Sources"),
  ],
  swiftLanguageVersions: [
    .v5
  ]
)
