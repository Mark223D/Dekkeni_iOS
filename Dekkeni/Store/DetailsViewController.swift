//
//  DetailsViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/14/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    @IBOutlet weak var minusBtn: UIButton!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    var content : StoreItemCellContent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.barStyle = .blackOpaque

        
        guard let content = self.content else{
            return
        }
        
        self.itemTitleLabel.text = content.title
        self.itemPriceLabel.text = "$ \(content.price ?? "error")"
        self.categoryLabel.text = content.category
        self.descriptionTextView.text = content.description

        
        self.minusBtn.layer.borderWidth = 1
        self.minusBtn.layer.borderColor = UIColor.green.cgColor
        
        self.plusBtn.layer.borderWidth = 1
        self.plusBtn.layer.borderColor = UIColor.green.cgColor
        
        
        self.itemImageView.clipsToBounds = true
         self.itemImageView.layer.cornerRadius = self.itemImageView.frame.height/15

        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .red

        self.navigationController?.navigationBar.backgroundColor = .red
        

        
    }
    
    @IBAction func minusBtnPressed(_ sender: Any) {
        if self.content?.quantity != 0
        {
            self.content?.quantity = self.content!.quantity! - 1
            self.quantityLabel.text = "\(content!.quantity ?? 0 )"
        }
        else{
            self.quantityLabel.text = "0"
            
        }
    }
    
    @IBAction func plusBtnPressed(_ sender: Any) {
        self.content?.quantity = self.content!.quantity! + 1
        self.quantityLabel.text = "\(content!.quantity ?? 0 )"
    }
}
