// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "Merger",
    dependencies: [
        .package(url: "https://github.com/x-sheep/swift-property-based.git", from: "1.2.0"),
    ],
    targets: [
        .target(
            name: "Merger",
            path: "Sources/Merger"
        ),
        .testTarget(
            name: "MergerTests",
            dependencies: [
                "Merger",
                .product(name: "PropertyBased", package: "swift-property-based"),
            ],
            path: "Tests/MergerTests"
        ),
    ]
)
