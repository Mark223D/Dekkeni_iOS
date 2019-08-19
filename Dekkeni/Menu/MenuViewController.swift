//
//  MenuViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/15/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class MenuItemCellContent {
    var title: String?
    var icon: UIImage?
    
    init( title: String, icon: UIImage) {
        self.title = title
        self.icon = icon
    }
    
    
}
class MenuViewController: UIViewController {
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    let menuContent:[MenuItemCellContent] = [
        MenuItemCellContent(title: "Profile", icon: UIImage(named: "avatar")!),
        MenuItemCellContent(title: "Store", icon: UIImage(named: "store")!),
        MenuItemCellContent(title: "Log Out", icon: UIImage(named: "exit")!),
        MenuItemCellContent(title: "Log In", icon: UIImage(named: "avatar")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        self.menuCollectionView.dataSource = self
        self.menuCollectionView.delegate = self
        
        self.menuCollectionView.register(UINib(nibName: "MenuItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "menuItem")
  
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewWillAppear(_ animated: Bool) {
    let selectedIndexPath = IndexPath(item: 1, section: 0)
    self.menuCollectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .left)
}
}

extension MenuViewController: UICollectionViewDelegate{
    
}

extension MenuViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 80
            , height: 90)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        let totalCellHeight = 90 * self.menuContent.count
        let totalSpacingHeight = 1 * (self.menuContent.count - 1)
        
        let topInset = (self.menuCollectionView.frame.height - CGFloat(totalCellHeight + totalSpacingHeight)) / 2
        let bottomInset = topInset
        
        return UIEdgeInsets(top: topInset, left: 0, bottom: bottomInset, right: 0)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

}
extension MenuViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuItem", for: indexPath) as! MenuItemCollectionViewCell
        
        cell.menuItemLabel.text = self.menuContent[indexPath.row].title
        cell.menuItemIcon.image = self.menuContent[indexPath.row].icon
        
        if indexPath.row == self.menuContent.count - 1{
            cell.separatorView.isHidden = true
        }
    
        

        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        if indexPath.row == 0 {
        
            let profileVC: ProfileViewController = mainStoryboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
           
            let centerNavVC = UINavigationController(rootViewController: profileVC)
            
            

            _ = panel!.center(centerNavVC)

            
        }
        if indexPath.row == 1 {
            let storeVC: StoreViewController = mainStoryboard.instantiateViewController(withIdentifier: "StoreVC") as! StoreViewController
            let navVC = UINavigationController(rootViewController: storeVC)
            
            _ =  panel!.center(navVC)
        }
        if indexPath.row == 2{
            let settingsVC: SettingsViewController = mainStoryboard.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsViewController
            
                        let centerNavVC = UINavigationController(rootViewController: settingsVC)

            
            _ = panel!.center(centerNavVC)

        }
        if indexPath.row == 3{
            let settingsVC: LoginViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
            
            let centerNavVC = UINavigationController(rootViewController: settingsVC)
            
            
            _ = panel!.center(centerNavVC)
            
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as! MenuItemCollectionViewCell

          cell.toggleSelection()
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MenuItemCollectionViewCell
        
        cell.toggleSelection()
    }
    

}
