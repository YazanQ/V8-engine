//
//  XIBLocalizable.swift
//
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import UIKit

public extension UILabel {
    @IBInspectable var localizationKey: String? {
        get { nil }
        set(key) { text = key?.localized }
    }
}

public extension UIButton {
    @IBInspectable var localizationKey: String? {
        get { nil }
        set(key) { setTitle(key?.localized, for: .normal) }
    }
}

public extension UINavigationItem {
    @IBInspectable var localizationKey: String? {
        get { nil }
        set(key) { title = key?.localized }
    }
}

public extension UIBarItem {
    @IBInspectable var localizationKey: String? {
        get { nil }
        set(key) { title = key?.localized }
    }
}

public extension UISegmentedControl {
    @IBInspectable var localizationKey: String? {
        get { nil }
        set(keys) {
            guard let keys = keys?.components(separatedBy: ","),
                  !keys.isEmpty else { return }
            for (index, title) in keys.enumerated() {
                setTitle(title.localized, forSegmentAt: index)
            }
        }
    }
}
