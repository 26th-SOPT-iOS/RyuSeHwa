//
//  MusicDataSE.swift
//  iOS-Soptkathon
//
//  Created by 김성은 on 2020/06/07.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
//
//struct MusicDataSE: Codable {
//    var status: Int
//        var success: Bool
//        var message: String
//        var data: MusicList?
//
//    enum CodingKeys: String, CodingKey {
//        case status = "status"
//        case success = "success"
//        case message = "message"
//        case data = "data"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
//        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
//        message = (try? values.decode(String.self, forKey: .message)) ?? ""
//        data = (try? values.decode(MusicList.self, forKey: .data)) ?? nil
//    }
//}
//
//struct MusicList: Codable {
//    var music: [MusicData]
//}
//
//struct MusicData: Codable {
//    var musicIdx: Int
//    var title: String
//    var contents: String
//    var youtube_url: String
//    var largeCategory: String
//    var smallCategory: String
//    var backgroundImageUrl: String
//    var num_of_hearts: Int
//    var isChecked: Int
//}
//
