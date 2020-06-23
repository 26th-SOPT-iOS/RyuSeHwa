//
//  ProfileData.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 13/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

struct ProfileData: Codable { var status: Int
    var success: Bool
    var message: String
    var data: [UserProfile]?
    enum CodingKeys: String, CodingKey { case status = "status"
        case success = "success"
        case message = "message"
        case data = "data" }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([UserProfile].self, forKey: .data)) ?? nil
    }
    
}


struct UserProfile: Codable { var name: String
    var email: String
    var phone: String
    var profile: String }
