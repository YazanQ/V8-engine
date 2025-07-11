//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation
import Resolver

public struct DefaultAnalyticsEngine {
    @Injected private var eventMapper: AnalyticsEventMapper

    public init() {}
}

extension DefaultAnalyticsEngine: AnalyticsEngine {
    public func send(event: any AnalyticsEvent) {
        let name = eventMapper.name(for: event.name)
        let parameters = eventMapper.parameters(for: event.parameters)

        print("Analytics Send Event name: \(name) with Parameters: \(parameters)")
    }
}
