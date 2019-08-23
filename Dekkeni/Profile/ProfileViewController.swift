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
    @IBOutlet weak var emailValueLabel: UILabel!
    @IBOutlet weak var addressValueLabel: UILabel!
    @IBOutlet weak var telephoneValueLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .red

        self.navigationController?.navigationBar.barTintColor = .red

        self.backView.layer.cornerRadius = self.backView.frame.height*0.03
        
        self.nameValueLabel.text = "John Doe"
        self.emailValueLabel.text = "johndoe@example.com"
        self.addressValueLabel.text = "Beirut, Lebanon"
        self.telephoneValueLabel.text = "+961 70 000 000"
        
        self.profilePhoto.image = UIImage(named: "avatar")
        self.profilePhoto.layer.cornerRadius = self.profilePhoto.frame.height/2.3
        self.backView.layer.addShadow()
        self.profilePhoto.layer.addShadow()
    }
    
    @IBAction func menuBtnPressed(_ sender: Any) {
        panel?.openLeft(animated: true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
