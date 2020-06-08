//
//  MusicData.swift
//  iOS-Soptkathon
//
//  Created by 양재욱 on 2020/06/07.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

struct MusicData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: MusicList?
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(MusicList.self, forKey: .data)) ?? nil
    }

}

struct MusicList: Codable{
    var idx: Int
    var title: String
    var subTitle: String
}
