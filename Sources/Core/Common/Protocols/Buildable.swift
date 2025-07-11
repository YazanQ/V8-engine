//
//  Buildable.swift
//
//
//  Created by Yazan Qaisi on 06/06/2024.
//

import Foundation

public protocol Buildable {}

public extension Buildable where Self: AnyObject {
    func with<T>(
        _ property: ReferenceWritableKeyPath<Self, T>,
        _ value: T
    ) -> Self {
        self[keyPath: property] = value
        return self
    }
}

extension NSObject: Buildable {}
