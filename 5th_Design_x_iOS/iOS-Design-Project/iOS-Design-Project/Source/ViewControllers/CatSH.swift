//
//  CatSH.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 27/05/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit
// 변수가 하나인 카테고리C 구조체 생성
struct CatSH {
    var imageName: UIImage?

    init(imageName: String) {
        self.imageName = UIImage(named: imageName)

} }
