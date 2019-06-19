//
//  MenuItem.swift
//  Dekkeni
//
//  Created by Mark on 6/18/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

struct MenuItem {
    let title: String
    
    static let items: [MenuItem] = [
        .init( title: NSLocalizedString("home", comment: "")),
        .init( title: NSLocalizedString("fresh", comment: "")),
        .init( title: NSLocalizedString("fruits", comment: "")),
        .init( title: NSLocalizedString("meat", comment: "")),
        .init( title: NSLocalizedString("beverages", comment: "")),
        .init( title: NSLocalizedString("groceries", comment: "")),
        .init( title: NSLocalizedString("equia", comment: "")),
        .init( title: NSLocalizedString("bakery", comment: "")),
        .init( title: NSLocalizedString("tobacco", comment: ""))
    ]
}
