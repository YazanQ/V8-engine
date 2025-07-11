//
//  FirebaseNotificationMessagingService.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation
import FirebaseMessaging
import Core

public final class FirebaseNotificationMessagingService: NSObject {
    private let messaging: Messaging

    public init(messaging: Messaging = .messaging()) {
        self.messaging = messaging
    }
}
extension FirebaseNotificationMessagingService: NotificationMessagingService {
    public func start() {
        messaging.delegate = self
    }

    public func token() async throws -> String {
        try await messaging.token()
    }

    public func setDeviceToken(_ deviceToken: Data) {
        messaging.apnsToken = deviceToken
    }

    public func removeToken() async throws {
        try await messaging.deleteToken()
    }

    public func subscribe(to topic: String) {
        messaging.subscribe(toTopic: topic)
    }

    public func unscribe(from topic: String) {
        messaging.unsubscribe(fromTopic: topic)
    }
}

extension FirebaseNotificationMessagingService: MessagingDelegate {
    public func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("""
        -----------------------
        MessagingService - did receive FCM token:\(fcmToken.defaultIfEmpty)
        """)
    }
}
