//
//  SettingsViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/18/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .red
        self.navigationController?.navigationBar.barTintColor = .red
        // Do any additional setup after loading the view.
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
