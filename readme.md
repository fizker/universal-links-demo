# Universal Links Demo

Demo for how to link Mobile apps with Web servers using Universal Links between browser and app.

This project contains the various parts necessary for testing Universal Links (web-links that open in a browser if associated app is not installed, and in the app if it is installed).

It currently consists of the following parts:

- [Server](server/): A web-server hosting the URLs and some pages linking to them.
- [SwiftUIDemo](SwiftUIDemo/): An iOS demo app implemented entirely in SwiftUI.
- [UIKitDemo](UIKitDemo/): An iOS demo app implemented with UIKit.

## TODO

For additional showcasing, the following parts will be added as time permits:

- Mac apps (AppKit, UIKit, SwiftUI)
- Android (Java/Kotlin)
- Xamarin app with iOS/Android/Mac versions


## How to test changes in iOS

The iOS universal links can be set with a `mode=developer` query variable. See the [`.entitlements` file for UIKitDemo](UIKitDemo/UIKitDemo/UIKitDemo.entitlements) for an example. This means that iOS will ask the server for links directly, instead of going through Apple's global cache.

After making any changes to the server, the device needs to refresh the cache. This is done when the app is installed, so delete all apps using the server and install any one of them again, and the server will be asked for the latest configuration.
