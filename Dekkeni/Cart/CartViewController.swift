//
//  CartViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/23/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var addressLabel: UILabel!

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var controlsStack: UIStackView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var checkoutBtn: DekkeniButton!
    
    @IBOutlet weak var paymentStack: UIStackView!
    @IBOutlet weak var paymentBtn: UIButton!
    
    @IBOutlet weak var fadedView: UIView!
    @IBOutlet weak var addressStack: UIStackView!
    @IBOutlet weak var address: UIButton!
    
    var topViewOriginalHeight: CGFloat?

    private var lastContentOffset: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.topViewOriginalHeight = self.topViewHeightConstraint.constant

        self.addressLabel.layer.addShadow()

        self.totalLabel.layer.addShadow()
        self.checkoutBtn.layer.addShadow()

        collectionView.register(UINib(nibName: "StoreTableViewCell", bundle: nil), forCellWithReuseIdentifier: "StoreItem")
        collectionView.delegate = self
        collectionView.dataSource = self

        self.addressStack.isHidden = true
        self.paymentStack.isHidden = true
        self.fadeView()
        self.toggleViewSize()
        self.hideKeyboardWhenTappedAround()
        self.moveUpWhenShowingKeyboard()
        // Do any additional setup after loading the view.
    }
    
    func fadeView(){
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.fadedView.bounds
        
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.red.cgColor]
        gradientLayer.locations = [0.0, 0.35]
        self.fadedView.layer.addSublayer(gradientLayer)
    }
    @IBAction func closeAddress(_ sender: Any) {
        self.addressStack.isHidden = true
        self.address.isHidden = false
        toggleViewSize()
    }
    
    @IBAction func closePayment(_ sender: Any) {
        self.paymentStack.isHidden = true
        self.paymentBtn.isHidden = false
        toggleViewSize()
    }
    @IBAction func addressBtnPressed(_ sender: Any) {
        self.addressStack.isHidden = false
        self.address.isHidden = true
        toggleViewSize()
    }
    
    @IBAction func paymentBtnPressed(_ sender: Any) {
        self.paymentStack.isHidden = false
        self.paymentBtn.isHidden = true
        toggleViewSize()
    }
    
    
    func toggleViewSize(){
        if paymentBtn.isHidden && address.isHidden{
            controlsStack.isHidden = true
            self.topViewHeightConstraint.constant = self.topViewOriginalHeight!

        }
        else if (!paymentBtn.isHidden && address.isHidden) ||  (paymentBtn.isHidden && !address.isHidden){
            self.topViewHeightConstraint.constant = self.topViewOriginalHeight! - (self.topViewOriginalHeight! * 0.1)
            controlsStack.isHidden = false

           
        }
        else{
            self.topViewHeightConstraint.constant = self.topViewOriginalHeight! - (2 * self.topViewOriginalHeight!/3)
            controlsStack.isHidden = false

        }
        
         self.collectionView.frame = CGRect(x: self.collectionView.frame.origin.x, y: self.topViewHeightConstraint.constant, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
        
    }

}

extension CartViewController: UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreItem", for: indexPath) as! StoreItemCell
        
            cell.layer.borderColor = UIColor(displayP3Red: 193/255, green: 66/255, blue: 40/255, alpha: 0.1).cgColor
            cell.layer.borderWidth = 1
            cell.productImageView.layer.addShadow()
            cell.priceLabel.layer.addShadow()
            return cell
        }

    
    
    func showButtonsOnly(){
        self.paymentStack.isHidden = true
        self.addressStack.isHidden = true
        self.paymentBtn.isHidden = false
        self.address.isHidden = false
        self.toggleViewSize()
    }
    
}

extension CartViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset > scrollView.contentOffset.y) {
            // move up
            if scrollView.isAtTop{
                self.topViewHeightConstraint.constant = self.topViewOriginalHeight! - (2 * self.topViewOriginalHeight!/3)
                self.collectionView.frame = CGRect(x: self.collectionView.frame.origin.x, y: self.topViewHeightConstraint.constant, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                self.showButtonsOnly()

            }
            
            
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
            // move down
            if !scrollView.isDecelerating{
                
                self.topViewHeightConstraint.constant = 0
                self.collectionView.frame = CGRect(x: self.collectionView.frame.origin.x, y: 0, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                

            }
        }
        
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 10, left: 10, bottom: 80, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let leftAndRightPaddings: CGFloat = 30
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (screenSize.width-leftAndRightPaddings)/numberOfItemsPerRow
       
        return CGSize(width: width, height: width*1.4)
    }
    
    
}
