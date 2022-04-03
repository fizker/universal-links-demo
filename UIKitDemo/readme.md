# UIKitDemo

Opening Universal Links in UIKit is straight forward, but there is a number of moving parts.

There are two ways that the app is notified, depending on whether or not the app is currently running. In either case, it is useful to create a handler, since either method will provide an `NSUserActivity`.

The handler could look like the following:

```swift
func handle(_ activity: NSUserActivity) {
	guard
		userActivity.activityType == NSUserActivityTypeBrowsingWeb,
		let incomingURL = userActivity.webpageURL
	else { return }

	// Do something with `incomingURL`
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
