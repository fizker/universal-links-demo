# SwiftUIDemo

Opening Universal Links in SwiftUI is real simple. On the appropriate view, add a handler like the one below:

```swift
.onOpenURL(perform: { (url: URL) in
	// handle the URL
})
```

It will get called whenever the app is told by the OS to handle a URL, whether the app is a cold-start or already running.

In this codebase, this can be seen in [ContentView](SwiftUIDemo/ContentView.swift), where the URL is assigned a local variable so that it could be seen on screen.
