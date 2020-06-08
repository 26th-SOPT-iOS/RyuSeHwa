//
//  ProductCollectionViewCell2.swift
//  iOS-Design-Project
//
//  Created by 이유진 on 2020/05/29.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ProductCollectionViewCell2: UICollectionViewCell {
    @IBOutlet var proimg_but: UIButton!
    @IBOutlet var pro_name: UILabel!
    @IBOutlet var pro_price: UILabel!
    @IBOutlet var subinfoimg: [UIImageView]!
    
    var index = 0
    
    func setProductInformation(Button_img: String, name: String, price: String, subinfo: [String]) {
        index = 0
        proimg_but.setImage(UIImage(named: Button_img), for: .normal)
        pro_name.text = name
        pro_price.text = price
        for img in subinfo{
            subinfoimg[index].image = UIImage(named: img)
            index += 1
        }
    }
}
