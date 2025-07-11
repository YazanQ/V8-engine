//
//  APIClient+Injection.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation
import Alamofire
import AlamofireNetworkActivityLogger
import Core
import Configuration
import Resolver

private extension Resolver {
    static func registerAPIConfiguration() {
        register(APIConfiguration.self) {
            .init(
                url: Config.apiURL,
                requestTimeoutInterval: Config.requestTimeoutInterval,
                requestRetryDelay: Config.requestRetryDelay,
                requestRetryLimit: Config.requestRetryLimit,
                urlSessionConfiguration: .af.default
            )
        }.scope(.application)
    }

    static func registerNetworkLogger() {
        register { NetworkActivityLogger.shared }.scope(.application)
    }
}

public extension Resolver {
    static func registerAPIClient(
        @ArrayBuilder<RequestInterceptor> interceptors: @escaping () -> [RequestInterceptor] = { [] }
    ) {
        registerAPIConfiguration()
        registerNetworkLogger()
        register(APIClient.self) {
            DefaultAPIClient(configuration: resolve(), interceptors: interceptors)
        }.scope(.application)
    }
}

