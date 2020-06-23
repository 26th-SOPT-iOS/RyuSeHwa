//
//  NetworkResult.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 16/05/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
