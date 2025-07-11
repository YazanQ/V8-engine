//
//  AppSettings.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import Foundation

public struct AppSettings: Codable {
    public var isDarkMode: Bool = false
}

public extension AppSettings {
    @UserDefault(key: "app-settings")
    static var current = AppSettings()
}
