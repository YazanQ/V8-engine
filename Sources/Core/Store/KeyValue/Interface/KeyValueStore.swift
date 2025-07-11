//
//  KeyValueStore.swift
//
//
//  Created by Yazan Qaisi on 28/05/2024.
//

import Foundation

public protocol KeyValueStore {
    func object(forKey key: String) -> Data?
    func set(_ value: Data?, forKey key: String)
    func remove(forKey key: String)
}
