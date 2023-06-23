//
//  LoginViewController.swift
//  Snakes-and-Ladders-Game
//
//  Created by Aren Musayelyan on 23.06.23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeKeyboardByTouchingAnywhere()
        SetUpOutlet()
    }
    
    func SetUpOutlet() {
        image.layer.cornerRadius = 35
        usernameTextField.clipsToBounds = true
        usernameTextField.layer.cornerRadius = 25
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.cornerRadius = 25
        loginButton.layer.cornerRadius = 25
    }
    
    @IBAction func loginAction(_ sender: Any) {
        print("Log in")
    }
    
    @IBAction func dontHaveAccountAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewControllerID") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewControllerID") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func closeKeyboardByTouchingAnywhere() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}


