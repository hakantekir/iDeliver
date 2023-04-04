//
//  RegisterViewController.swift
//  iDeliver
//
//  Created by Hakan Tekir on 30.03.2023.
//

import UIKit

class RegisterViewController: UIViewController, Storyboarded {

    let viewModel = RegisterViewModel()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
    
    func configureViewModel(){
        viewModel.coordinator = RegisterCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        viewModel.register(name: nameTextField.text ?? "", email: mailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}
