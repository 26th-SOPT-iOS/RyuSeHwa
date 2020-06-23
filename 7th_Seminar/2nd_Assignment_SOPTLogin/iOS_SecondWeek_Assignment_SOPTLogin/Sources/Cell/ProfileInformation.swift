//
//  ProfileInformation.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 11/05/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

struct ProfileInformation{
    var profileImg: UIImage?
    var profileName:String
    var statusLabel:String

    init(profileImg: UIImage, profileName:String, statusLabel:String){
        self.profileImg = profileImg
        self.profileName = profileName
        self.statusLabel = statusLabel
    }
}


//struct ProfileInformation {
//    var profile: Profile
//    var name: String
//    var status: String
//
//    init(profile: Profile, name: String, status: String) {
//        self.profile = profile
//        self.name = name
//        self.status = status
//}
//}

//enum Profile {
//    case prof1
//    case prof2
//    case prof3
//    case prof4
//    case prof5
//    case prof6
//    case prof7
//    case prof8
//    case prof9
//
//    func getImageName() -> String {
//        switch self {
//        case .prof1: return "profile1Img"
//        case .prof2: return "profile2Img"
//        case .prof3: return "profile3Img"
//        case .prof4: return "profile4Img"
//        case .prof5: return "profile5Img"
//        case .prof6: return "profile6Img"
//        case .prof7: return "profile7Img"
//        case .prof8: return "profile8Img"
//        case .prof9: return "profile9Img"
//}
//}}



