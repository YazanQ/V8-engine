//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public struct AnalyticsService: AnalyticsEngine {
    private let engines: [AnalyticsEngine]

    public init(@ArrayBuilder<AnalyticsEngine> engines: @escaping () -> [AnalyticsEngine]) {
        self.engines = engines()
    }

    public func send(event: any AnalyticsEvent) {
        engines.forEach { $0.send(event: event) }
    }
}
