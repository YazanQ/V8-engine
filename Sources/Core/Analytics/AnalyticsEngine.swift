//
//  AnalyticsEngine.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public protocol AnalyticsEngine {
    func send(event: AnalyticsEvent)
}
