//
//  Core+Injection.swift
//  
//
//  Created by Yazan Qaisi on 28/05/2024.
//

import Foundation
import Resolver

public extension Resolver {
    static func registerCore() {
        register { KeychainOAuthCredentialStore() as OAuthCredentialStore }
        register { DefaultLogoutService() as LogoutService }
    }
}
