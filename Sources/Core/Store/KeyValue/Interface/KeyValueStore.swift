//
//  KeyValueStore.swift
//
//
//  Created by Yazan Qaisi on 25/02/2024.
//

import Foundation

public protocol KeyValueStore {
    func object(forKey key: String) -> Data?
    func set(_ value: Data?, forKey key: String)
    func remove(forKey key: String)
}
