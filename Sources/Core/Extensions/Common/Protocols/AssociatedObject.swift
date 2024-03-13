//
//  AssociatedObject.swift
//
//
//  Created by Yazan Qaisi on 14/03/2024.
//

import Foundation

public protocol AssociatedObject {
    func associatedValue<T>(for key: UnsafeRawPointer) -> T?
    func setAssociatedValue<T>(_ value: T?, for key: UnsafeRawPointer)
}

public extension AssociatedObject {

    /// Returns the value associated with a given object for a given key, whether it is a value type or a class.
    func associatedValue<T>(for key: UnsafeRawPointer) -> T? {
        objc_getAssociatedObject(self, key) as? T
    }

    /// Sets an associated value for a given object using a given key and association policy, whether it is a value type or a class.
    func setAssociatedValue<T>(_ value: T?, for key: UnsafeRawPointer) {
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN)
    }
}

extension NSObject: AssociatedObject {}
