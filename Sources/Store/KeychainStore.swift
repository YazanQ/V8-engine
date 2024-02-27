//
//  KeychainStore.swift
//
//
//  Created by Yazan Qaisi on 25/02/2024.
//

import Foundation
import KeychainSwift
import Core

public struct KeychainStore: KeyValueStore {
    private static let accessOption: KeychainSwiftAccessOptions = .accessibleAfterFirstUnlock
    private let keychain: KeychainSwift

    public init() {
        self.keychain = KeychainSwift()
        keychain.synchronizable = false
    }

    public init(teamID: String, accessGroup: String) {
        self.init()
        keychain.accessGroup = "\(teamID).\(accessGroup)"
    }
}

public extension KeychainStore {
    func object(forKey key: String) -> Data? {
        keychain.getData(key)
    }

    func set(_ value: Data?, forKey key: String) {
        if let value {
            keychain.set(value, forKey: key)
        } else {
            remove(forKey: key)
        }
    }

    func remove(forKey key: String) {
        keychain.delete(key)
    }
}
