//
//  CategoryTableViewCell.swift
//  Dekkeni
//
//  Created by Mark on 8/23/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//        if selected{
//            self.backgroundColor = .red
//            self.categoryTitle.textColor = .white
//        }
//        else{
//            self.backgroundColor = .red
//            self.categoryTitle.textColor = .white
//        }
    }
    
}
