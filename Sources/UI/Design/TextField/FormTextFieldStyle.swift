//
//  FormTextFieldStyle.swift
//
//
//  Created by Yazan Qaisi on 25/07/2024.
//

import UIKit

public struct FormTextFieldStyle {
    public var placeholder: String?
    public var textColor: UIColor?
    public var textFont: UIFont?
    public var backgroundColor: UIColor?
    public var borderStyle: UITextField.BorderStyle?
    public var borderWidth: CGFloat?
    public var borderColor: UIColor?
    public var cornerRadius: CGFloat?
    public var leftView: UIView?
    public var rightView: UIView?
    public var padding: CGFloat?
}

public extension FormTextFieldStyle {
    static var `default` = FormTextFieldStyle()
}
