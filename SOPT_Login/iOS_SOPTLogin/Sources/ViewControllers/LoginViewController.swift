//
//  LoginViewController.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 30/04/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var enterID: UILabel!
    @IBOutlet weak var enterPW: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func homeScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var id: String?
    var pw: String?

    private func setLabels() {
        guard let id = self.id else { return }
        guard let pw = self.pw else { return }
        
        enterID.text = id
        enterPW.text = pw
    }
}
