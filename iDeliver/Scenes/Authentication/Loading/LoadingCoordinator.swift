//
//  LoadingCoordinator.swift
//  iDeliver
//
//  Created by Kenan Baylan on 27.04.2023.
//

import Foundation
import UIKit



//NOT: start - presentAlert - showMain fonksiyonları protokole eklenmeli.

class LoadingCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let controller = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "\(LoadingViewController.self)")
        navigationController.show(controller, sender: nil)
    }
    
    
    
    func presentAlert(_ alertController: UIAlertController, animated: Bool, completion: (() -> Void)?) {
        navigationController.present(alertController, animated: animated, completion: completion)
    }
    
    func showLogin() {
        let controller = LoginViewController.instantiate(name: .authentication)
                
        navigationController.show(controller, sender: true)
        
    }
    
}
