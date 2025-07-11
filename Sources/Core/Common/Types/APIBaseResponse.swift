//
//  APIBaseResponse.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public struct APIBaseResponse<T: Decodable>: Decodable {
    public let data: T?
    public let error: CoreError?
    public let statusCode: Int?
    public let message: String?
    public let timestamp: String?
    public let isNext: Bool?
    public let currentPage: Int?
    public let pageSize: Int?
    public var totalItems: Int?
    public var previous: Int?

    @discardableResult
    public func unwrap() throws -> T {
        try error.throwIfSome()

        return try data.unwrap(throwing: CoreError(message: message, code: statusCode))
    }
}
