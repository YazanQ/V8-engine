//
//  OAuthCredentialStore.swift
//
//
//  Created by Yazan Qaisi on 25/02/2024.
//

import Foundation

public protocol OAuthCredentialStore: AnyObject {
    var credential: OAuthCredential? { get set }
}

public final class KeychainOAuthCredentialStore: OAuthCredentialStore {
    @Keychain(key: "auth-credential")
    public var credential: OAuthCredential?

    public init() {}
}
