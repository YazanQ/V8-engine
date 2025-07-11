//
//  FirebaseCrashLyticsEngine.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation
import Core
import FirebaseCrashlytics

public struct FirebaseCrashlyticsEngine {
    private let crashlytics: Crashlytics

    public init(crashlytics: Crashlytics) {
        self.crashlytics = crashlytics
    }
}

extension FirebaseCrashlyticsEngine: CrashlyticsEngine {
    public func setUserId(_ userID: String?) {
        crashlytics.setUserID(userID)
    }

    public func setValue(_ value: Any?, forKey key: String) {
        crashlytics.setCustomValue(value, forKey: key)
    }
}

//extension Crashlytics: CrashlyticsEngine {}
