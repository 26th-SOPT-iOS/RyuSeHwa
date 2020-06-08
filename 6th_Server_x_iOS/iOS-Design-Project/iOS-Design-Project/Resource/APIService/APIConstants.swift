//
//  APIConstants.swift
//  iOS-Design-Project
//
//  Created by 이주혁 on 2020/05/30.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://ec2-3-34-36-2.ap-northeast-2.compute.amazonaws.com:3000"
    
    // URL Info
    // Items URL
    static let itemsURL = APIConstants.baseURL + "/items"
    static let itemsRecommandedURL = APIConstants.itemsURL + "/recommand"
    static let itemsInBasketURL = APIConstants.itemsURL + "/basket"
    static let itemsCountInBasketURL = APIConstants.itemsInBasketURL + "/count"
    // Search URL
    static let searchURL = APIConstants.baseURL + "/search"
    
}
