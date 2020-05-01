//
//  JoinViewController.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 30/04/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet weak var enterID: UITextField!
    @IBOutlet weak var enterPW: UITextField!
    
    @IBOutlet var finishButton: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()

        // Do any additional setup after loading the view.
    }
    
    func setLayout() {
        finishButton.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.height * 0.5
        })
//
//    @IBAction func transferData(_ sender: Any) {
//        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else { return }
//
//        receiveViewController.id = enterID.text
//        receiveViewController.pw = enterPW.text
//        self.present(receiveViewController, animated: true, completion: {if let navController = self.navigationController {
//        navController.popViewController(animated: true)
//    }}) // completion: return to the main page by 'popViewController'
    
    }

}

