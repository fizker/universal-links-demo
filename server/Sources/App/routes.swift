import Vapor
import AppleAssociatedDomainsVapor

func routes(_ app: Application) throws {
	app.get { req in
		return HTMLPage(title: "Intro", body: """
		This is a support server for playing around with
		<a href="https://developer.apple.com/documentation/xcode/supporting-universal-links-in-your-app">Universal Links</a>
		and multiple apps.
		""")
	}

	app.get("to-all") { req in
		HTMLPage(title: "All", body: """
		All apps can open from this page.<br>
		<br>
		Note that if multiple apps are installed, only one of them will respond to this URL.
		""")
	}


	app.get("to-uikit") { req in
		HTMLPage(title: "UIKit only", body: """
		Only the UIKit app can open from this page.
		""")
	}

	app.get("to-swiftui") { req in
		HTMLPage(title: "SwiftUI only", body: """
		Only the SwiftUI app can open from this page.
		""")
	}

	app.get("**") { req in
		HTMLPage(title: "Not found", body: """
		Move along! Nothing to see!
		""")
	}

	enum AppID: String, CaseIterable {
		case uiKit = "APPID_UIKIT"
		case swiftUI = "APPID_SWIFTUI"
	}

	let appIDs = EnvironmentVariables<AppID>()

	app.appleAppSiteAssociation(applinks: .init(
		details: [
			.init(
				appIDs: [
					try appIDs.get(.uiKit),
				],
				components: [
					.init(path: "/to-all"),
					.init(path: "/to-uikit"),
				]
			),
			.init(
				appIDs: [
					try appIDs.get(.swiftUI),
				],
				components: [
					.init(path: "/to-all"),
					.init(path: "/to-swiftui"),
				]
			),
		]
	))
}
