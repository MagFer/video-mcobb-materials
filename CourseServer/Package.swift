// swift-tools-version:5.5
import PackageDescription

let package = Package(
  name: "CourseServer",
  platforms: [
    .macOS(.v10_15)
  ],
  dependencies: [
    // 💧 A server-side Swift web framework.
    .package(url: "https://github.com/vapor/vapor.git", from: "4.92.1"),
  ],
  targets: [
    .target(
      name: "App",
      dependencies: [
        .product(name: "Vapor", package: "vapor")
      ],
      swiftSettings: [
        .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
      ]
    ),
    .executableTarget(name: "Run", dependencies: [.target(name: "App")])
  ]
)
