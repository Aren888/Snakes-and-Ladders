//
//  SignUpViewController.swift
//  Snakes-and-Ladders-Game
//
//  Created by Aren Musayelyan on 23.06.23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    private var isValidUsername: Bool!
    private var isValidPassword: Bool!
    private var isValidConfirmPassword: Bool!
    
    private var usernameError: String = ""
    private var passwordError: String = ""
    private var confirmPasswordError: String = ""
    
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
        confirmPasswordTextField.clipsToBounds = true
        confirmPasswordTextField.layer.cornerRadius = 25
        signUpButton.layer.cornerRadius = 25
    }
    
    func validUsernameAndPassword() {
        
        // TODO: - Chek Username
        if let text = usernameTextField.text, text.isEmpty {
            usernameError = "Username is Empty"
            isValidUsername = false
        } else if usernameTextField.text!.count >= 6 && usernameTextField.text!.count <= 12 {
            isValidUsername = true
            usernameError = "Username is Valid"
        } else {
            usernameError = "Username Text Must Be Greater Than 6 And Less Than 12"
            isValidUsername = false
        }
        
        // TODO: - Chek Password
        if let text = passwordTextField.text, text.isEmpty {
            passwordError = "Password is Empty"
            isValidPassword = false
        } else if passwordTextField.text!.count >= 6 && passwordTextField.text!.count <= 12 {
            isValidPassword = true
            passwordError = "Password is Valid"
        } else {
            passwordError = "Password Text Must Be Greater Than 6 And Less Than 12"
            isValidPassword = false
        }
        
        // TODO: - Chek confirm Password
        if let text = confirmPasswordTextField.text, text.isEmpty {
            isValidConfirmPassword = false
            confirmPasswordError = "Confirm Password is Empty"
        } else if passwordTextField.text == confirmPasswordTextField.text {
            isValidConfirmPassword = true
            confirmPasswordError = "Confirm Password is Valid"
        } else {
            isValidConfirmPassword = false
            confirmPasswordError = "Confirm Password Does Not Match Password"
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        validUsernameAndPassword()
        if isValidUsername && isValidPassword && isValidConfirmPassword {
            // TODO: - Login
            let user = User(name: usernameTextField.text!, password: passwordTextField.text!)
            // Create a new user object
                    
                    // Append the user to the users array
                    let gamesUsers = GamesUsers()
                    gamesUsers.users.append(user)
           
            
            
            self.navigationController?.popViewController(animated: true)
        } else {
            let errorMessage = "\n1) \(usernameError)\n\n2) \(passwordError)\n\n3) \(confirmPasswordError)"
            let alert = UIAlertController(title: "Log in Failed ", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func alreadyHaveAccountAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func closeKeyboardByTouchingAnywhere() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}



