import UIKit

class ViewController: UIViewController {
	@IBOutlet var latestUniversalLinkTextField: UITextField!

	let notificationCenter = UniversalLinkController.shared.notificationCenter

	var observer: NSObjectProtocol? {
		didSet {
			if let old = oldValue {
				notificationCenter.removeObserver(old)
			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		observer = notificationCenter.addObserver(forName: .latestUniversalLinkWasUpdated, object: nil, queue: nil) { [weak self] _ in
			guard let self = self
			else { return }

			let latest = UniversalLinkController.shared.latestUniversalLink
			self.latestUniversalLinkTextField.text = latest?.path ?? ""
		}
	}
}
