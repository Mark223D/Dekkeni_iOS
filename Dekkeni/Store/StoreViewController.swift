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
    
    var showingSearch: Bool = false
    var showingAddress: Bool = false
    var showingFilters: Bool = false

    @IBOutlet weak var addressBtn: UIButton!
    
    @IBOutlet weak var addressTextField: DekkeniTextField!
    
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var searchStackView: UIStackView!
    
    var topViewOriginalHeight: CGFloat?
    private var lastContentOffset: CGFloat = 0
    
    
    let titles = [
        "Categories",
        "Featured",
        "Best Seller",
        "New Arrivals",
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
        let frame =  CGRect(x: 0, y: self.topViewHeightConstraint.constant, width: self.view.frame.size.width, height: self.view.frame.size.height - self.topViewHeightConstraint.constant)
        
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
    
    
    @IBOutlet weak var filtersButtons: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        styleStatusBar()
        
        self.view.addSubview(viewPager)
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .red
        
        NotificationCenter.default.addObserver(forName: Notification.Name("openDetails"), object: nil, queue: nil, using: detailsClick)
        
        self.title = "Store"
        self.searchBar.delegate = self
        self.searchBar.backgroundImage = UIImage()
        self.searchBar.showsCancelButton = true
        self.searchBar.setShowsCancelButton(true, animated: true)
        self.topViewOriginalHeight = self.topViewHeightConstraint.constant
        
        self.searchButton.layer.addShadow()
        self.filtersButtons.layer.addShadow()
    
        self.hideKeyboardWhenTappedAround()
        
        guard let userIcon = UIImage(named: "pin") else { return  }
        setPaddingWithImage(image: userIcon, textField: addressTextField)
      
        
    }
    
    func setPaddingWithImage(image: UIImage, textField: UITextField){
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        
        imageView.frame = CGRect(x: 0, y: 15, width: 20.0, height: 20.0)
        //For Setting extra padding other than Icon.
        let seperatorView = UIView(frame: CGRect(x: 50, y: 0, width: 10, height: 50))
        seperatorView.backgroundColor = UIColor(red: 80/255, green: 89/255, blue: 94/255, alpha: 0)
        view.addSubview(seperatorView)
        textField.leftViewMode = .always
        view.addSubview(imageView)
        view.backgroundColor = .clear
        textField.leftViewMode = UITextField.ViewMode.always
        textField.leftView = view
    }
    
    @IBAction func menuBtnPressed(_ sender: Any) {
        panel?.openLeft(animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if self.viewPager.currentTabIndex != 0{
            if segue.identifier == "toDetailsPage"{
                let object = self.selectedContent
                let controller = segue.destination as! DetailsViewController
                controller.content = object
            }
        }
    }
    
    
    
    @IBAction func addressBtnPressed(_ sender: Any) {
        addressToggle(sender)
    }
    @IBAction func searchButtonPressed(_ sender: Any) {
        searchToggle(sender)
    }
    
    @objc func searchToggle(_ sender: Any){
        if !showingSearch{
            self.searchBar.isHidden = false
            self.searchButton.isHidden = true
            self.searchStackView.distribution = .fill
            self.addressBtn.isHidden = true
            self.filtersButtons.isHidden = true
            self.searchBar.becomeFirstResponder()
            showingSearch = true
            
        }else{
            self.searchBar.isHidden = true
            self.searchStackView.distribution = .fillEqually
            self.searchButton.isHidden = false
            self.searchBar.resignFirstResponder()
            self.addressBtn.isHidden = false
            self.filtersButtons.isHidden = false
            
            
            
            showingSearch = false
        }
    }
    
    
    @objc func addressToggle(_ sender: Any){
        if !showingAddress{
            self.addressTextField.isHidden = false
            self.searchButton.isHidden = true
            self.searchStackView.alignment = .center
            self.addressBtn.isHidden = true
            self.filtersButtons.isHidden = true
            showingAddress = true
            
        }else{
            self.addressTextField.isHidden = true
            self.searchStackView.distribution = .fillEqually
            self.searchButton.isHidden = false
            self.searchBar.resignFirstResponder()
            self.addressBtn.isHidden = false
            self.filtersButtons.isHidden = false
            
            
            
            showingAddress = false
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
    }
    
    
}

// MARK: WormTabStrip Delegate Functions
extension StoreViewController: WormTabStripDelegate{
    func WTSNumberOfTabs() -> Int {
        return titles.count
    }
    
    func WTSViewOfTab(index: Int) -> UIView {
        let tabPageX = self.view.frame.origin.x
        let tabPageY = self.view.frame.origin.y
        let tabPageW = self.view.frame.width
        let tabPageH = self.view.frame.height-50
        
        let view = UIView(frame: CGRect(x: tabPageX, y: tabPageY , width: tabPageW, height: tabPageH))
        
        let flowLayout = UICollectionViewFlowLayout.init()
        
        let collectionView = UICollectionView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: view.frame.height ), collectionViewLayout: flowLayout)
        collectionView.tag = index
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
        panel?.openLeft(animated: true)
    }
    
    func WTSReachedRightEdge(panParam: UIPanGestureRecognizer) {
    }
}

