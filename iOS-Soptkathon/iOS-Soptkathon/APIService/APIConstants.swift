//
//  APIConstants.swift
//  iOS-Soptkathon
//
//  Created by 양재욱 on 2020/06/07.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://52.79.145.67:3000"
    static let musicURL = APIConstants.baseURL + "/music/list"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let heartsURL = APIConstants.baseURL + "/hearts/"
    static let commentURL = APIConstants.baseURL + "/comments/:music_idx"
}
