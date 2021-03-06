// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

private let projectRootPath = URL(fileURLWithPath: #file).pathComponents.prefix { component in
    component != "iOS" && component != "macOS"
}.joined(separator: "/").dropFirst()

let package = Package(
    name: "Orders",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "Orders", targets: ["Orders"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(path: "\(projectRootPath)/Shared/Packages/Platform"),
        .package(url: "git@github.com:TouchBistro/TBKit.git", .branch("master")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Orders",
            dependencies: [
                "Platform",
                .product(name: "TBUtilityKit-iOS", package: "TBKit"),
                .product(name: "TBUIKit-iOS", package: "TBKit"),
            ]
        ),
        .testTarget(
            name: "OrdersTests",
            dependencies: [
                "Orders",
                .product(name: "PlatformTestUtils", package: "Platform"),
            ]
        ),
    ]
)
