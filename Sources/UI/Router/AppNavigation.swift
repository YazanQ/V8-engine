//
//  AppNavigation.swift
//
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import UIKit
import Core

public protocol AppNavigationProxy {
    var route: Route.Type { get }

    func viewController(for route: Route) -> UIViewController
}

public extension AppNavigationProxy where Self: AppNavigation {
    var route: Route.Type { RouteType.self }

    func viewController(for route: any Route) -> UIViewController {
        guard let route = route as? RouteType else {
            fatalError("Expected route of type \(RouteType.self)")
        }
        return viewController(for: route)
    }
}

extension AppNavigationProxy {
    func navigate(
        to route: Route,
        from sourceViewController: UIViewController,
        to destinationViewController: UIViewController,
        presentationType: PresentationType,
        modalPresentationStyle: UIModalPresentationStyle = .automatic,
        modalTransitionStyle: UIModalTransitionStyle,
        animated: Bool = true
    ) {
        switch presentationType {
        case .push:
//            sourceViewController.navigationItem.backButtonTitle = Language.current == .english ? "Back" : "العودة"
//             sourceViewController.navigationController?.viewControllers.first?.navigationItem.backButtonTitle =  Language.current == .english ? "Back" : "العودة"
            sourceViewController.navigationController?.pushViewController(destinationViewController, animated: animated)

        case .present:
            destinationViewController.modalPresentationStyle = modalPresentationStyle
            destinationViewController.modalTransitionStyle = modalTransitionStyle
            destinationViewController.isModalInPresentation = true
            sourceViewController.present(destinationViewController, animated: animated)

        case let .presentNavigation(isHidden):
            destinationViewController.navigationController?.setNavigationBarHidden(isHidden, animated: false)
            let navigationController = UINavigationController(rootViewController: destinationViewController)
            navigationController.modalPresentationStyle = modalPresentationStyle
            sourceViewController.navigationController?.present(navigationController, animated: animated)

        case let .root(isNavigationBarHidden):
            let windowPlugin = UIApplication.plugin(ofType: WindowPlugin.self)
            windowPlugin?.setRootViewController(destinationViewController, isNavigationBarHidden: isNavigationBarHidden)
        }
    }
}
public protocol AppNavigation: AppNavigationProxy {
    associatedtype RouteType: Route

    func viewController(for route: RouteType) -> UIViewController
}
