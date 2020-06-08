//
//  ProductCollectionViewHeader.swift
//  iOS-Design-Project
//
//  Created by 김태훈 on 2020/05/28.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ProductCollectionViewHeader: UICollectionReusableView {
    var sectionNumber:Int?
    @IBOutlet weak var name: UILabel!
    @IBAction func HeaderButtonClicked(_ sender: Any) {
        switch sectionNumber {
        case 0:
            print("추천상품 클릭")
        case 1:
            print("로켓프레쉬 클릭")
        case 2:
            print("오특 클릭")
        default:
            print("default")
        }
    }
}
