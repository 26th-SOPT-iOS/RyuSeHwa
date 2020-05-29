//
//  PopularTitleCell.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 29/05/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class PopularTitleCellSH: UITableViewCell {

    @IBOutlet weak var arrowImg: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var rankNumber: UILabel!
    @IBOutlet weak var update: UILabel!
    @IBOutlet weak var realTime: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(_ recInformation: PopularSH) {
        arrowImg.image = recInformation.arrowImg
        productLabel.text = recInformation.titleProduct
        rankNumber.text = recInformation.rankNumber
        update.text = recInformation.update
        realTime.image = recInformation.realTime
        

}

}
