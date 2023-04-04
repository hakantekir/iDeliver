//
//  MainCoordinator.swift
//  iDeliver
//
//  Created by Hakan Tekir on 4.04.2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(MainTabBarController.self)")
        navigationController.show(controller, sender: nil)
    }
}
