//
//  UIApplication.swift
//
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import UIKit
import Core

public extension UIApplication {
    var currentWindow: UIWindow? {
        windows.first(where: \.isKeyWindow)
    }
}

public extension UIApplication {
    static var rootViewController: UIViewController? {
        UIApplication.shared.currentWindow?.rootViewController
    }

    static var topViewController: UIViewController? {
        getTopViewController(from: rootViewController)
    }

    static var visibleViewController: UIViewController? {
        getVisibleViewController(from: rootViewController)
    }

    private static func getTopViewController(from controller: UIViewController?) -> UIViewController? {
        if let nav = controller as? UINavigationController {
            return getTopViewController(from: nav.topViewController)
        } else if let tab = controller as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(from: selected)
        } else if let split = controller as? UISplitViewController, let detail = split.viewControllers.last {
            return getTopViewController(from: detail)
        }

        return controller
    }

    private static func getVisibleViewController(from controller: UIViewController?) -> UIViewController? {
        if let nav = controller as? UINavigationController {
            return getVisibleViewController(from: nav.visibleViewController)
        } else if let tab = controller as? UITabBarController, let selected = tab.selectedViewController {
            return getVisibleViewController(from: selected)
        } else if let presented = controller?.presentedViewController {
            return getVisibleViewController(from: presented)
        }

        return controller
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

public extension UIApplication {

    private class func _share(
        _ data: [Any],
        applicationActivities: [UIActivity]?,
        setupViewControllerCompletion: ((UIActivityViewController) -> Void)?
    ) {

        let activityViewController = UIActivityViewController(activityItems: data, applicationActivities: nil)
        setupViewControllerCompletion?(activityViewController)
        UIApplication.topViewController?.present(activityViewController, animated: true, completion: nil)
    }

    class func share(
        _ data: Any...,
        applicationActivities: [UIActivity]? = nil,
        setupViewControllerCompletion: ((UIActivityViewController) -> Void)? = nil
    ) {
        _share(data, applicationActivities: applicationActivities, setupViewControllerCompletion: setupViewControllerCompletion)
    }

    class func share(
        _ data: [Any],
        applicationActivities: [UIActivity]? = nil,
        setupViewControllerCompletion: ((UIActivityViewController) -> Void)? = nil
    ) {

        _share(data, applicationActivities: applicationActivities, setupViewControllerCompletion: setupViewControllerCompletion)
    }

}
