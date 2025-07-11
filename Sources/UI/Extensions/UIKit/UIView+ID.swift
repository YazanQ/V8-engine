//
//  UIView+ID.swift
//  
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import UIKit

public enum ViewIdentifier: Int {
    case stateView = 1000
}

public extension UIView {
    var identifier: ViewIdentifier? {
        get { ViewIdentifier(rawValue: tag) }
        set {
            guard let value = newValue else { return }
            tag = value.rawValue
        }
    }

    func find(byId Id: ViewIdentifier) -> UIView? {
        viewWithTag(Id.rawValue)
    }
}
