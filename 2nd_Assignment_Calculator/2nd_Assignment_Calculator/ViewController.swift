//
//  ViewController.swift
//  2nd_Assignment_Calculator
//
//  Created by Sehwa Ryu on 30/04/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var digitButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    
    func setLayout(){
        digitButton.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.height  * 0.5
        })
    }


}

