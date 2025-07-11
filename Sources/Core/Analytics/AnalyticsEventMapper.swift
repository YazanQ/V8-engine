//
//  AnalyticsEventMapper.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public protocol AnalyticsEventMapper {
    func name(for eventName: String) -> String
    func parameters(for parameters: [String: String]) -> [String: String]
}

public struct SnakeCaseAnalyticsEventMapper: AnalyticsEventMapper {

    public init() {}
    
    public func name(for eventName: String) -> String {
        String(describing: eventName).camelCaseToSnakeCase()
    }

    public func parameters(for parameters: [String : String]) -> [String : String] {
        Dictionary(uniqueKeysWithValues: parameters.map { ($0.key.camelCaseToSnakeCase(), $0.value) })
    }
}
