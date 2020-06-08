//
//  LocationCellSE.swift
//  iOS-Soptkathon
//
//  Created by 김성은 on 2020/06/07.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class LocationCellSE: UITableViewCell {

    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var engLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
