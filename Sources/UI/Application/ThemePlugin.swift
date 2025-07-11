//
//  ThemePlugin.swift
//
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import UIKit
import Core

public protocol Theme {
    func apply(for window: UIWindow?)
}

public struct ThemePlugin {
    private let theme: Theme

    public init(theme: Theme) {
        self.theme = theme
    }
}

extension ThemePlugin: ApplicationPlugin {
    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: 
    [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {
        theme.apply(for: application.currentWindow)
        return true
    }
}
