//
//  SecondViewController.swift
//  iOS_FirstWeek_Seminar_Sehwa
//
//  Created by Sehwa Ryu on 18/04/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabels()
    }
    
    @IBAction func backScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var name: String?
    var email: String?
    var isOnOff: Bool?
    var frequency: Float?
    
    private func setLabels() {
        // Optional Binding: 값이 있을수도 있고 없을수도 있기 때문
        guard let name = self.name else { return }
        guard let email = self.email else { return }
        guard let isOnOff = self.isOnOff else { return }
        guard let frequency = self.frequency else { return }
        
        // Label에 값 대입
        nameLabel.text = name
        emailLabel.text = email
        switchLabel.text = isOnOff ? "On" : "Off"
        frequencyLabel.text = "\(frequency)"
        
    }
    


}
