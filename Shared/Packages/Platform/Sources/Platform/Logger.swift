//
//  Logger.swift
//
//
//  Created by John Connolly on 2022-02-18.
//

import Foundation

// swiftlint:disable identifier_name

/**
   Generic interface to implement a logging backend. These functions are used for the implementation. Consumers should rely on the functions with default values for file and function.

 */

public protocol Logger {
    func _debug<T: RawRepresentable>(_ message: String, topic: T?, extra: [String: Encodable], file: String, function: String) where T.RawValue == String
    func _info<T: RawRepresentable>(_ message: String, topic: T, extra: [String: Encodable], file: String, function: String) where T.RawValue == String
    func _warn<T: RawRepresentable, U: RawRepresentable>(_ message: String, topic: T, errorKind: U, error: String?, extra: [String: Encodable], file: String, function: String) where T.RawValue == String, U.RawValue == String
    func _error<T: RawRepresentable, U: RawRepresentable>(_ message: String, topic: T, errorKind: U, error: String?, extra: [String: Encodable], file: String, function: String) where T.RawValue == String, U.RawValue == String
}
