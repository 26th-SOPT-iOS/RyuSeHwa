//
//  HeartsDataSE.swift
//  iOS-Soptkathon
//
//  Created by 김성은 on 2020/06/07.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import UIKit

struct HeartsDataSE: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: [Music]?
        
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
        data = (try? values.decode([Music].self, forKey: .data)) ?? nil
    }
}

struct Music: Codable {
    var title: String
    var num_of_hearts: Int
    var isChecked: Int
}

