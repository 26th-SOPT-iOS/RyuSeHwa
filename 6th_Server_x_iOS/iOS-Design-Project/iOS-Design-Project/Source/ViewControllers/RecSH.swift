//
//  RecSH.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 28/05/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit
import Foundation
// 변수가 세개인 추천상품 구조체 생성

struct RecSH {
    var productImageName: URL
    var ProductName:String
    var ProductPrice:String
    var rocket: Bool
    var fresh: Bool
    var delivery: Bool
    
    init (imagename:URL, name:String,price:Int, rocket: Bool ,fresh: Bool, delivery: Bool){
        self.productImageName = imagename
        self.ProductName = name
        self.ProductPrice = String(price)
        self.rocket = rocket
        self.fresh = fresh
        self.delivery = delivery
    
    }
}
        
