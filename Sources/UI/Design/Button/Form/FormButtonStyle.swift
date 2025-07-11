//
//  FormButtonStyle.swift
//
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import UIKit

public struct FormButtonStyle {
    public var textColor: UIColor?
    public var titleFont: UIFont?
    public var tintColor: UIColor?
    public var backgroundColor: UIColor?
    public var borderColor: UIColor?
    public var borderWidth: CGFloat?
    public var cornerRadius: CGFloat?
    public var circleCorner = false
}

public extension FormButtonStyle {
    static var `default` = FormButtonStyle()
}
