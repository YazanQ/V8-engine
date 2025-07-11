//
//  FormButton.swift
//  
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import UIKit
import Core

public class FormButton: UIButton {

    private var action: Handler?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        configure()
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    public override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.4 : 1
        }
    }

    @discardableResult
    public func setAction(_ action: @escaping Handler) -> Self {
        self.action = action
        return self
    }

    @IBAction private func didTapButton(_ sender: UIButton) {
        action?()
    }
}
public extension FormButton {
    func configure(with style: FormButtonStyle = .default) {
        if #available(iOS 15.0, *) { configuration = nil }
        setTitleColor(style.textColor, for: .normal)
        tintColor = style.tintColor
        titleLabel?.font = style.titleFont
        backgroundColor = style.backgroundColor
        layer.cornerRadius = style.cornerRadius ?? layer.cornerRadius
        layer.borderColor = style.borderColor?.cgColor ?? layer.borderColor
        layer.borderWidth = style.borderWidth ?? layer.borderWidth
        circleCorner = style.circleCorner
    }
}
