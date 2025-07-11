//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public protocol AnalyticsEvent {
    typealias Parameter = [String: String]

    var name: String { get }
    var parameters: Parameter { get }
    var engine: Engine { get }
}

public extension AnalyticsEvent {
    var parameters: Parameter { [:] }
    var engine: Engine { .default }
}

public enum Engine {
    case `default`
}
