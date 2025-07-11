//
//  Keychain.swift
//
//
//  Created by Yazan Qaisi on 28/05/2024.
//

import Foundation
import Resolver

@propertyWrapper
public struct Keychain<T: Codable> {
    private struct Wrapper<W>: Codable where W: Codable {
        let wrapped: W
    }


    @Injected
    private var store: KeyValueStore
    private let key: String
    private let defaultValue: T

    public init(
        wrappedValue defaultValue: T,
        key: String
    ) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {
        get {
            guard let data = store.object(forKey: key) else { return defaultValue }
            let value: Wrapper<T>? = try? data.decode()
            return value?.wrapped ?? defaultValue
        }
        set {
            if let optional = newValue as? AnyOptional, optional.isNil {
                store.remove(forKey: key)
            } else {
                guard let data = try? JSONEncoder().encode(Wrapper(wrapped: newValue)) else { 
                    return
                }
                store.set(data, forKey: key)
            }
        }
    }
}

extension Keychain where T: ExpressibleByNilLiteral {
    init(key: String) {
        self.init(wrappedValue: nil, key: key)
    }
}
