//
//  CartViewController.swift
//  Dekkeni
//
//  Created by Mark on 8/23/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var controlsStack: UIStackView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var checkoutBtn: DekkeniButton!
    
    @IBOutlet weak var paymentStack: UIStackView!
    @IBOutlet weak var paymentBtn: UIButton!
    
    @IBOutlet weak var addressStack: UIStackView!
    @IBOutlet weak var address: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.layer.addShadow()
        self.addressLabel.layer.addShadow()
        self.addressLabel.layer.cornerRadius = 10

        self.totalLabel.layer.addShadow()
        self.checkoutBtn.layer.addShadow()

        self.tableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "cartItem")
        
        self.addressStack.isHidden = true
        self.paymentStack.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBAction func closeAddress(_ sender: Any) {
        self.addressStack.isHidden = true
        self.address.isHidden = false
    }
    
    @IBAction func closePayment(_ sender: Any) {
        self.paymentStack.isHidden = true
        self.paymentBtn.isHidden = false
    }
    @IBAction func addressBtnPressed(_ sender: Any) {
        self.addressStack.isHidden = false
        self.address.isHidden = true
    }
    
    @IBAction func paymentBtnPressed(_ sender: Any) {
        self.paymentStack.isHidden = false
        self.paymentBtn.isHidden = true
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

extension CartViewController: UITableViewDelegate{
    
}
extension CartViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartItem") as! CartTableViewCell
        
        return cell
    }
    
    
}
