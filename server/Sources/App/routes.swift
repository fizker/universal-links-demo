import Vapor
import AppleAssociatedDomainsVapor

func routes(_ app: Application) throws {
	app.get("hello") { req -> String in
		return "Hello, world!"
	}

	app.get("**") { req -> String in
		print("Path: \(req.url.path)")
		return "Handling \(req.url.path)"
	}

	app.appleAppSiteAssociation(applinks: .init(
		details: [
			.init(
				appIDs: [
					"dk.fizkerinc.universal-links.UIKitDemo",
				]
			),
		]
	))
}
