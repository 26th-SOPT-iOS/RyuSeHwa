//
//  TodaySH.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 28/05/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit
// 변수가 세개인 추천상품 구조체 생성
struct TodaySH {
    var imageName: UIImage?
    var productName: String
    var price: String
    var rWow: UIImage?
    var rFresh: UIImage?
    var rDeliver: UIImage?

    init(imageName: String, productName: String, price: String, rWow: String, rFresh: String, rDeliver: String) {
        self.imageName = UIImage(named: imageName)
        self.productName = productName
        self.price = price
        self.rWow = UIImage(named:rWow)
        self.rFresh = UIImage(named: rFresh)
        self.rDeliver = UIImage(named:rDeliver)

} }
