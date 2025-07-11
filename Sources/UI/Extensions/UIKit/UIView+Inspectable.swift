//
//  UIView+Inspectable.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//
// swiftlint:disable ui_color_prohibited
//

import UIKit

public extension UIView {
    @IBInspectable var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        } set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
    }

    @IBInspectable var circleCorner: Bool {
        get { min(bounds.size.height, bounds.size.width) / 2 == cornerRadius }
        set { cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius }
    }
}

public extension UIView {
    @IBInspectable
    var shadowRadius: CGFloat {
        get { layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }

    @IBInspectable
    var shadowOpacity: Float {
        get { layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }

    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
