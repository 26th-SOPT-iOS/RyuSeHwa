//
//  ContentsCollectionViewCell.swift
//  iOS-Soptkathon
//
//  Created by Sehwa Ryu on 07/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class ContentsCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ContentsCollectionViewCell"
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var middleView: UIView!


    func set(_ contentInformation: ContentSH) {
        imageView.image = contentInformation.imageName
        title.text = contentInformation.titleName
        subtitle.text = contentInformation.subtitleName
    }
    
    
}
