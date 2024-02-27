//
//  NetworkLoggerPlugin.swift
//
//
//  Created by Yazan Qaisi on 25/02/2024.
//

import Foundation
import Core
import AlamofireNetworkActivityLogger
import Resolver

public struct NetworkLoggerPlugin: ApplicationPlugin {
    @Injected private var logger: NetworkActivityLogger

    public init(level: NetworkActivityLoggerLevel) {
        logger.level = level
        logger.startLogging()
    }
}
