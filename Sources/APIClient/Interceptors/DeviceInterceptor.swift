//
//  DeviceInterceptor.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import Foundation
import Alamofire
import UIKit
import Core

public struct DeviceInterceptor: RequestInterceptor {

    // TODO: Needs More details to clarify

    public init() {}

    public func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest,any Error>
        ) -> Void
    ) {
        var urlRequest = urlRequest
        
        urlRequest.headers.add(name: "device", value: "0") // Needs more details
        urlRequest.headers.add(name: "ipad", value: UIDevice.current.userInterfaceIdiom == .pad ? "1" : "0")
        urlRequest.headers.add(name: "app_version", value: (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""))
        urlRequest.headers.add(name: "os_v", value: UIDevice.current.systemVersion)
        urlRequest.headers.add(name: "manufacturer", value: "Apple")
        urlRequest.headers.add(name: "model", value: UIDevice.current.model)
        urlRequest.headers.add(name: "night", value: AppSettings.current.isDarkMode ? "1" : "0")
        urlRequest.headers.add(name: "tz", value: Locale.current.regionCode ?? "")
        urlRequest.headers.add(name: "tz_offset", value: timeZoneOffsets())
        urlRequest.headers.add(name: "r", value: "\(currentTimeInMilliseconds())")
        completion(.success(urlRequest))
    }
}

private extension DeviceInterceptor {
    func formatGMTOffset(_ offsetInSeconds: Int) -> String {
      let sign = offsetInSeconds >= 0 ? "+" : "-"
      let hours = abs(offsetInSeconds) / 3600
      let minutes = abs(offsetInSeconds) % 3600 / 60
      return "GMT\(sign)\(String(format: "%02d", hours)):\(String(format: "%02d", minutes))"
    }

    func timeZoneOffsets() -> String {
        let currentTimeZone = TimeZone.current
        let gmtOffsetInSeconds = currentTimeZone.secondsFromGMT()
        let formattedOffset = formatGMTOffset(gmtOffsetInSeconds)
        return formattedOffset
    }

    func currentTimeInMilliseconds() -> Int64 {
      let now = Date()
      let timeInterval = now.timeIntervalSince1970
      let milliseconds = Int64(timeInterval * 1000)

      return milliseconds
    }
}
