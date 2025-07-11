//
//  APIClient.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public protocol APIClient: AnyObject {
    var configuration: APIConfiguration { get }

    func execute<Request: APIRequest>(_ request: Request) async throws -> APIResponse<Request.Response>
}
