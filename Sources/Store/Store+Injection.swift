//
//  Store+Injection.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation
import Resolver
import Core

public extension Resolver {
    static func registerStore() {
        register { UserDefaultStore() as KeyValueStore }
        register { KeychainStore() as KeyValueStore }
    }
}
