//
//  imageDataSH.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 10/06/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation
struct imageDataSH: Codable {
    var success : Bool
    var message : String
    var data : [ImageData]
    
    enum CodingKeys: String, CodingKey{
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init (from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([ImageData].self, forKey: .data)) ?? [ImageData(id: 0, name: "", price: 0, wow: false, delivery: false, fresh: false, basket: false, img: URL(string: "")!, bannerimg: URL(string:"")!)]
    }
}

struct ImageData:Codable{
    var id:Int
    var name:String
    var price:Int
    var wow:Bool
    var delivery:Bool
    var fresh:Bool
    var basket:Bool
    var img:URL
    var bannerimg:URL
}
