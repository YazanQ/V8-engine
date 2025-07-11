//
//  LocalizationPlugin.swift
//
//
//  Created by Yazan Qaisi on 18/07/2024.
//

import UIKit
import Core

public struct LocalizationPlugin {
    public init() {}
}

extension LocalizationPlugin: ApplicationPlugin {
    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {
        Language.apply(for: application)
        return true
    }
}

extension Language {
    private static var direction: UISemanticContentAttribute {
        current == .english ? .forceLeftToRight : .forceRightToLeft
    }

    public static func apply(for application: UIApplication) {
        UIView.appearance().semanticContentAttribute = direction
        UIStackView.appearance().semanticContentAttribute = direction
        UILabel.appearance().semanticContentAttribute = direction
        UISegmentedControl.appearance().semanticContentAttribute = direction
        UINavigationBar.appearance().semanticContentAttribute = direction
        UISwitch.appearance().semanticContentAttribute = direction
        UIPageControl.appearance().semanticContentAttribute = direction
        UICollectionView.appearance().semanticContentAttribute = direction
        UITextField.appearance().semanticContentAttribute = direction
        UITextView.appearance().semanticContentAttribute = direction
        UINavigationBar.appearance()
        UINavigationBar.appearance().subviews.forEach { $0.semanticContentAttribute = direction }
    }
}
