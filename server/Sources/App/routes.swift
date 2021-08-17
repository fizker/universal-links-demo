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
		All apps can open from this page.
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

	app.appleAppSiteAssociation(applinks: .init(
		details: [
			.init(
				appIDs: [
					"JJYTU65Q3D.dk.fizkerinc.universal-links.UIKitDemo",
				],
				components: [
					.init(path: "/to-all"),
					.init(path: "/to-uikit"),
				]
			),
		]
	))
}
