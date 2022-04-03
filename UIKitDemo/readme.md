# UIKitDemo

Opening Universal Links in UIKit is straight forward, but there is a number of moving parts.

There are two ways that the app is notified, depending on whether or not the app is currently running. In either case, it is useful to create a handler, since either method will provide an `NSUserActivity`.

The handler could look like the following:

```swift
func handle(_ activity: NSUserActivity) -> Bool {
	guard
		userActivity.activityType == NSUserActivityTypeBrowsingWeb,
		let incomingURL = userActivity.webpageURL
	else { return false }

	// Do something with `incomingURL`

	return true
}
```

In the demo code, this handler is [the UniversalLinkController class](UIKitDemo/UniversalLinkController.swift). Besides the code above, it also stores the URL and sends an NSNotification that the URL has updated.


## `UIWindowSceneDelegate`

In the `SceneDelegate`, add the following handler for when the app is already running:

```
func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
	handle(userActivity)
}
```

For cold-start scenarios, the `func scene(_:, willConnectTo:, options:)` function will handle it:

```
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
	if let userActivity = connectionOptions.userActivities.first {
		handle(userActivity)
	}
}
```

See [the SceneDelegate class](UIKitDemo/SceneDelegate.swift) for an example of how this can look.


## `UIAppDelegate`

If you have not yet moved to UISceneDelegate, or you still need to support iOS 12, the UIAppDelegate implementation will cover our needs.

Only one method is necessary to add to the UIApplicationDelegate. Here, it interacts with the `UniversalLinkController` from the UIKitDemo app:

```swift
func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
	return UniversalLinkController.shared.handle(userActivity)
}
```
