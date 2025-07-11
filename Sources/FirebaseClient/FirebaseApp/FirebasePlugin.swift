//
//  FirebasePlugin.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation
import Firebase
import Core

public struct FirebasePlugin: ApplicationPlugin {
    public init(loggerLevel level: FirebaseLoggerLevel) {
        FirebaseConfiguration.shared.setLoggerLevel(level)
        FirebaseApp.configure()
    }
}
