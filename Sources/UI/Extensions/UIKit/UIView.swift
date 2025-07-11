//
//  UIView.swift
//
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import UIKit

public extension UIView {
    func loadFromNib(using bundle: Bundle?) {
        let defaultBundle = Bundle(for: type(of: self))
        guard
            let subView = UINib(nibName: "\(type(of: self))", bundle: bundle ?? defaultBundle)
                .instantiate(withOwner: self, options: nil).first as? UIView
        else { return }

        subView.frame = bounds
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addSubview(subView)
    }

    static func loadFromNib(named name: String, bundl: Bundle) -> UIView {
        let nib = UINib(nibName: name, bundle: bundl)
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? UIView else {
            fatalError("Could not instantiate view")
        }
        return view
    }
}

public extension UIView {
    func addStretchedSubView(to parentView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
        let views = ["subview": self]

        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subview]", options: .directionLeadingToTrailing, metrics: nil, views: views))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subview]", options: .directionLeadingToTrailing, metrics: nil, views: views))
    }
}
