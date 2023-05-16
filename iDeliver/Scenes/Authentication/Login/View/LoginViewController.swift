//
//  LoginViewController.swift
//  iDeliver
//
//  Created by Hakan Tekir on 30.03.2023.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    let viewModel = LoginViewModel()
    
    @IBOutlet weak var emailTexfield: CustomTextField!
    @IBOutlet weak var passwordTextfield: CustomTextField!
    @IBOutlet weak var signUpLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(signUpLabelTapped))
        signUpLabel.addGestureRecognizer(tapGesture)
        signUpLabel.isUserInteractionEnabled = true
        let attributedText = NSMutableAttributedString(string: signUpLabel.text ?? "")
        let range = (signUpLabel.text as NSString?)?.range(of: "Sign up")

        if let range = range {
            attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
            attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range)
        }

        signUpLabel.attributedText = attributedText

    }
    
    @objc func signUpLabelTapped() {
        print("signUpLabelTapped clicked")
    }

    func configureViewModel(){
        viewModel.coordinator = LoginCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        print("forgotPasswordTapped")
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        print("loginButtonTapped")
    }
    
    @IBAction func signInGoogleTapped(_ sender: Any) {
        print("signInGoogleTapped")
    }
    
}
