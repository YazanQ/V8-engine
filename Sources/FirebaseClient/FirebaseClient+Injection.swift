//
//  FirebaseClient+Injection.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation
import Resolver
import Core

private extension Resolver {
    static func registerCrashlyticsService() {
        register(CrashlyticsService.self) {
            CrashlyticsService {
                FirebaseCrashlyticsEngine(crashlytics: .crashlytics())
            }
        }.scope(.application)
    }

    static func registerAnalyticsService() {
        register(AnalyticsEventMapper.self) {
            SnakeCaseAnalyticsEventMapper()
        }.scope(.application)

        register(AnalyticsService.self) {
            AnalyticsService {
                DefaultAnalyticsEngine()
                FirebaseAnalyticsEngine()
            }
        }.scope(.application)
    }

    static func registerMessagingService() {
        register(NotificationMessagingService.self) {
            FirebaseNotificationMessagingService()
        }.scope(.application)
    }

    static func registerRemoteConfiguration() {
        // TODO: Add Remote Configuration
    }
}

public extension Resolver {
    static func registerFirebaseClient() {
        registerCrashlyticsService()
        registerAnalyticsService()
        registerMessagingService()
    }
}
