//
//  RegisterCoordinator.swift
//  iDeliver
//
//  Created by Hakan Tekir on 31.03.2023.
//

import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "\(RegisterViewController.self)")
        navigationController.show(controller, sender: nil)
    }
    
    func presentAlert(_ alertController: UIAlertController, animated: Bool, completion: (() -> Void)?) {
        navigationController.present(alertController, animated: animated, completion: completion)
    }

    func showMain() {
        let controller = MainTabBarController.instantiate(name: .main)
        navigationController.setViewControllers([controller], animated: true)
    }
}
