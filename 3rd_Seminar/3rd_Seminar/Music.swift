//
//  Music.swift
//  3rd_Seminar
//
//  Created by Sehwa Ryu on 09/05/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit
// Music 모델입니다.
// 멤버 변수가 총 세 개인 Music 구조체를 생성했습니다.
struct Music {
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String

    init(coverName: String, singer: String, title: String) {
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = title
        self.singer = singer

} }
