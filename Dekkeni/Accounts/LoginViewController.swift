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
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var dekkeniLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
        self.moveUpWhenShowingKeyboard()
        self.backView.layer.addShadow()
        self.dekkeniLabel.layer.addShadow()
//        self.view.backgroundColor = UIColor.flat

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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

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
