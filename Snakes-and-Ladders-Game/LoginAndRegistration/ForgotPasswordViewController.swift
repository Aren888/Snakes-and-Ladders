//
//  ForgotPasswordViewController.swift
//  Snakes-and-Ladders-Game
//
//  Created by Aren Musayelyan on 23.06.23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeKeyboardByTouchingAnywhere()
        SetUpOutlet()
    }
    
    func SetUpOutlet() {
        image.layer.cornerRadius = 35
        usernameTextField.clipsToBounds = true
        usernameTextField.layer.cornerRadius = 25
        resetPasswordButton.layer.cornerRadius = 25
    }
    
    @IBAction func resetPasswordAction(_ sender: Any) {
        print("resetPasswordButton")
    }
    
    @IBAction func cancelAction(_ sender: Any) {
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



