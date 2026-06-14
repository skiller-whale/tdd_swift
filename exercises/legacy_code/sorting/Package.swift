// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Sorting",
    targets: [
        .target(
            name: "Sorting",
            path: "Sources/Sorting"
        ),
        .testTarget(
            name: "SortingTests",
            dependencies: ["Sorting"],
            path: "Tests/SortingTests"
        ),
    ]
)
