//
//  HeartCollectionViewCell.swift
//  iOS-Soptkathon
//
//  Created by Sehwa Ryu on 07/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class HeartCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HeartCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    func set(_ heartInformation: TravelSH) {
           imageView.image = heartInformation.imageName
           title.text = heartInformation.titleName
           
       }
    
}
