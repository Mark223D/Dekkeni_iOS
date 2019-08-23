//
//  DekkeniTextField.swift
//  Dekkeni
//
//  Created by Mark on 8/22/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//


import UIKit

@IBDesignable
class DekkeniTextField: UITextField {
    @IBInspectable var insetX: CGFloat = 5
    @IBInspectable var insetY: CGFloat = 0
    @IBInspectable var isSecure: Bool = false
    @IBInspectable var placeholderText: String = ""
    var bottomBar:UIView?
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {

        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {

        return textRect(forBounds: bounds)
    }

    override func awakeFromNib() {
        setupView()
    }
    func setupView(){
        self.tintColor = UIColor.red
        self.textColor = UIColor.red
        self.isSecureTextEntry = isSecure
        self.layer.cornerRadius = 15
        
        self.minimumFontSize = 20
        
        self.attributedPlaceholder = NSAttributedString(string: placeholderText,attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        
        bottomBar = UIView(frame: CGRect(x: self.frame.origin.x, y: self.frame.height-20, width: self.frame.width*0.8, height: 2))
        bottomBar?.backgroundColor = UIColor.red
//        self.addSubview(bottomBar!)
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

