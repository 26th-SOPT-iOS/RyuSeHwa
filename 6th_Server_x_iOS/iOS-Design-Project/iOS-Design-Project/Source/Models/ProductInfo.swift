//
//  ProductInfo.swift
//  iOS-Design-Project
//
//  Created by 이유진 on 2020/05/28.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation

struct ProductInfo {
    var mainimg: String
    var name: String
    var price: String
    //로켓와우[0],로켓프레쉬[1],로켓배송[2]에 관련된 정보
    var subinfo : [Bool] = [false,false,false]
    var subinfo_img : [String] = []
    
    
    init(mainimg:String, name: String, price: String, subinfo: [Bool]) {
        self.mainimg = mainimg
        self.name = name
        self.price = price
        self.subinfo = subinfo
    }
    
    //로켓와우[0],로켓프레쉬[1],로켓배송[2]의 T/F값에 따라 뷰에 띄울 이미지 추가
    mutating func getImageName() -> [String] {
        if subinfo[0] == true{
            self.subinfo_img.append("badgeRoketwow")
        }
        if subinfo[1] == true{
            self.subinfo_img.append("badgeRoketfresh")
        }
        if subinfo[2] == true{
            self.subinfo_img.append("badgeRoketdelivery")
        }
        
        return subinfo_img
    }
}
