//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public struct CrashlyticsService: CrashlyticsEngine {
    private let engines: [CrashlyticsEngine]

    public init(@ArrayBuilder<CrashlyticsEngine> engines: @escaping () -> [CrashlyticsEngine]) {
        self.engines = engines()
    }

    public func setUserId(_ userID: String?) {
        engines.forEach { $0.setUserId(userID) }
    }

    public func setValue(_ value: Any?, forKey key: String) {
        engines.forEach { $0.setValue(value, forKey: key) }
    }
}
