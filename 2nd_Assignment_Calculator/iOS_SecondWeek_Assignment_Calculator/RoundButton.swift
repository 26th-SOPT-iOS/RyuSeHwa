//
//  RoundButton.swift
//  iOS_SecondWeek_Assignment_Calculator
//
//  Created by Sehwa Ryu on 30/04/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
