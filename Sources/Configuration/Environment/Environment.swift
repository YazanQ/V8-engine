//
//  Environment.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public enum Environment {
    case debug
    case release
}

public extension Environment {
    static var current: Self {
        #if DEBUG
        return .debug
        #else
        return .release
        #endif
    }
}
