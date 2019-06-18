//
//  MenuViewController.swift
//  Dekkeni
//
//  Created by Mark on 6/17/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSource: MenuDataSource = .init(menuItems: MenuItem.items)


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MenuItemTableViewCell", bundle: nil), forCellReuseIdentifier: "menuItem")
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.reloadData()

       
    }
}



