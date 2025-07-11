//
//  UINavigationController.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import Foundation
import UIKit

public extension UINavigationController {
    var previousViewController: UIViewController? {
        viewControllers[viewControllers.count - 2]
    }

    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let controller = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(controller, animated: animated)
        }
    }

    func popViewController(animated: Bool = true, completion: (() -> Void)? = nil) {
        popViewController(animated: animated)

        guard let completion = completion else { return }

        guard let coordinator = transitionCoordinator, animated else {
            completion()
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in
            completion()
        }
    }
}
