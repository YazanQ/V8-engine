//
//  DelegateProxy.swift
//
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import Foundation

private var associatedKey = "delegateProxy"

public protocol DelegateProxy {
    associatedtype Object

    func setDelegate(to object: Object)
}

extension DelegateProxy where Self: NSObject {
    public static func createDelegateProxy(for object: Object) -> Self {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }

        let delegateProxy: Self
        if let associatedObject = objc_getAssociatedObject(object, &associatedKey) as? Self {
            delegateProxy = associatedObject
        } else {
            delegateProxy = .init()
            objc_setAssociatedObject(object, &associatedKey, delegateProxy, .OBJC_ASSOCIATION_RETAIN)
        }
        delegateProxy.setDelegate(to: object)

        return delegateProxy
    }
}
