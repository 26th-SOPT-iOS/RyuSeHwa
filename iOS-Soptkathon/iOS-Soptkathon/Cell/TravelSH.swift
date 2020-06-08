//
//  TravelSH.swift
//  iOS-Soptkathon
//
//  Created by Sehwa Ryu on 07/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit
// 변수가 하나인 광고 구조체 생성
struct TravelSH {
    var imageName: UIImage?
    var titleName: String

    init(imageName: String, titleName: String) {
        self.imageName = UIImage(named: imageName)
        self.titleName = titleName

} }
