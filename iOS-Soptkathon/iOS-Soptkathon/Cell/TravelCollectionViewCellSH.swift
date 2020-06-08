//
//  TravelCollectionViewCellSH.swift
//  iOS-Soptkathon
//
//  Created by Sehwa Ryu on 07/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class TravelCollectionViewCellSH: UICollectionViewCell {
    static let identifier: String = "TravelCollectionViewCellSH"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func set(_ travelInformation: TravelSH) {
        imageView.image = travelInformation.imageName
        title.text = travelInformation.titleName
        
    }
    
}
