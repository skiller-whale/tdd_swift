// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "WordleCheat",
    targets: [
        .target(
            name: "WordleCheat",
            path: "Sources/WordleCheat"
        ),
        .executableTarget(
            name: "WordleCheatApp",
            dependencies: ["WordleCheat"],
            path: "Sources/WordleCheatApp"
        ),
        .testTarget(
            name: "WordleCheatTests",
            dependencies: ["WordleCheat"],
            path: "Tests/WordleCheatTests"
        ),
    ]
)
