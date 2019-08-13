//
//  DetailsViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/14/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var content : StoreItemCellContent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .red
        self.navigationController?.navigationBar.backgroundColor = .red
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        self.view.addSubview(label)

        guard let content = self.content else{
            label.text = "No Data"
            return
        }
        label.text = content.title
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
