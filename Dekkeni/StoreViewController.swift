//
//  StoreViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/11/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit
class StoreViewController: UITabBarController, WormTabStripDelegate{
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
    let colors = [
        UIColor.red,
        UIColor.blue,
        UIColor.green,
        UIColor.magenta,
        UIColor.cyan,
        UIColor.yellow,
        UIColor.red,
        UIColor.blue
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:90))
        searchView.backgroundColor = .red
        let text = UITextField(frame: CGRect(x: 20, y: 30, width: self.view.frame.width*0.666, height: searchView.frame.height/1.5))
        text.backgroundColor = .white
        text.textColor = .white
        text.placeholder = "Search"
        text.borderStyle = .roundedRect
        searchView.addSubview(text)
        
        let button = UIButton(frame: CGRect(x: text.frame.origin.x + text.frame.width + 10, y: text.frame.origin.y, width: searchView.frame.width*0.2, height: text.frame.height))
        
        button.backgroundColor = .white
        button.tintColor = .red
        button.titleLabel?.text = "Menu"
        button.setTitleColor(.red, for: .normal)
        button.cornerRadius = 10
        
        searchView.addSubview(button)
        
        self.view.addSubview(searchView)
        
        
        let frame =  CGRect(x: 0, y: 90, width: self.view.frame.size.width, height: self.view.frame.size.height)
        let viewPager:WormTabStrip = WormTabStrip(frame: frame)
        self.view.addSubview(viewPager) //IMPORTANT!
        viewPager.delegate = self
        viewPager.eyStyle.wormStyel = .LINE
        viewPager.eyStyle.isWormEnable = false
        viewPager.eyStyle.spacingBetweenTabs = 15
        viewPager.eyStyle.dividerBackgroundColor = .white
        viewPager.eyStyle.tabItemSelectedColor = .white
        //default selected tab
        viewPager.currentTabIndex = 0
        //center the selected tab
        viewPager.shouldCenterSelectedWorm = true
        viewPager.buildUI()
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func WTSNumberOfTabs() -> Int {
        return titles.count
    }
    
    func WTSViewOfTab(index: Int) -> UIView {
        let view = UIView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height))
        let tableView = UITableView(frame: CGRect(x: view.frame.origin.x
            , y: view.frame.origin.y, width: view.frame.width, height: view.frame.height))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "StoreTableViewCell", bundle: nil), forCellReuseIdentifier: "StoreItem")
        
        view.addSubview(tableView)
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

extension StoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreItem", for: indexPath)
        
        return cell
    }
    
    
    
}
extension StoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 367
    }
    
}
