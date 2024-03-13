//
//  UIActivityIndicatorView.swift
//
//
//  Created by Yazan Qaisi on 07/03/2024.
//

import UIKit

public extension UIActivityIndicatorView {
    var radius: CGFloat {
        get { frame.width / 2 }
        set {
            frame.size = CGSize(width: 2 * newValue, height: 2 * newValue)
            setNeedsDisplay()
        }
    }
}
