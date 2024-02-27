//
//  OAuthCredential.swift
//
//
//  Created by Yazan Qaisi on 25/02/2024.
//

import Foundation

public struct OAuthCredential: Codable {
    public let accessToken: String
    public let refreshToken: String

    public init(
        accessToken: String,
        refreshToken: String
    ) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }

    enum CodingKeys: String, CodingKey {
        case accessToken = "token"
        case refreshToken
    }
}
