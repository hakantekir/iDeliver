//
//  LoginCoordinator.swift
//  iDeliver
//
//  Created by Hakan Tekir on 3.04.2023.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "\(LoginViewController.self)")
        navigationController.show(controller, sender: nil)
    }
    
    func presentAlert(_ alertController: UIAlertController, animated: Bool, completion: (() -> Void)?) {
        navigationController.present(alertController, animated: animated, completion: completion)
    }

    func showMain() {
        let controller = MainTabBarController.instantiate(name: .main)
        navigationController.setViewControllers([controller], animated: true)
    }
    
    func showRegister() {
        let controller = RegisterViewController.instantiate(name: .authentication)
        navigationController.show(controller, sender: nil)
    }
}
