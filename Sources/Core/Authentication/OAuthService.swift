//
//  OAuthService.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import Foundation

public protocol OAuthService {
    func refresh(with refreshToken: String) async throws -> OAuthCredential
}
