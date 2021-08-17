import Vapor

struct HTMLPage : Content {
	static let defaultContentType: HTTPMediaType = .html

	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(html)
	}

	var html: String {
		return """
		<!doctype html>

		<meta
			name="viewport"
			content="width=device-width, initial-scale=1"
		>

		<title>\(title) - Universal Links</title>

		<style>
		nav a {
			margin-left: 10px;
			white-space: nowrap;
		}
		nav a:first-child {
			margin-left: 0;
		}
		</style>

		<nav>
			<a href="/">Intro</a>
			<a href="/to-all">Link to all</a>
			<a href="/to-uikit">Link to UIKit app only</a>
			<a href="/to-swiftui">Link to SwiftUI app only</a>
		</nav>

		<div>\(body)</div>
		"""
	}
	var title: String
	var body: String
}
