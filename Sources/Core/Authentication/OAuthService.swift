//
//  OAuthService.swift
//
//
//  Created by Yazan Qaisi on 25/02/2024.
//

import Foundation

public protocol OAuthService {
    func refresh(with refreshToken: String) async throws -> OAuthCredential
}
