// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Till",
    targets: [
        .target(
            name: "Till",
            path: "Sources/Till"
        ),
        .testTarget(
            name: "TillTests",
            dependencies: ["Till"],
            path: "Tests/TillTests"
        ),
    ]
)
