//
//  FeatureFlagProvider.swift
//
//
//  Created by John Connolly on 2022-02-18.
//

import Foundation
// swiftlint:disable identifier_name
/**

  To allow for type inference ex variation(forKey .foo)
  simply add a protocol extension for the feature flags provider ex
  enum MyFeatureKeys: String {
       case foo
  }

  extension FeatureFlagProvider {
     func variation(forKey: MyFeatureKeys, fallback: Bool) -> Bool { }
 }
  */
public protocol FeatureFlagProvider {
    /**
     Retrieves a flag value for the given `flagKey`.
     This method provides a more type-safe way of getting flags
     by using an enum instead of raw strings.
     */
    func _variation<T: RawRepresentable>(forKey flagKey: T, fallback: Bool) -> Bool where T.RawValue == String
}
