//
//  FormTextField.swift
//
//
//  Created by Yazan Qaisi on 25/07/2024.
//

import UIKit

public class FormTextField: UITextField {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        configure()
    }
}

public extension FormTextField {
    func configure(with style: FormTextFieldStyle = .default) {
        self.delegate = self
        textColor = style.textColor
        font = style.textFont
        backgroundColor = style.backgroundColor
        borderColor = style.borderColor
        borderWidth = style.borderWidth ?? .zero
        borderStyle = style.borderStyle ?? .none
        cornerRadius = style.cornerRadius ?? .zero
        leftView = style.leftView
        rightView = style.rightView
        setLeftPaddingPoints(style.padding ?? .zero)
        setRightPaddingPoints(style.padding ?? .zero)
    }
}

extension FormTextField: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self.borderColor = .systemGreen
        self.borderWidth = 1.5
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        self.borderWidth = 0
    }
}
