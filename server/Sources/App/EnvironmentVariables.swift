import Vapor

struct MissingEnvironmentVariables: Error {
	var keys: [String] = []
}

extension MissingEnvironmentVariables: CustomStringConvertible {
	var description: String {
		"""
		Required env keys are missing: \(keys.joined(separator: ", "))
		"""
	}
}

struct EnvironmentVariables<Key> where Key: Hashable, Key: CaseIterable, Key: RawRepresentable, Key.RawValue == String {
	init() {
		read()
	}

	func get(_ key: Key) throws -> String {
		guard let value = values[key]
		else { throw missingKeys }

		return value
	}

	private var values: [Key: String] = [:]
	private var missingKeys: MissingEnvironmentVariables = .init()

	private mutating func read() {
		missingKeys.keys = []

		for key in Key.allCases {
			if let value = Environment.get(key.rawValue) {
				values[key] = value
			} else {
				values[key] = nil
				missingKeys.keys.append(key.rawValue)
			}
		}
	}
}
