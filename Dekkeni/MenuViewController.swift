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
        MenuItemCellContent(title: "Profile", icon: UIImage(named: "Avatar")!),
        MenuItemCellContent(title: "Store", icon: UIImage(named: "Store")!),
        MenuItemCellContent(title: "Settings", icon: UIImage(named: "Settings")!),
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
        cell.menuItemIcon.image = self.menuContent[indexPath.row].icon?.imageResize(sizeChange: CGSize(width: cell.menuItemIcon.frame.width, height: cell.menuItemIcon.frame.height))
        if indexPath.row == self.menuContent.count - 1{
            cell.separatorView.isHidden = true
        }
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        if indexPath.row == 0 {
            let profileVC: ProfileViewController = mainStoryboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController

            let rootVC = UIApplication.shared.keyWindow!.rootViewController as! FAPanelController
            
            rootVC.center(profileVC).left(self)
            
        }
        if indexPath.row == 1 {
            let storeVC: StoreViewController = mainStoryboard.instantiateViewController(withIdentifier: "StoreVC") as! StoreViewController
            
            let rootVC = UIApplication.shared.keyWindow!.rootViewController as! FAPanelController
            
            rootVC.center(storeVC).left(self)
        }
        if indexPath.row == 2{
            let settingsVC: SettingsViewController = mainStoryboard.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsViewController
            
            let rootVC = UIApplication.shared.keyWindow!.rootViewController as! FAPanelController
            
            rootVC.center(settingsVC).left(self)
        }
    }
}
