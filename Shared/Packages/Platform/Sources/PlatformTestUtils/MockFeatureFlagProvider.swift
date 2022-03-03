//
//  MockFeatureFlagProvider.swift
//
//
//  Created by John Connolly on 2022-02-28.
//

import Foundation
import Platform
// swiftlint:disable identifier_name

/**

 MockFeatureFlagProvider provider to test code that relies on features flags.

 */
public final class MockFeatureFlagProvider: FeatureFlagProvider {
    private let flags: [String: Bool]

    /**

     Pass in the appropriate flags for testing ex. The flags will evaluate to what is specified or the
     fall back value if the flag is not found.

     let provider = MockFeatureFlagProvider(flags: [FeatureFlagKey.myFeature: true])

     */
    public init<U: RawRepresentable>(flags: [U: Bool]) where U.RawValue == String {
        let flags = flags.map { key, value in
            (key.rawValue, value)
        }
        self.flags = Dictionary(uniqueKeysWithValues: flags)
    }

    public func _variation<T>(forKey flagKey: T, fallback: Bool) -> Bool where T: RawRepresentable, T.RawValue == String {
        return flags[flagKey.rawValue] ?? fallback
    }
}
