//
//  MenuItemTableViewCell.swift
//  Dekkeni
//
//  Created by Mark on 6/18/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit


class MenuItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    var iconImage: UIImage? {
        didSet{
            icon.image = iconImage
        }
    }
    
    var titleText: String? {
        didSet{
            title.text = titleText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
