//
//  FirebaseAnalyticsEngine.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation
import FirebaseAnalytics
import Core
import Resolver

public struct FirebaseAnalyticsEngine {
    @Injected private var eventMapper: AnalyticsEventMapper
}

extension FirebaseAnalyticsEngine: AnalyticsEngine {
    public func send(event: AnalyticsEvent) {
        let name = eventMapper.name(for: event.name)
        let parameters = eventMapper.parameters(for: event.parameters)

        Analytics.logEvent(name, parameters: parameters)
    }
}
