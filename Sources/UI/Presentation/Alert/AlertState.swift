//
//  AlertState.swift
//  
//
//  Created by Yazan Qaisi on 31/07/2024.
//

import Foundation

public enum AlertState {
    case message(body: String)
    case confirm(title: String, message: String, action: AlertConfiguration.AlertAction)
    case custom(settings: AlertConfiguration)
}
