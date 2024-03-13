//
//  UIApplication.swift
//
//
//  Created by Yazan Qaisi on 13/03/2024.
//

import UIKit
import Core

public extension UIApplication {
    var currentWindow: UIWindow? {
        windows.first(where: \.isKeyWindow)
    }
}

public extension UIApplication {
    static func plugin<Plugin: ApplicationPlugin>(ofType type: Plugin.Type) -> Plugin? {
        (shared.delegate as? ApplicationPluggableDelegate)?
            .pluginInstances
            .compactMap { $0 as? Plugin }
            .first
    }
}
