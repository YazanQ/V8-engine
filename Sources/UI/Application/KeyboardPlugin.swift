//
//  KeyboardPlugin.swift
//
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import Foundation
import IQKeyboardManagerSwift
import Core
import UIKit

public struct KeyboardPlugin {
    private let manager: KeyboardManager

    public init(manager: KeyboardManager = IQKeyboardManager.shared) {
        self.manager = manager
    }
}

extension KeyboardPlugin: ApplicationPlugin {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        manager.enable = true
        manager.enableAutoToolbar = true
        manager.shouldResignOnTouchOutside = true
        return true
    }
}

extension IQKeyboardManager: KeyboardManager {}
