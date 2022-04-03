// swift-tools-version:5.6
import PackageDescription

let package = Package(
	name: "server",
	platforms: [
		.macOS(.v10_15),
	],
	dependencies: [
		.package(url: "https://github.com/fizker/swift-apple-associated-domains-vapor.git", from: "1.0.0"),
		.package(url: "https://github.com/fizker/swift-environment-variables.git", from: "1.0.0"),
		// 💧 A server-side Swift web framework.
		.package(url: "https://github.com/vapor/vapor.git", from: "4.55.3"),
	],
	targets: [
		.target(
			name: "App",
			dependencies: [
				.product(name: "AppleAssociatedDomainsVapor", package: "swift-apple-associated-domains-vapor"),
				.product(name: "EnvironmentVariables", package: "swift-environment-variables"),
				.product(name: "Vapor", package: "vapor"),
			],
			swiftSettings: [
				// Enable better optimizations when building in Release configuration. Despite the use of
				// the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
				// builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
				.unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
			]
		),
		.executableTarget(
			name: "Run",
			dependencies: [
				.target(name: "App"),
			]
		),
		.testTarget(
			name: "AppTests",
			dependencies: [
				.target(name: "App"),
				.product(name: "XCTVapor", package: "vapor"),
			]
		)
	]
)
