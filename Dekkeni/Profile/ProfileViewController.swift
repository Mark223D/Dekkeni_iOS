//
//  ProfileViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/18/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var nameValueLabel: UILabel!

    @IBOutlet weak var emailTextField: DekkeniTextField!
    
    @IBOutlet weak var addressTextField: DekkeniTextField!
    
    @IBOutlet weak var telephoneTextField: DekkeniTextField!
    @IBOutlet weak var backView: UIView!
    
    var editingMode: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .red

        self.navigationController?.navigationBar.barTintColor = .red

        self.backView.layer.cornerRadius = self.backView.frame.height*0.03
        
        self.nameValueLabel.text = "John Doe"
        self.emailTextField.text = "johndoe@example.com"
        self.addressTextField.text = "Beirut, Lebanon"
        self.telephoneTextField.text = "+961 70 000 000"
        
        self.emailTextField.isEnabled = false
        self.addressTextField.isEnabled = false
        self.telephoneTextField.isEnabled = false

        self.profilePhoto.image = UIImage(named: "avatar")
        self.profilePhoto.layer.cornerRadius = self.profilePhoto.frame.height/2.3
        self.backView.layer.addShadow()
        self.profilePhoto.layer.addShadow()
        self.hideKeyboardWhenTappedAround()
        self.moveUpWhenShowingKeyboard()
        
    }
    
    @IBAction func menuBtnPressed(_ sender: Any) {
        panel?.openLeft(animated: true)
    }
    
    
    
    @IBAction @objc func editPressed(_ sender: Any) {
        if editingMode{
            editingMode = false
            self.emailTextField.isEnabled = false
            self.addressTextField.isEnabled = false
            self.telephoneTextField.isEnabled = false
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editPressed(_:)))
        }
        else{
            self.emailTextField.isEnabled = true
            self.addressTextField.isEnabled = true
            self.telephoneTextField.isEnabled = true
            emailTextField.becomeFirstResponder()
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action:#selector(editPressed(_:)) )
            editingMode = true
        }
    }
    

}
