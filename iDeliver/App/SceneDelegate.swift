//
//  SceneDelegate.swift
//  iDeliver
//
//  Created by Hakan Tekir on 9.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var loginCoordinator: LoginCoordinator?
    var mainCoordinator: MainCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window.windowScene = windowScene
        
        let navigationController = UINavigationController()
        
        guard let data = KeychainManager.shared.load(key: "JWT") else {
            loginCoordinator = LoginCoordinator(navigationController: navigationController)
            loginCoordinator?.start()
            
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            
            self.window = window
            return
        }
        
        let token = String(data: data, encoding: .utf8)
        LoginManager.shared.verifyToken(token: token ?? "") { response in
            switch (response) {
            case .success(let result):
                DispatchQueue.main.sync {
                    self.mainCoordinator = MainCoordinator(navigationController: navigationController)
                    self.mainCoordinator?.start()
                    
                    window.rootViewController = navigationController
                    window.makeKeyAndVisible()
                    
                    self.window = window
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

