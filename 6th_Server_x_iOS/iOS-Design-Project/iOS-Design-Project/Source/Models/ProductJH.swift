//
//  Product.swift
//  iOS-Design-Project
//
//  Created by 이주혁 on 2020/05/28.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation

enum ProductCategory {
    case rocketFresh, rocketDelivery, normalProduct
}


struct ProductJH {
    var category: ProductCategory
    var name: String
    var imgStr: String
    var priceStr: String
}
