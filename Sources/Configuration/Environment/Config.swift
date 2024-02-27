//
//  Config.swift
//
//
//  Created by Yazan Qaisi on 25/02/2024.
//

import Foundation
import Core

public enum Config {
    @XcodeConfig(key: "API_URL")
    public static var apiURL: String

    @XcodeConfig(key: "REQUEST_TIMEOUT_INTERVAL")
    public static var requestTimeoutInterval: TimeInterval

    @XcodeConfig(key: "PAGE_SIZE")
    public static var pageSize: Int

    @XcodeConfig(key: "REQUEST_RETRY_Limit")
    public static var requestRetryLimit: Int

    @XcodeConfig(key: "REQUEST_RETRY_DELEY")
    public static var requestRetryDelay: TimeInterval
}
