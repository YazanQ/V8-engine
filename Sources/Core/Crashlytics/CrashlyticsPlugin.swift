//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation
import Resolver

public struct CrashlyticsPlugin: ApplicationPlugin {
    @Injected private var crashlytics: CrashlyticsService

    public init(userID: Int? = nil) {
        addUserInfoToCrashlyticsLog(userID: userID)
    }

    private func addUserInfoToCrashlyticsLog(userID: Int?) {
        if let userID {
            crashlytics.setUserId(.init(userID))
        }

        crashlytics.setValue(Locale.current.identifier, forKey: "device-local")
        crashlytics.setValue(Language.current.rawValue, forKey: "preferred-app-language")
    }
}
