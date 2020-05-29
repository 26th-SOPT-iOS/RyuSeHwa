//
//  UIColor+Additions.swift
//  4차과제_안다혜,곽민주
//
//  Generated on Zeplin. (2020. 5. 24.).
//  Copyright (c) 2020 __MyCompanyName__. All rights reserved.
//

import UIKit

extension UIColor {

  @nonobjc class var backcolor: UIColor {
    return UIColor(red: 244.0 / 255.0, green: 245.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var mainblue: UIColor {
    return UIColor(red: 79.0 / 255.0, green: 167.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var shadow: UIColor {
    return UIColor(white: 0.0, alpha: 0.08)
  }

  @nonobjc class var textlighgray: UIColor {
    return UIColor(white: 112.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var textgray: UIColor {
    return UIColor(white: 72.0 / 255.0, alpha: 1.0)
  }

}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
  }
}
