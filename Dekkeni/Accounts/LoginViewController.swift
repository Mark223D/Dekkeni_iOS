//
//  LoginViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/20/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.tag = 0
        self.passwordTextField.tag = 1
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.hideKeyboardWhenTappedAround()

    }
    

    @IBAction func signInBtnPressed(_ sender: Any) {
        signIn()
    }

    @IBAction func registerButtonPressed(_ sender: Any) {
        
    }
    
    func signIn(){
        
    }
    
}
extension LoginViewController: UITextFieldDelegate {
    private func textFieldShouldReturn(textField: UITextField) -> Bool {

        //Email
        if textField == emailTextField {
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            
        }
        //Password
        else {
            passwordTextField.resignFirstResponder()
            signIn()

        }
        return true
    }
    
}
