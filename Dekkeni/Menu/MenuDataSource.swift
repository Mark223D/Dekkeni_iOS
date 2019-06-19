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

extension MenuDataSource: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuItem", for: indexPath) as? MenuCollectionViewCell else { return UICollectionViewCell() }
        
        cell.titleText = menuItems[indexPath.row].title
        
        return cell
    }
    
    
}
