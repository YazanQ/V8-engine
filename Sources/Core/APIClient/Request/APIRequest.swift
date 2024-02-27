//
//  APIRequest.swift
//
//
//  Created by Yazan Qaisi on 22/02/2024.
//

import Foundation

public protocol APIRequest {
    associatedtype Response: Decodable

    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var urlParameters: Encodable? { get }
    var body: Encodable? { get }
    var multipartFormItems: [MultipartFormItem] { get }
}

public extension APIRequest {
    var headers: HTTPHeaders? { nil }
    var urlParameters: Encodable? { nil }
    var body: Encodable? { nil }
    var multipartFormItems: [MultipartFormItem] { [] }
}

public extension APIRequest {
    func urlRequest(for configuration: APIConfiguration) -> URLRequest {
        var urlRequest = URLRequest(url: url(in: configuration))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers(in: configuration)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.timeoutInterval = configuration.requestTimeoutInterval
        if let body = body { urlRequest.httpBody = try? body.encode() }
        return urlRequest
    }
}

private extension APIRequest {
    func url(in configuration: APIConfiguration) -> URL {
        let url = configuration.url.appendingPathComponent(path)
        let parameters = try? urlParameters?.encode().json
        return url.appendingQueryItems(parameters ?? [:])
    }

    func headers(in configuration: APIConfiguration) -> HTTPHeaders {
        var allHeaders = configuration.headers
        headers?.forEach { allHeaders[$0.key] = $0.value }
        return allHeaders
    }
}
