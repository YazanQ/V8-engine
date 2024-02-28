//
//  Core+Injection.swift
//  
//
//  Created by Yazan Qaisi Trend on 28/02/2024.
//

import Foundation
import Resolver

public extension Resolver {
    static func registerCore() {
        register { KeychainOAuthCredentialStore() as OAuthCredentialStore }
        register { DefaultLogoutService() as LogoutService }
    }
}
