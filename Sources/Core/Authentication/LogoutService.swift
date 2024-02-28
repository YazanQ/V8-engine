//
//  LogoutService.swift
//
//
//  Created by Yazan Qaisi on 28/02/2024.
//

import Foundation
import Resolver

public protocol LogoutService {
    func logout()
}

public struct DefaultLogoutService {
    @Injected private var credentialStore: OAuthCredentialStore
}

extension DefaultLogoutService: LogoutService {
    public func logout() {
        credentialStore.credential = nil
    }
}
