// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "V8-Engine",
    defaultLocalization: "en",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "APIClient", targets: ["APIClient"]),
        .library(name: "Core", targets: ["Core"]),
        .library(name: "Configuration", targets: ["Configuration"]),
        .library(name: "Store", targets: ["Store"]),
        .library(name: "UI", targets: ["UI"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.1"),
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.1.2"),
        .package(url: "https://github.com/konkab/AlamofireNetworkActivityLogger.git", .upToNextMajor(from: "3.4.0")),
        .package(url: "https://github.com/Flight-School/AnyCodable", from: "0.6.0"),
        .package(url: "https://github.com/sendyhalim/Swime", from: "3.0.7"),
        .package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "20.0.0"),
        .package(url: "https://github.com/hackiftekhar/IQKeyboardManager.git", from: "6.5.0"),
        .package(url: "https://github.com/relatedcode/ProgressHUD", from: "13.6.1"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.24.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0"))
    ],
    targets: [
        .target(
            name: "APIClient",
            dependencies: [
                "Core",
                "Swime",
                "Alamofire",
                "AlamofireNetworkActivityLogger",
                "Configuration"
            ]
        ),
        .target(
            name: "Core",
            dependencies: [
                "Resolver",
                "AnyCodable"
            ]
        ),
        .target(
            name: "Configuration",
            dependencies: [
            "Core"
            ],
            exclude: [
                "GitHooks",
                "Firebase",
                "SwiftFormat",
                "SwiftLint",
                "SwiftGen",
                "Xcode"
            ]
        ),
        .target(
            name: "UI",
            dependencies: [
                .product(name: "IQKeyboardManagerSwift", package: "IQKeyboardManager"),
                .product(name: "Kingfisher", package: "Kingfisher"),
                "Core",
                "ProgressHUD"
            ]
        ),
        .target(
            name: "Store",
            dependencies: [
                "Core",
                .product(name: "KeychainSwift", package: "keychain-swift"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .product(name: "FirebasePerformance", package: "firebase-ios-sdk"),
                .product(name: "FirebaseRemoteConfig", package: "firebase-ios-sdk")
            ]
        )
    ]
)
