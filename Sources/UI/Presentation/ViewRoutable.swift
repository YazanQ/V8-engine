//
//  ViewRoutable.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import Core
import UIKit

public protocol ViewRoutable: AnyObject {
    func navigate(to route: Route, presentationType: PresentationType)
    func navigate(
        to route: Route,
        presentationType: PresentationType,
        modelPresentation: UIModalPresentationStyle,
        modelTransitionStyle: UIModalTransitionStyle,
        animated: Bool
    )
    func pop(to route: Route)
    func popToRootView()
    func dismissView()
    func dismissView(complation: @escaping Handler)
}

public extension ViewRoutable where Self: UIViewController {
    func navigate(to route: Route, presentationType: PresentationType) {
        navigate(
            to: route,
            presentationType: presentationType,
            modelPresentation: .automatic,
            modelTransitionStyle: .coverVertical,
            animated: true
        )
    }

    func navigate(
        to route: Route,
        presentationType: PresentationType,
        modelPresentation: UIModalPresentationStyle,
        modelTransitionStyle: UIModalTransitionStyle,
        animated: Bool
    ) {
        Router.default.navigate(
            to: route,
            from: self,
            presentationType: presentationType,
            modalPresentationStyle: modelPresentation,
            modalTransitionStyle: modelTransitionStyle,
            animated: animated
        )
    }
    func pop(to route: Route) {
        guard let viewController = Router.default.viewController(for: route) else { return }
        navigationController?.popToViewController(ofClass: type(of: viewController))
    }
    func popToRootView() {
        navigationController?.popToRootViewController(animated: true)
    }

    func dismissView() {
        dismiss(animated: true) {}
    }

    func dismissView(complation: @escaping Handler) {
        dismissView(animated: true, complation: complation)
    }

    private func dismissView(animated: Bool, complation: @escaping Handler) {
        guard let navigationController = navigationController else {
            return
        }

        guard navigationController.viewControllers.count > 1 else {
            return
        }

        navigationController.popViewController(animated: true, completion: complation)
    }
}
