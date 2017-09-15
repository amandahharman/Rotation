//
//  Extensions.swift
//  ImageRotation
//
//  Created by Amanda Harman on 9/15/17.
//  Copyright © 2017 Amanda Harman. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  convenience init(hexString: String) {
    var hex = hexString
    if (hex.hasPrefix("#")) {
      hex.remove(at: hex.startIndex)
    }
    var int = UInt32()
    Scanner(string: hex).scanHexInt32(&int)
    let a, r, g, b: UInt32
    
    switch hex.characters.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (1, 1, 1, 1)
    }
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
  }
  
  func toHexString() -> String {
    var r:CGFloat = 0
    var g:CGFloat = 0
    var b:CGFloat = 0
    var a:CGFloat = 0
    
    getRed(&r, green: &g, blue: &b, alpha: &a)
    
    let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
    
    return String(format:"#%06x", rgb)
  }
}

extension UITextField {
  
  func addLabel(_ string: String) {
    let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: self.frame.height, height: self.frame.height))
    label.text = string
    label.textAlignment = .center
    label.font = label.font.withSize(12)
    label.textColor = Constants.UI.Colors.borderColor
    self.leftViewMode = .always
    self.leftView = label
  }
  
  func addBorder() {
    self.layer.cornerRadius = Constants.UI.cornerRadius
    self.layer.borderColor = Constants.UI.Colors.borderColor.cgColor
    self.layer.borderWidth = Constants.UI.borderWidth
  }
  
}

extension UIButton {
  
  func addBorder() {
    self.layer.cornerRadius = Constants.UI.cornerRadius
    self.layer.borderColor = Constants.UI.Colors.borderColor.cgColor
    self.layer.borderWidth = Constants.UI.borderWidth
  }
  
}
