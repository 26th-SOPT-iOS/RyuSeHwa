//
//  Conv1.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 11/05/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class Conv1: UITableViewCell {

    static let identifier: String = "Conv1"
    
    @IBOutlet weak var convProfile: UIImageView!
    @IBOutlet weak var convName: UILabel!
    @IBOutlet weak var convStatus: UILabel!
    
    @IBOutlet weak var imageTopConstraints: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setProfileInformation(profileImg:UIImage,profileName:String,profileStatus:String){
        convProfile.image = profileImg
        convName.text = profileName
        convStatus.text = profileStatus
    }
        
    }

