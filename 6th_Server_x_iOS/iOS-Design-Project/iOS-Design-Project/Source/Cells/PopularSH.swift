//
//  PopularSH.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 29/05/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit
// 변수가 한개인 추천상품 구조체 생성
struct PopularSH {
    var product: String
    var arrowImg: UIImage?
    var titleProduct: String
    var rankNumber: String
    var update: String
    var realTime: UIImage?
    var open = false


    init(Product: String, arrowImg: String, titleProduct: String, rankNumber: String, update: String, realTime: String) {
        self.product = Product
        self.arrowImg = UIImage(named: arrowImg)
        self.titleProduct = titleProduct
        self.rankNumber = rankNumber
        self.update = update
        self.realTime = UIImage(named: realTime)
}
    
}
