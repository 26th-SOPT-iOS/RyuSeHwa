//
//  TabBarCellJH.swift
//  iOS-Design-Project
//
//  Created by 이주혁 on 2020/05/30.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class TabBarCellJH: UITableViewCell {
    
    static let identifier = "TabBarCellJH"

    @IBOutlet var tabNameLabel: UILabel!
    
    @IBOutlet var tabIndicatorView: UIView!
    
    @IBOutlet var indicatorHeightConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
