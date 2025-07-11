//
//  ScenePluggableDelegate.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import UIKit

open class ScenePluggableDelegate: UIResponder, UIWindowSceneDelegate {
    public var window: UIWindow?

    public private(set) lazy var pluginInstances: [ScenePlugin] = plugins()

    override public init() {
        super.init()

        _ = pluginInstances
    }

    open func plugins() -> [ScenePlugin] { [] }
}

extension ScenePluggableDelegate {
    open func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        pluginInstances.forEach { $0.scene(scene, willConnectTo: session, options: connectionOptions) }
    }

    open func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        pluginInstances.forEach { $0.scene(scene, continue: userActivity) }
    }

    open func sceneWillEnterForeground(_ scene: UIScene) {
        pluginInstances.forEach { $0.sceneWillEnterForeground() }
    }

    open func sceneDidEnterBackground(_ scene: UIScene) {
        pluginInstances.forEach { $0.sceneDidEnterBackground() }
    }

    open func sceneDidBecomeActive(_ scene: UIScene) {
        pluginInstances.forEach { $0.sceneDidBecomeActive() }
    }

    open func sceneWillResignActive(_ scene: UIScene) {
        pluginInstances.forEach { $0.sceneWillResignActive() }
    }

    open func sceneDidDisconnect(_ scene: UIScene) {
        pluginInstances.forEach { $0.sceneDidDisconnect() }
    }

    open func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        pluginInstances.forEach { $0.scene(scene, openURLContexts: URLContexts)}
    }
}

public protocol ScenePlugin {
    func sceneWillEnterForeground()

    func sceneDidEnterBackground()

    func sceneDidBecomeActive()

    func sceneWillResignActive()

    func sceneDidDisconnect()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity)

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>)
}

public extension ScenePlugin {
    func sceneWillEnterForeground() {}
    func sceneDidEnterBackground() {}
    func sceneDidBecomeActive() {}
    func sceneWillResignActive() {}
    func sceneDidDisconnect() {}

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {}

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {}

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {}
}
