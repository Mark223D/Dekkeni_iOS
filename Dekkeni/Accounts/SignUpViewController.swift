//
//  SignUpViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/22/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
   
    @IBAction func registerBtnPressed(_ sender: Any) {
        register()
    }
    
    
    func register(){
        
    }
    
}
extension SignUpViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            nameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
        case emailTextField:
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
            confirmTextField.becomeFirstResponder()
        case confirmTextField:
            confirmTextField.resignFirstResponder()
            self.register()
        default:
            view.endEditing(true)
        }
        
        return true
    }
    
}
