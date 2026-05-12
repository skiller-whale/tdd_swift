// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "WordleStats",
    targets: [
        .target(
            name: "WordleStats",
            path: "Sources/WordleStats"
        ),
        .executableTarget(
            name: "WordleStatsApp",
            dependencies: ["WordleStats"],
            path: "Sources/WordleStatsApp"
        ),
        .testTarget(
            name: "WordleStatsTests",
            dependencies: ["WordleStats"],
            path: "Tests/WordleStatsTests"
        ),
    ]
)
