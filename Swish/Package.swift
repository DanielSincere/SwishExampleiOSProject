// swift-tools-version:5.6

import PackageDescription

let package = Package(
  name: "Scripts",
  platforms: [.macOS(.v12)],
  dependencies: [
    .package(url: "https://github.com/FullQueueDeveloper/Sh.git", from: "1.0.0"),
    .package(url: "https://github.com/FullQueueDeveloper/ShXcrun.git", from: "0.1.9"),
  ],
  targets: [
    .executableTarget(
      name: "icon",
      dependencies: [
        .product(name: "Sh", package: "Sh"),
      ]
    ),
    .executableTarget(
      name: "project",
      dependencies: [
        .product(name: "Sh", package: "Sh"),
        .target(name: "Secrets"),
      ]
    ),
    .executableTarget(
      name: "appstore",
      dependencies: [
        .product(name: "Sh", package: "Sh"),
        .product(name: "ShXcrun", package: "ShXcrun"),
        .target(name: "Secrets"),
      ]
    ),
    .executableTarget(
      name: "generate",
      dependencies: []
    ),

    .target(
      name: "Secrets",
      dependencies: ["Sh"]
    ),
  ]
)
