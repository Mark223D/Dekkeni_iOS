//
//  MenuItem.swift
//  Dekkeni
//
//  Created by Mark on 6/18/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

struct MenuItem {
    let icon: UIImage
    let title: String
    
    static let items: [MenuItem] = [
        .init(icon: #imageLiteral(resourceName: "home"), title: NSLocalizedString("home", comment: "")),
        .init(icon: #imageLiteral(resourceName: "fresh.png"), title: NSLocalizedString("fresh", comment: "")),
        .init(icon: #imageLiteral(resourceName: "fruits.png"), title: NSLocalizedString("fruits", comment: "")),
        .init(icon: #imageLiteral(resourceName: "meat"), title: NSLocalizedString("meat", comment: "")),
        .init(icon: #imageLiteral(resourceName: "beverages"), title: NSLocalizedString("beverages", comment: "")),
        .init(icon: #imageLiteral(resourceName: "groceries"), title: NSLocalizedString("groceries", comment: "")),
        .init(icon: #imageLiteral(resourceName: "equia"), title: NSLocalizedString("equia", comment: "")),
        .init(icon: #imageLiteral(resourceName: "bakery"), title: NSLocalizedString("bakery", comment: "")),
        .init(icon: #imageLiteral(resourceName: "tobacco"), title: NSLocalizedString("tobacco", comment: ""))
    ]
}
