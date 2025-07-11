//
//  CrashlyticsEngine.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public protocol CrashlyticsEngine {
    func setUserId( _ userID: String?)
    func setValue(_ value: Any?, forKey key: String)
}
