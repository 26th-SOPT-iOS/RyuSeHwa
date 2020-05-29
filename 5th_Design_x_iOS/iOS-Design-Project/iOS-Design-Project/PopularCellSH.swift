//
//  PopularTableViewCellSH.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 29/05/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class PopularCellSH: UITableViewCell {
    
    @IBOutlet weak var p1: UILabel!
    @IBOutlet weak var p2: UILabel!
    @IBOutlet weak var p3: UILabel!
    @IBOutlet weak var p4: UILabel!
    @IBOutlet weak var p5: UILabel!

    func set(_ popInformation: PopularSH) {
        p1.text = popInformation.product
        p2.text = popInformation.product
        p3.text = popInformation.product
        p4.text = popInformation.product
        p5.text = popInformation.product
    
    }

}
