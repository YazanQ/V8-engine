//
//  ApplicationPluggableDelegate.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import UIKit

public protocol ApplicationPlugin {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication)
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication)

    func applicationWillTerminate(_ application: UIApplication)
    func applicationDidReceiveMemoryWarning(_ application: UIApplication)

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any])
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)
}

public extension ApplicationPlugin {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { true }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { true }
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool { false }

    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {}
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {}

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {}
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {}
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {}

}

open class ApplicationPluggableDelegate: UIResponder, UIApplicationDelegate {
    public var window: UIWindow?

    public private(set) lazy var pluginInstances: [ApplicationPlugin] = plugins()

    override public init() {
        super.init()

        _ = pluginInstances
    }

    open func plugins() -> [ApplicationPlugin] { [] }
}

extension ApplicationPluggableDelegate {
    open func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // swiftlint:disable:next reduce_boolean
        pluginInstances.reduce(true) {
            $0 && $1.application(application, willFinishLaunchingWithOptions: launchOptions)
        }
    }

    open func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // swiftlint:disable:next reduce_boolean
        pluginInstances.reduce(true) {
            $0 && $1.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
    }

    open func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
    ) -> Bool {
        // swiftlint:disable:next reduce_boolean
        pluginInstances.reduce(false) {
            $0 || $1.application(application, continue: userActivity, restorationHandler: restorationHandler)
        }
    }
}

extension ApplicationPluggableDelegate {
    open func applicationWillEnterForeground(_ application: UIApplication) {
        pluginInstances
            .compactMap { $0 as? ScenePlugin }
            .forEach { $0.sceneWillEnterForeground() }
    }

    open func applicationDidEnterBackground(_ application: UIApplication) {
        pluginInstances
            .compactMap { $0 as? ScenePlugin }
            .forEach { $0.sceneDidEnterBackground() }
    }

    open func applicationDidBecomeActive(_ application: UIApplication) {
        pluginInstances
            .compactMap { $0 as? ScenePlugin }
            .forEach { $0.sceneDidBecomeActive() }
    }

    open func applicationWillResignActive(_ application: UIApplication) {
        pluginInstances
            .compactMap { $0 as? ScenePlugin }
            .forEach { $0.sceneWillResignActive() }
    }
}

extension ApplicationPluggableDelegate {
    open func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
        pluginInstances.forEach { $0.applicationProtectedDataWillBecomeUnavailable(application) }
    }

    open func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
        pluginInstances.forEach { $0.applicationProtectedDataDidBecomeAvailable(application) }
    }
}

extension ApplicationPluggableDelegate {
    open func applicationWillTerminate(_ application: UIApplication) {
        pluginInstances.forEach { $0.applicationWillTerminate(application) }
    }

    open func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        pluginInstances.forEach { $0.applicationDidReceiveMemoryWarning(application) }
    }
}

extension ApplicationPluggableDelegate {
    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        pluginInstances.forEach { $0.application(application, didReceiveRemoteNotification: userInfo) }
    }

    open func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        pluginInstances.forEach { $0.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken) }
    }

    open func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        pluginInstances.forEach { $0.application(application, didFailToRegisterForRemoteNotificationsWithError: error) }
    }
}
