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
    @IBOutlet weak var enterName: UITextField!
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterNum: UITextField!
    @IBOutlet var finishButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()

        enterID.layer.cornerRadius = 22.0
        enterID.layer.borderWidth = 1.0
        enterID.layer.borderColor = UIColor.white.cgColor
        
        enterPW.layer.cornerRadius = 22.0
        enterPW.layer.borderWidth = 1.0
        enterPW.layer.borderColor = UIColor.white.cgColor
        
        enterName.layer.cornerRadius = 22.0
        enterName.layer.borderWidth = 1.0
        enterName.layer.borderColor = UIColor.white.cgColor
        
        enterEmail.layer.cornerRadius = 22.0
        enterEmail.layer.borderWidth = 1.0
        enterEmail.layer.borderColor = UIColor.white.cgColor
        
        enterNum.layer.cornerRadius = 22.0
        enterNum.layer.borderWidth = 1.0
        enterNum.layer.borderColor = UIColor.white.cgColor
        
        enterID.addLeftPadding2()
        enterPW.addLeftPadding2()
        enterName.addLeftPadding2()
        enterEmail.addLeftPadding2()
        enterNum.addLeftPadding2()
        
    }
    
    func setLayout() {
        finishButton.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.height * 0.5
        })
    
    }

}

// 텍스트 공간 남기기
extension UITextField {
    func addLeftPadding2() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

