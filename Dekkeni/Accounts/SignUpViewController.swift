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
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.backView.layer.addShadow()
        self.titleLabel.layer.addShadow()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
   
    @IBAction func registerBtnPressed(_ sender: Any) {
        register()
    }
    
    
    func register(){
        
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
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
