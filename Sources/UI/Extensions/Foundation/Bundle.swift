//
//  Bundle.swift
//
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import Foundation

private class BundleIdentifyingClass {}

public extension Bundle {
    static var current: Bundle {
        #if SWIFT_PACKAGE
        return .module
        #else
        return .init(for: BundleIdentifyingClass.self)
        #endif
    }
}

extension Bundle {
    static func bundle(
        forResource resource: String?,
        ofType type: String? = "nib"
    ) -> Bundle {
        let resolvedBundle: Bundle
        if Bundle.main.path(forResource: resource, ofType: type) != nil {
            resolvedBundle = Bundle.main
        } else {
            resolvedBundle = Bundle.module
        }

        return resolvedBundle
    }
}
