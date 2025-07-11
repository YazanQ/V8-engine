//
//  AppSettingsPlugin.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import Foundation
import UIKit
import Core

public struct AppSettingsPlugin {
    public init() {}
}

extension AppSettingsPlugin {
    func initAppSettings() {
        // Do what every you want here with the app settings before it be called
    }
}

extension AppSettingsPlugin: ApplicationPlugin {
    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {
        initAppSettings()
        return true
    }
}
