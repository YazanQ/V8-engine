//
//  NotificationPayload.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation
import AnyCodable

public struct NotificationPayload: Decodable {
    public let aps: APS
    public let info: [String: AnyCodable]?

    public func value<T: Decodable>() throws -> T {
        try info.unwrap().encode().decode()
    }

    public enum CodingKeys: String, CodingKey {
        case aps
        case info
    }
}

public extension NotificationPayload {
    struct APS: Decodable {
        public let alert: Alert
        public let category: String
    }
}

public extension NotificationPayload {
    struct Alert: Decodable {
        public let title: String
        public let body: String
    }
}
