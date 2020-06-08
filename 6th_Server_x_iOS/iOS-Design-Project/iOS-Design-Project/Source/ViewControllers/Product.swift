//
//  Product.swift
//  iOS-Design-Project
//
//  Created by 김태훈 on 2020/05/24.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation

struct Product {
    var ProductImageName: String
    var ProductName:String
    var ProductPrice:String
    init (imagname:String, name:String,price:String){
        self.ProductImageName = imagname
        self.ProductName = name
        self.ProductPrice = price
    }
}
/*
enum ProductView {
    case recommend
    case roketFresh
    case todaySale
    func getProductInfo() -> String{
        switch self {
        case .recommend: return "님의 추천상품"
        case .roketFresh: return "로켓 프레시"
        case .todaySale: return "오늘의 특가"
        }
    }
}
*/
