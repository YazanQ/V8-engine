//
//  Router.swift
//
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import UIKit
import Core

public final class Router {
    public static let `default` = Router()

    private var appNavigations = [String: AppNavigationProxy]()

    private init() {}

    public func setupAppNavigations(_ appNavigationsProxies: [AppNavigationProxy]) {
        appNavigationsProxies.forEach { appNavigations[.init(describing: $0.route)] = $0 }
    }

    public func viewController(for route: Route) -> UIViewController? {
        guard let navigation = appNavigations[.init(describing: type(of: route))] else {
            return nil
        }

        return navigation.viewController(for: route)
    }

    public func navigate(
        to route: Route,
        from sourceViewController: UIViewController,
        presentationType: PresentationType,
        modalPresentationStyle: UIModalPresentationStyle,
        modalTransitionStyle: UIModalTransitionStyle,
        animated: Bool
    ) {
        let route = (route as? AnyRoute)?.route ?? route
        let key = String(describing: type(of: route))
        guard let appNavigation = appNavigations[key] else {
            fatalError("Please register \(key) in AppDelegate's RouterPlugin")
        }

        let destinationViewController = appNavigation.viewController(for: route)
        destinationViewController.route = route
        appNavigation.navigate(
            to: route,
            from: sourceViewController,
            to: destinationViewController,
            presentationType: presentationType,
            modalPresentationStyle: modalPresentationStyle,
            modalTransitionStyle: modalTransitionStyle,
            animated: animated
        )
    }
}

public extension UIViewController {
    private enum AssociatedKeys {
        static var route = "route-key"
    }

    var route: Route? {
        get { associatedValue(for: &AssociatedKeys.route) }
        set { setAssociatedValue(newValue, for: &AssociatedKeys.route) }
    }
}
