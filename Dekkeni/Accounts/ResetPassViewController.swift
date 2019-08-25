//
//  ResetPassViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/22/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class ResetPassViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var backView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.moveUpWhenShowingKeyboard()
        self.backView.layer.addShadow()
    }


    @IBAction func resetBtnPressed(_ sender: Any) {
        resetPassword()
    }
    
    func resetPassword(){
        
    }
}

extension ResetPassViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        resetPassword()
        return true
    }
    

}
