//
//  StoreViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/11/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds

    
    let titles = [
        "Fresh",
        "Meat & Poultry",
        "Beverages",
        "Groceries",
        "eQuia",
        "Bakery",
        "Confectionery",
        "Tobacco & Co"
    ]
    
    var lists: [UICollectionView] = []
    
    lazy var viewPager: WormTabStrip = {
        let frame =  CGRect(x: 0, y: 90, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        let view = WormTabStrip(frame: frame)
        view.delegate = self
        view.eyStyle.wormStyel = .LINE
        view.eyStyle.isWormEnable = false
        view.eyStyle.spacingBetweenTabs = 15
        view.eyStyle.dividerBackgroundColor = .white
        view.eyStyle.tabItemSelectedColor = .white
        view.currentTabIndex = 0
        view.shouldCenterSelectedWorm = true
        view.buildUI()
        return view
    }()
    
    
    lazy var dataSource : [StoreItemCellContent] = [
        StoreItemCellContent(id: 0, title: "Chips", category: "Fresh", description: "Lays Chips Bag 100g", quantity: 0, price: "1.00"),
        StoreItemCellContent(id: 1,title: "Chocolate",category: "Fresh", description: "Cadbury 10g", quantity: 0, price: "1.50"),
        StoreItemCellContent(id: 2,title: "Bread", category: "Fresh", description: "Bread Bag 500g", quantity: 0, price: "2.50"),
        StoreItemCellContent(id: 3, title: "Milk", category: "Fresh", description: "Milk Carton 1L", quantity: 0, price: "3.50"),
        StoreItemCellContent(id: 4, title: "Chips", category: "Fresh", description: "Lays Chips Bag 100g", quantity: 0, price: "1.00"),
        StoreItemCellContent(id: 5, title: "Chocolate", category: "Fresh", description: "Cadbury 10g", quantity: 0, price: "1.50"),
        StoreItemCellContent(id: 6, title: "Bread", category: "Fresh", description: "Bread Bag 500g", quantity: 0, price: "2.50"),
        StoreItemCellContent(id: 7, title: "Milk", category: "Fresh", description: "Milk Carton 1L", quantity: 0, price: "3.50"),
    ]

    var selectedContent:StoreItemCellContent?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        styleStatusBar()

        self.view.addSubview(self.viewPager)
    

        NotificationCenter.default.addObserver(forName: Notification.Name("openDetails"), object: nil, queue: nil, using: detailsClick)
        
        
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsPage"{
            let object = self.selectedContent
            let controller = segue.destination as! DetailsViewController
            controller.content = object
        }
    }
    
    
    func detailsClick(notification:Notification) -> Void {
        guard let contentID = notification.userInfo!["id"] as? Int else { return }
        self.selectedContent = dataSource[(contentID)]
        self.performSegue(withIdentifier: "toDetailsPage", sender: self)
        
    }
    
    func styleStatusBar(){
        
        UINavigationBar.appearance().clipsToBounds = true
        
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        
        statusBar.backgroundColor = UIColor.red
    }
    

    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: WormTabStrip Delegate Functions
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    
}

extension StoreViewController: WormTabStripDelegate{
    func WTSNumberOfTabs() -> Int {
        return titles.count
    }
    
    func WTSViewOfTab(index: Int) -> UIView {
        let view = UIView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: 90))
        let flowLayout = UICollectionViewFlowLayout.init()
        let collectionView = UICollectionView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height-view.frame.height), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor(displayP3Red: 193/255, green: 66/255, blue: 40/255, alpha: 0.05)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsSelection = true
        collectionView.register(UINib(nibName: "StoreTableViewCell", bundle: nil), forCellWithReuseIdentifier: "StoreItem")

        view.addSubview(collectionView)
        self.lists.append(collectionView)
        
        return view
    }
    
    func WTSTitleForTab(index: Int) -> String {
        return titles[index]
    }
    
    func WTSReachedLeftEdge(panParam: UIPanGestureRecognizer) {
    }
    
    func WTSReachedRightEdge(panParam: UIPanGestureRecognizer) {
    }
}

extension StoreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreItem", for: indexPath) as! StoreItemCell
        cell.setContent(content: dataSource[indexPath.row])
        cell.layer.borderColor = UIColor(displayP3Red: 193/255, green: 66/255, blue: 40/255, alpha: 0.1).cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("test")
    }
    
    
   
    
}
extension StoreViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 10, left: 10, bottom: 80, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 30
                let numberOfItemsPerRow: CGFloat = 2.0
                let width = (screenSize.width-leftAndRightPaddings)/numberOfItemsPerRow
                return CGSize(width: width, height: width*1.4)
    }
    
   
}
