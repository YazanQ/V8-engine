//
//  UserDefaultStore.swift
//
//
//  Created by Yazan Qaisi on 27/02/2024.
// swiftlint:disable user_defaults_prohibited
//

import Foundation
import Core

public struct UserDefaultStore: KeyValueStore {
    private let userDefaults: UserDefaults

    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
}

public extension UserDefaultStore {
    func object(forKey key: String) -> Data? {
        userDefaults.object(forKey: key) as? Data
    }

    func set(_ value: Data?, forKey key: String) {
        if let value {
            userDefaults.setValue(value, forKey: key)
        } else {
            remove(forKey: key)
        }
    }

    func remove(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
