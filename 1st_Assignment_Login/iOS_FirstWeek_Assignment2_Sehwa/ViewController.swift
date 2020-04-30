//
//  ViewController.swift
//  iOS_FirstWeek_Assignment2_Sehwa
//
//  Created by Sehwa Ryu on 18/04/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var enterID: UITextField!
    @IBOutlet weak var enterPW: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func transferData(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else { return }
        
        receiveViewController.id = enterID.text
        receiveViewController.pw = enterPW.text
        self.present(receiveViewController, animated: true, completion: {if let navController = self.navigationController {
        navController.popViewController(animated: true)
            }})
    
}

}
