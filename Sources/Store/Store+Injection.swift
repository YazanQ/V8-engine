//
//  Store+Injection.swift
//
//
//  Created by Yazan Qaisi Trend on 28/02/2024.
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
