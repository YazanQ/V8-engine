//
//  RouterPlugin.swift
//
//
//  Created by Yazan Qaisi on 13/03/2024.
//

import UIKit
import Core

public struct RouterPlugin {
    private let navigations: [AppNavigationProxy]

    public init(@ArrayBuilder<AppNavigationProxy> navigations: @escaping () -> [AppNavigationProxy]) {
        self.navigations = navigations()
    }
}

extension RouterPlugin: ApplicationPlugin {
    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {
        Router.default.setupAppNavigations(navigations)
        return true
    }
}
