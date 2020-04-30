//
//  ViewController.swift
//  iOS_SecondWeek_Assignment_Calculator
//
//  Created by Sehwa Ryu on 30/04/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //@IBOutlet var operatorButton: [UIButton]!
    //@IBOutlet var digitButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RoundBtn()
        
    }
    @IBOutlet var Button: [UIButton]!

    func RoundBtn(){
         
         for btn in Button{
             
             btn.layer.cornerRadius = 39
             btn.layer.masksToBounds = true
         }
    
     }


}
