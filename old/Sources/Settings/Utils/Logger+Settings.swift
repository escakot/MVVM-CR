//
//  Logger+"Settings".swift
//  TouchBistro
//
//  Generated by make package
//

import Foundation
import Platform

enum ErrorKind: String {
    case exampleError
}

enum Topic: String {
    case exampleTopic
}

/**
   Public interface used to log stuff
 */
extension Platform.Logger {
    func debug(_ message: String, topic: Topic? = nil, extra: [String: Encodable] = [:], file: String = #file, function: String = #function) {
        _debug(message, topic: topic, extra: extra, file: file, function: function)
    }

    func info(_ message: String, topic: Topic, extra: [String: Encodable], file: String = #file, function: String = #function) {
        _info(message, topic: topic, extra: extra, file: file, function: function)
    }

    func warn(_ message: String, topic: Topic, errorKind: ErrorKind, error: String?, extra: [String: Encodable], file: String = #file, function: String = #function) {
        _warn(message, topic: topic, errorKind: errorKind, error: error, extra: extra, file: file, function: function)
    }

    func error(_ message: String, topic: Topic, errorKind: ErrorKind, error: String?, extra: [String: Encodable], file: String = #file, function: String = #function) {
        _error(message, topic: topic, errorKind: errorKind, error: error, extra: extra, file: file, function: function)
    }

    static func setLogger(_ logger: Self) {
        Logger = logger
    }
}
private(set) var Logger: Platform.Logger!