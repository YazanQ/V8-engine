//
//  OAuthHeadersAdapter.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import Foundation

public protocol OAuthHeadersAdapter {
    func adapt(headers: inout HTTPHeaders)
}
