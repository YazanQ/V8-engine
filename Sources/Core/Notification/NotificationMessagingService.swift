//
//  NotificationMessagingService.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public protocol NotificationMessagingService {
    func start()

    func token() async throws -> String
    func setDeviceToken(_ deviceToken: Data)
    func removeToken() async throws
    func subscribe(to topic: String)
    func unscribe(from topic: String)
}
