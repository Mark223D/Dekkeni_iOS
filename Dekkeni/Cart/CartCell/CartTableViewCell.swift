//
//  CartTableViewCell.swift
//  Dekkeni
//
//  Created by Mark on 8/23/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backView.layer.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
