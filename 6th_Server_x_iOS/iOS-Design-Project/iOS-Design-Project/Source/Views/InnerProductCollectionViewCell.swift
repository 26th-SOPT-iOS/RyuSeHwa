//
//  InnerProductCollectionViewCell.swift
//  iOS-Design-Project
//
//  Created by 김태훈 on 2020/05/29.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class InnerProductCollectionViewCell: UICollectionViewCell {
    static let identifier:String = "innercell"
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductPrice: UILabel!
    
}
