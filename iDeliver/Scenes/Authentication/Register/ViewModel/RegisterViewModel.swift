//
//  RegisterViewModel.swift
//  iDeliver
//
//  Created by Hakan Tekir on 30.03.2023.
//

import Foundation
import UIKit


class RegisterViewModel {
    var coordinator: RegisterCoordinator?
    let manager = RegisterManager.shared
    
    func register (name: String, email: String, password: String) {
        if (name.isEmpty || email.isEmpty || password.isEmpty) {
            let alert = AlertViewHelper.showAlert(title: "Missing Credentials", message: "Please provide a name, email, and password")
            self.coordinator?.presentAlert(alert, animated: true, completion: nil)
            return
        }
        var user = User(name: name, email: email, password: password)
        manager.registerRequest(user: user) { response in
            switch response {
            case .success(let response):
                user.token = response.token
            case .failure(let failure):
                DispatchQueue.main.sync {
                    let alert = AlertViewHelper.showAlert(title: failure.reason ?? "Error", message: failure.message ?? "Error")
                    self.coordinator?.presentAlert(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
