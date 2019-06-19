//
//  MenuCollectionViewCell.swift
//  Dekkeni
//
//  Created by Mark on 6/19/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
   
    
    var titleText:String = "" {
        didSet{
            title.text = titleText
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
