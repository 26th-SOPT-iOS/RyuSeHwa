//
//  RocketCellSH.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 28/05/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class RocketCellSH: UICollectionViewCell {
    static let identifier: String = "RocketCellSH"
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var rocketWow: UIImageView!
    @IBOutlet weak var rocketFresh: UIImageView!
    @IBOutlet weak var rocketDelivery: UIImageView!
    
    func set(_ recInformation: RocketSH) {
        productImage.image = recInformation.imageName
        productName.text = recInformation.productName
        productPrice.text = recInformation.price
        rocketWow.image = recInformation.rWow
        rocketFresh.image = recInformation.rFresh
        rocketDelivery.image = recInformation.rDeliver
    }
    
}
