//
//  AlertConfiguration.swift
//
//
//  Created by Yazan Qaisi on 31/07/2024.
//

import Foundation
import UIKit

public struct AlertConfiguration {
    let title: String
    let message: String?
    let style: UIAlertController.Style = .alert
    let actions: [AlertAction]

    public init(
        title: String,
        message: String?,
        actions: [AlertAction]
    ) {
        self.title = title
        self.message = message
        self.actions = actions
    }
}

public extension AlertConfiguration {
    struct AlertAction {
        let title: String
        let style: UIAlertAction.Style
        let action: (UIAlertAction) -> Void

        public init(
            title: String,
            style: UIAlertAction.Style,
            action: @escaping (
                UIAlertAction
            ) -> Void
        ) {
            self.title = title
            self.style = style
            self.action = action
        }
    }
}
