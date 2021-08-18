import SwiftUI

struct ContentView: View {
	@State var latestLinkText: String = ""

	var body: some View {
		VStack(alignment: .leading) {
			Text("Universal Links")
				.font(.largeTitle)
			Text("SwiftUI App")
				.font(.headline)
			Text("This shows the result of the last universal link that this app have opened.")
				.font(.body)
				.padding(.vertical, 4)
			Text("Latest Universal Link:")
				.font(.body)
			TextField("Foo", text: $latestLinkText)
				.textFieldStyle(RoundedBorderTextFieldStyle())
			Spacer()
		}
			.padding(.horizontal, 8)
			.onOpenURL { url in
				latestLinkText = url.path
			}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
