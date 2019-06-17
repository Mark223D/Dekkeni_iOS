//
//  FirstViewController.swift
//  Dekkeni
//
//  Created by Mark on 6/17/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func toggleMenu(_ sender: Any) {        NotificationCenter.default.post(name: Notification.Name("toggleMenu"), object: nil)
    }
}

