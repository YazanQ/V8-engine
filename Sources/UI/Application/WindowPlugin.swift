//
//  WindowPlugin.swift
//
//
//  Created by Yazan Qaisi on 13/03/2024.
//

import UIKit
import Core

public protocol WindowDelegate: AnyObject {
    var window: UIWindow? { get set }
}

public final class WindowPlugin {
    private weak var delegate: WindowDelegate?
    private weak var rootViewController: UIViewController?
    private let rootNavigationController: UINavigationController
    private let isNavigationBarHidden: Bool

    public init(
        delegate: WindowDelegate? = nil,
        rootViewController: UIViewController,
        isNavigationBarHidden: Bool
    ) {
        self.delegate = delegate
        self.rootViewController = rootViewController
        self.rootNavigationController = .init(rootViewController: rootViewController)
        self.isNavigationBarHidden = isNavigationBarHidden
    }

    public func setRootViewController(
        _ rootViewController: UIViewController,
        isNavigationBarHidden: Bool
    ) {
        if delegate?.window == nil {
            let window = UIWindow(frame: UIScreen.main.bounds)
            (rootViewController as? UINavigationController)?.isNavigationBarHidden = isNavigationBarHidden
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
            delegate?.window = window
        } else {
            rootNavigationController.setViewControllers([rootViewController], animated: false)
            rootNavigationController.isNavigationBarHidden = isNavigationBarHidden
        }
    }
}

extension WindowPlugin: ApplicationPlugin {
    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {
        setRootViewController(rootNavigationController, isNavigationBarHidden: isNavigationBarHidden)
        return true
    }
}

extension ApplicationPluggableDelegate: WindowDelegate {}
