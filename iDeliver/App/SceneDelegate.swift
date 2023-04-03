//
//  SceneDelegate.swift
//  iDeliver
//
//  Created by Hakan Tekir on 9.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: LoginCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let appWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
        appWindow.windowScene = windowScene
        
        let navigationController = UINavigationController()
        coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator?.start()
        
        appWindow.rootViewController = navigationController
        appWindow.makeKeyAndVisible()
        
        window = appWindow
    }
}

