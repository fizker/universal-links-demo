import Foundation

extension Notification.Name {
	static var latestUniversalLinkWasUpdated = Notification.Name("latestUniversalLinkWasUpdated")
}

class UniversalLinkController {
	static let shared = UniversalLinkController()

	let notificationCenter = NotificationCenter.default

	var latestUniversalLink: URL? {
		didSet {
			notificationCenter.post(name: .latestUniversalLinkWasUpdated, object: latestUniversalLink)
		}
	}

	@discardableResult
	func handle(_ userActivity: NSUserActivity) -> Bool {
		guard
			userActivity.activityType == NSUserActivityTypeBrowsingWeb,
			let incomingURL = userActivity.webpageURL
		else { return false }

		latestUniversalLink = incomingURL
		return true
	}
}