extension StoreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            return titles.count
        }
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreItem", for: indexPath) as! StoreItemCell
        if collectionView.tag == 0 {
            let newIndex = indexPath.row + 1
            if newIndex < titles.count{
                cell.quantifierStackView.isHidden = true
                cell.priceLabel.isHidden = true
                cell.titleLabel.text = titles[indexPath.row+1]
                cell.productImageView.backgroundColor = .red
                cell.imageButton.isUserInteractionEnabled = false
                cell.imageBottomSpaceConstraint.constant = cell.imageBottomSpaceConstraint.constant * 2
            }
            else{
                cell.isHidden = true
            }
            
        }
        else{
            cell.setContent(content: dataSource[indexPath.row])
            
        }
        cell.layer.borderColor = UIColor(displayP3Red: 193/255, green: 66/255, blue: 40/255, alpha: 0.1).cgColor
        cell.layer.borderWidth = 1
        cell.productImageView.layer.addShadow()
        cell.priceLabel.layer.addShadow()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("CollectionView: DidSelectItemAt")
        if collectionView.tag == 0{
                self.viewPager.selectTabAt(index: indexPath.row+1)
        }
        
        
        
    }
    
    
    
    
}
extension StoreViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset > scrollView.contentOffset.y) {
            // move up
            if scrollView.isAtTop{
                self.topViewHeightConstraint.constant = self.topViewOriginalHeight!
                self.viewPager.frame = CGRect(x: self.viewPager.frame.origin.x, y: self.topViewOriginalHeight!, width: self.viewPager.frame.width, height: self.viewPager.frame.height)
                
            }
            
            
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
            // move down
            if !scrollView.isDecelerating{
                
                self.topViewHeightConstraint.constant = 0
                self.viewPager.frame = CGRect(x: self.viewPager.frame.origin.x, y: 0, width: self.viewPager.frame.width, height: self.viewPager.frame.height)
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
        let leftAndRightPaddings: CGFloat = 30
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (screenSize.width-leftAndRightPaddings)/numberOfItemsPerRow
        if collectionView.tag == 0{
            return CGSize(width: width, height: width)
            
        }
        return CGSize(width: width, height: width*1.4)
    }
    
    
}

extension UIApplication {
    var icon: UIImage? {
        guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? NSDictionary,
            let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? NSDictionary,
            let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? NSArray,
            // First will be smallest for the device class, last will be the largest for device class
            let lastIcon = iconFiles.lastObject as? String,
            let icon = UIImage(named: lastIcon) else {
                return nil
        }
        
        return icon
    }
}

extension StoreViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchToggle(self)
    }
    
}
