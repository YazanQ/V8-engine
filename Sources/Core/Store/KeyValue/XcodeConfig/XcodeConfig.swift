//
//  XcodeConfig.swift
//
//
//  Created by Yazan Qaisi on 25/02/2024.
//

import Foundation

@propertyWrapper
public struct XcodeConfig<Value: LosslessStringConvertible> {

    public let key: String
    public let bundle: Bundle

    public var wrappedValue: Value { value(for: key) }

    public init(key: String, bundle: Bundle = .main) {
        self.key = key
        self.bundle = bundle
    }
}

private extension XcodeConfig {
    func value(for key: String) -> Value {
        guard let object = bundle.object(forInfoDictionaryKey: key) else {
            fatalError("Missing key: \(key)")
        }

        switch object {
        case let value as Value:
            return value
        case let string as String:
            guard let value = Value(string) else { fallthrough }
            return value
        default:
            fatalError("Invalid Value")
        }
    }
}
