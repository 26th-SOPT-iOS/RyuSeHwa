//
//  trendingDataSH.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 04/06/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation
import Alamofire

struct trendingDataSH: Codable {
    //var status: Int
    var success: Bool
    var message: String
    var data: [trendingData]

    enum CodingKeys: String, CodingKey {
        //case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([trendingData].self, forKey: .data)) ?? []
    }
}

struct trendingData: Codable {
    var name: String
}
