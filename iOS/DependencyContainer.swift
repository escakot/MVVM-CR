//
//  DependencyContainer.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-03.
//

import Foundation
import Platform

enum FeatureFlagKey: String {
    case flagOn
    case flagOff
}
class FeatureFlagProviderImpl: FeatureFlagProvider {
    let flags: [String: Bool] = [
        "flagOn": true,
        "flagOff": false
    ]
    func _variation<T>(forKey flagKey: T, fallback: Bool) -> Bool where T : RawRepresentable, T.RawValue == String {
        return flags[flagKey.rawValue] ?? fallback
    }
    func variation(forKey flagKey: FeatureFlagKey, fallback: Bool) -> Bool {
        return _variation(forKey: flagKey, fallback: fallback)
    }
}

enum Topic: String {
    case lifecycle
    case feature
    case menu
}
enum ErrorKind: String {
    case repository
}
class LoggerImpl: Logger {
    func _debug<T>(_ message: String, topic: T?, extra: [String : Encodable], file: String, function: String) where T : RawRepresentable, T.RawValue == String {
        print(message)
    }
    
    func _info<T>(_ message: String, topic: T, extra: [String : Encodable], file: String, function: String) where T : RawRepresentable, T.RawValue == String {
        print(message)
    }
    
    func _warn<T, U>(_ message: String, topic: T, errorKind: U, error: String?, extra: [String : Encodable], file: String, function: String) where T : RawRepresentable, U : RawRepresentable, T.RawValue == String, U.RawValue == String {
        print(message)
    }
    
    func _error<T, U>(_ message: String, topic: T, errorKind: U, error: String?, extra: [String : Encodable], file: String, function: String) where T : RawRepresentable, U : RawRepresentable, T.RawValue == String, U.RawValue == String {
        print(message)
    }
}
    
extension Logger {
    func debug(_ message: String, topic: Topic?, extra: [String : Encodable] = [:], file: String = #file, function: String = #function) {
        _debug(message, topic: topic, extra: extra, file: file, function: function)
    }
    
    func info(_ message: String, topic: Topic, extra: [String : Encodable] = [:], file: String = #file, function: String = #function) {
        _info(message, topic: topic, extra: extra, file: file, function: function)
    }

    func warn(_ message: String, topic: Topic, errorKind: ErrorKind, error: String?, extra: [String : Encodable] = [:], file: String = #file, function: String = #function) {
        _warn(message, topic: topic, errorKind: errorKind, error: error, extra: extra, file: file, function: function)
    }
    
    func error(_ message: String, topic: Topic, errorKind: ErrorKind, error: String?, extra: [String : Encodable] = [:], file: String = #file, function: String = #function) {
        _error(message, topic: topic, errorKind: errorKind, error: error, extra: extra, file: file, function: function)
    }
}

class DependencyContainer {
    
    var featureFlagProvider: FeatureFlagProvider
    var logger: Logger
    var database: DatabaseLayer
    var network: NetworkLayer
    
    static var main: DependencyContainer {
        return DependencyContainer(
            featureFlagProvider: FeatureFlagProviderImpl(),
            logger: LoggerImpl(),
            database: Database(),
            network: Network()
        )
    }
    
    init(featureFlagProvider: FeatureFlagProvider,
         logger: Logger,
         database: DatabaseLayer,
         network: NetworkLayer
    ) {
        self.featureFlagProvider = featureFlagProvider
        self.logger = logger
        self.database = database
        self.network = network
    }
}

var Current: DependencyContainer = .main
