// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "Scripts",
  platforms: [.macOS(.v11)],
  dependencies: [
    .package(url: "https://github.com/FullQueueDeveloper/Sh.git", from: "1.0.0"),
    .package(url: "https://github.com/FullQueueDeveloper/ShXcrun.git", from: "0.1.0"),
  ],
  targets: [
    .executableTarget(
      name: "icon",
      dependencies: ["Sh"]
    ),
    .executableTarget(
      name: "project",
      dependencies: ["Sh", "Secrets"]
    ),
    .executableTarget(
      name: "appstore",
      dependencies: ["Sh", "ShXcrun", "Secrets"]
    ),

    .target(
      name: "Secrets",
      dependencies: ["Sh"]
    ),
  ]
)
