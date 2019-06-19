//
//  Helpers.swift
//  AirBar
//
//  Created by Evgeny Matviyenko on 2/24/17.
//  Copyright © 2017 uptechteam. All rights reserved.
//

import UIKit

extension UIView {
  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }
}

extension CGFloat {
  func map(from firstBounds: (CGFloat, CGFloat), to secondBounds: (CGFloat, CGFloat)) -> CGFloat {
    guard self > firstBounds.0 else {
      return secondBounds.0
    }

    guard self < firstBounds.1 else {
      return secondBounds.1
    }

    let firstBoundsDelta = firstBounds.1 - firstBounds.0
    let ratio = (self - firstBounds.0) / firstBoundsDelta
    return secondBounds.0 + ratio * (secondBounds.1 - secondBounds.0)
  }
}
