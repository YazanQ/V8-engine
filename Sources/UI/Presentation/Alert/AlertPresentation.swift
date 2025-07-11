//
//  AlertPresentation.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import Foundation
import Core
import UIKit

public protocol AlertPresentation: AnyObject {
    func showAlert(state: AlertState)
}

public extension AlertPresentation where Self: UIViewController {
    func showAlert(state: AlertState) {
        var alert: UIAlertController
        switch state {
        case let .message(body):
            alert = UIAlertController(title: "حدث خطأ ما", message: body, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "الاستمرار", style: .default))

        case let .confirm(title, message, action):
            alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: action.title, style: action.style, handler: action.action))
            alert.addAction(UIAlertAction(title: "الغاء", style: .cancel, handler: nil))

        case let .custom(settings):
            alert = UIAlertController(
                title: settings.title,
                message: settings.message,
                preferredStyle: settings.style
            )
            settings.actions.forEach { alert.addAction(UIAlertAction(title: $0.title, style: $0.style, handler: $0.action))}
        }
        present(alert, animated: true)
    }

}
