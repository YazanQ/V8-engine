//
//  UniversalLink.swift
//
//
//  Created by Yazan Qaisi on 27/05/2024.
//

import Foundation

public struct UniversalLink {
    public let id: String?
    public let actionType: ActionType?
    public let lang: String?

    public init(queryItems: [URLQueryItem]) {
        self.id = queryItems.first { $0.name == "id" }?.value
        self.actionType = ActionType(rawValue: queryItems.first { $0.name == "url" }?.value ?? "")
        self.lang = queryItems.first { $0.name == "lang" }?.value
    }

    public init(path: String) {
        let paths = path.split(separator: "/").map { String($0) }
        let action = paths.first

        self.actionType = ActionType(rawValue: "\(action ?? "")")
        self.id = paths.last
        self.lang = Language.current.rawValue
    }
}

public extension UniversalLink {
    struct ActionType {
        public let rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}
