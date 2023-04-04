//
//  LoginViewModel.swift
//  iDeliver
//
//  Created by Hakan Tekir on 3.04.2023.
//

import Foundation
import UIKit

class LoginViewModel {
    var coordinator: LoginCoordinator?
    let manager = LoginManager.shared
    let keychainManager = KeychainManager.shared
    
    func login (email: String, password: String) {  
        if (email.isEmpty || password.isEmpty) {
            let alert = AlertViewHelper.showAlert(title: "Missing Credentials", message: "Please provide a name, email, and password")
            self.coordinator?.presentAlert(alert, animated: true, completion: nil)
            return
        }
        var user = User(email: email, password: password)
        manager.loginRequest(user: user) { response in
            switch response {
            case .success(let response):
                user.token = response.token
                if self.keychainManager.save(key: "JWT", value: user.token ?? "") {
                    DispatchQueue.main.sync {
                        self.coordinator?.showMain()
                    }
                }
            case .failure(let failure):
                DispatchQueue.main.sync {
                    let alert = AlertViewHelper.showAlert(title: failure.reason ?? "Error", message: failure.message ?? "Error")
                    self.coordinator?.presentAlert(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func register() {
        coordinator?.showRegister()
    }
}
