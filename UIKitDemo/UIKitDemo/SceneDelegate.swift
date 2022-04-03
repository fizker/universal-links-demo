import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	// This is required by the UIStoryboard, and cannot be removed
	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		if let userActivity = connectionOptions.userActivities.first {
			UniversalLinkController.shared.handle(userActivity)
		}
	}

	func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
		UniversalLinkController.shared.handle(userActivity)
	}
}
