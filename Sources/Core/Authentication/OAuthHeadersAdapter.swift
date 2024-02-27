//
//  OAuthHeadersAdapter.swift
//
//
//  Created by Yazan Qaisi on 25/02/2024.
//

import Foundation

public protocol OAuthHeadersAdapter {
    func adapt(headers: inout HTTPHeaders)
}
