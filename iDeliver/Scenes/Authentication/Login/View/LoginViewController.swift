//
//  LoginViewController.swift
//  iDeliver
//
//  Created by Hakan Tekir on 30.03.2023.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {

    let viewModel = LoginViewModel()
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
    
    func configureViewModel(){
        viewModel.coordinator = LoginCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        viewModel.login(email: mailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        viewModel.register()
    }
}
