//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 22/02/2024.
//

import Foundation

public struct APIConfiguration {
    public let url: URL
    public let requestTimeoutInterval: TimeInterval
    public let requestRetryDelay: TimeInterval
    public let requestRetryLimit: Int
    public let urlSessionConfiguration: URLSessionConfiguration
    public let headers: HTTPHeaders

    public init(
        url string: String,
        requestTimeoutInterval: TimeInterval,
        requestRetryDelay: TimeInterval,
        requestRetryLimit: Int,
        urlSessionConfiguration: URLSessionConfiguration,
        headers: HTTPHeaders = [:]
    ) {
        guard let url = URL(string: string) else {
            fatalError("Invalid url: \(string)")
        }

        self.url = url
        self.requestTimeoutInterval = requestTimeoutInterval
        self.requestRetryDelay = requestRetryDelay
        self.requestRetryLimit = requestRetryLimit
        self.headers = headers
        self.urlSessionConfiguration = urlSessionConfiguration
        self.urlSessionConfiguration.timeoutIntervalForRequest = requestTimeoutInterval
        self.urlSessionConfiguration.timeoutIntervalForResource = requestTimeoutInterval
    }
}
