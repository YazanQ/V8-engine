//
//  RequestBuilder.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public struct Request<Response: Decodable>: APIRequest {
    public let path: String
    public let method: HTTPMethod
    public let headers: HTTPHeaders?
    public let urlParameters: Encodable?
    public let body: Encodable?
    public let multipartFormItems: [MultipartFormItem]
}

public final class RequestBuilder<Response: Decodable> {
    private var path: String = ""
    private var method: HTTPMethod = .get
    private var headers: HTTPHeaders?
    private var urlParameters: Encodable?
    private var body: Encodable?
    private var version: String = "v1"
    private var multipartFormItems: [MultipartFormItem] = []

    public init() {}

    @discardableResult
    public func path(_ path: String) -> Self {
        self.path = "\(version)/\(path)"
        return self
    }

    @discardableResult
    public func method(_ method: HTTPMethod) -> Self {
        self.method = method
        return self
    }

    @discardableResult
    public func headers(_ headers: HTTPHeaders) -> Self {
        self.headers = headers
        return self
    }

    @discardableResult
    public func urlParameters(_ urlParameters: Encodable) -> Self {
        self.urlParameters = urlParameters
        return self
    }

    @discardableResult
    public func body(_ body: Encodable) -> Self {
        self.body = body
        return self
    }

    @discardableResult
    public func version(_ version: String) -> Self {
        self.version = version
        return self
    }

    @discardableResult
    public func multipartFormItems(_ multipartFormItems: [MultipartFormItem]) -> Self {
        self.multipartFormItems = multipartFormItems
        return self
    }

    @discardableResult
    public func multipartFormItem(_ multipartFormItem: MultipartFormItem) -> Self {
        self.multipartFormItems.append(multipartFormItem)
        return self
    }

    public func build() -> Request<Response> {
        .init(
            path: path,
            method: method,
            headers: headers,
            urlParameters: urlParameters,
            body: body,
            multipartFormItems: multipartFormItems
        )
    }
}
