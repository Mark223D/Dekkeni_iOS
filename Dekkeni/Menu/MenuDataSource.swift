//
//  MenuDataSource.swift
//  Dekkeni
//
//  Created by Mark on 6/18/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import Foundation
import UIKit

class MenuDataSource: NSObject {
    let menuItems: [MenuItem]
    
    init(menuItems: [MenuItem]) {
        self.menuItems = menuItems
    }
}

extension MenuDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItem", for: indexPath) as! MenuItemTableViewCell
        let menuItem = menuItems[indexPath.row]
        cell.iconImage = menuItem.icon
        cell.titleText = menuItem.title
        
        return cell
    }
}

extension MenuDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? MenuItemTableViewCell
        print(cell?.titleText ?? "")
    }
}
