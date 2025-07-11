//
//  Reusable.swift
//
//
//  Created by Yazan Qaisi on 27/05/2024.
//

import Foundation

public protocol Reusable {
    static var identifier: String { get }
}

public extension Reusable {
    static var identifier: String {
        String(describing: self)
    }
}
extension NSObject: Reusable {}
