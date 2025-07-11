//
//  NotificationHandler.swift
//  
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public protocol NotificationHandler: ErrorHandler {
    var category: String { get }

    func handle(payload: NotificationPayload) throws
}

public extension NotificationHandler {
    func handle(error: Error) { }
}
