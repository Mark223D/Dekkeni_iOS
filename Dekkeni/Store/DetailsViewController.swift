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
        self.navigationController?.navigationBar.barStyle = .blackOpaque

        
        guard let content = self.content else{
            return
        }
        self.itemTitleLabel.text = content.title
        self.itemPriceLabel.text = "$ \(content.price ?? "error")"
        self.categoryLabel.text = content.category
        self.descriptionTextView.text = content.description
//        guard let image = content.image else{
//            return nil
//        }
        self.minusBtn.layer.borderWidth = 1
        self.minusBtn.layer.borderColor = UIColor.green.cgColor
        
        self.plusBtn.layer.borderWidth = 1
        self.plusBtn.layer.borderColor = UIColor.green.cgColor
        
        
        self.itemImageView.clipsToBounds = true
         self.itemImageView.layer.cornerRadius = self.itemImageView.frame.height/15
         self.itemImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
