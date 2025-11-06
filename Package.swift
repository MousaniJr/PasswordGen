// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PasswordGen",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "PasswordGen",
            targets: ["PasswordGen"]
        )
    ],
    targets: [
        .executableTarget(
            name: "PasswordGen",
            path: "Sources"
        )
    ]
)
