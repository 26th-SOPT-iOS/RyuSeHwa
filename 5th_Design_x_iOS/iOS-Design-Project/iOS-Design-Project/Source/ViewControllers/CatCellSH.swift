//
//  CatCellSH.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 27/05/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class CatCellSH: UICollectionViewCell {
    static let identifier: String = "CatCellSH"
        
    @IBOutlet weak var CatImageView: UIImageView!
    func set(_ categoryInformation: CatSH) {
        CatImageView.image = categoryInformation.imageName
    }
}
