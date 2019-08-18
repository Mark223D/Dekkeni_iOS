//
//  StoreTableViewCell.swift
//  Dekkeni
//
//  Created by Mark on 8/12/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class StoreItemCellContent {
    var id: Int?
    var title: String?
    var category: String?
    var description: String?
    var quantity: Int?
    var price: String?
    var expanded: Bool?
    
    init(id: Int, title: String, category: String,description: String,
         quantity:Int,
         price: String) {
        self.id = id
        self.title = title
        self.category = category
        self.description = description
        self.price = price
        self.quantity = 0
        self.expanded = false
    }
    
    
}

@IBDesignable
class StoreItemCell: UICollectionViewCell {
    
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    
    @IBOutlet weak var minusBtn: UIButton!
    var tapped: Bool = false
   
    @IBOutlet weak var quantifierStackView: UIStackView!
    var content: StoreItemCellContent?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.cornerRadius = 13
        self.minusBtn.layer.borderWidth = 1
        self.minusBtn.layer.borderColor = UIColor.green.cgColor
        
        self.plusBtn.layer.borderWidth = 1
        self.plusBtn.layer.borderColor = UIColor.green.cgColor
        
    }
    
    @IBAction func imagePressed(_ sender: Any) {
        if !self.tapped {
            self.tapped = true
        }
        self.isSelected = self.tapped
        NotificationCenter.default.post(name: Notification.Name("openDetails"), object: self, userInfo: ["id": content?.id! ?? 0])


    }
    

    func setContent(content: StoreItemCellContent){
        self.content = content
        self.titleLabel.text = content.title
        self.priceLabel.text = "$\(content.price ?? "0.00")"
        self.quantityLabel.text = "\(content.quantity ?? 0 )"
        
    }
    
    @IBAction func addPressed(_ sender: Any) {
        self.content?.quantity = self.content!.quantity! + 1
        self.quantityLabel.text = "\(content!.quantity ?? 0 )"

    }
    
    @IBAction func removePressed(_ sender: Any) {
        if self.content?.quantity != 0
        {
            self.content?.quantity = self.content!.quantity! - 1
            self.quantityLabel.text = "\(content!.quantity ?? 0 )"
        }
        else{
            self.quantityLabel.text = "0"

        }

    }
    
}

