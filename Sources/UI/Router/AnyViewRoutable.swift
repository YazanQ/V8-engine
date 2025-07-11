//
//  AnyViewRoutable.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import UIKit

public protocol AnyViewRoutable {
    var router: ViewRoutable? { get }
}

public extension AnyViewRoutable {
    var router: ViewRoutable? {
        UIApplication.visibleViewController
    }
}
