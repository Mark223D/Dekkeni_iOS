//
//  ContainerVC.swift
//  Dekkeni
//
//  Created by Mark on 6/17/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import Foundation
import UIKit

class ContainerVC : UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    
    let leftMenuWidth:CGFloat = 260
    
    override func viewDidLoad() {
        
        DispatchQueue.main.async() {
            self.closeMenu(animated: false)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(ContainerVC.toggleMenu), name: NSNotification.Name(rawValue: "toggleMenu"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ContainerVC.closeMenuViaNotification), name: NSNotification.Name(rawValue: "closeMenuViaNotification"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ContainerVC.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ContainerVC.openModalWindow), name: NSNotification.Name(rawValue: "openModalWindow"), object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func openModalWindow() {
        performSegue(withIdentifier: "openModalWindow", sender: nil)
    }
    
    @objc func toggleMenu() {
        scrollview.contentOffset.x == 0  ? closeMenu() : openMenu()
    }
    
    @objc func closeMenuViaNotification(){
        closeMenu()
    }
    
    func closeMenu(animated:Bool = true){
        scrollview.setContentOffset(CGPoint(x: leftMenuWidth, y: 0), animated: animated)
    }
    
    func openMenu(){
        scrollview.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    

    @objc func rotated(){
        if UIDevice.current.orientation != .portrait  {
            DispatchQueue.main.async() {
                self.closeMenu()
            }
        }
    }
    
}

extension ContainerVC : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollView.isPagingEnabled = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollView.isPagingEnabled = false
    }
}

