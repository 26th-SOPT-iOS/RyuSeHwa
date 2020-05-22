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
    
    @IBAction func signUp(_ sender: Any) {
        guard let inputID = enterID.text else { return }
        guard let inputPWD = enterPW.text else { return }
        guard let inputName = enterName.text else { return }
        guard let inputEmail = enterEmail.text else { return }
        guard let inputPhone = enterNum.text else { return }
        
        SignupService.shared.Signup(id: inputID, pwd: inputPWD, name: inputName, email: inputEmail, phone: inputPhone) {
        networkResult in
        switch networkResult {
        // 회원가입 성공시
        case .success:
            LoginService.shared.login(id: inputID, pwd: inputPWD) {
            networkResults in
            switch networkResults{
                case .success:
                // 회원가입에 성공했을때
                guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? ViewController else {return}
                receiveViewController.id = inputID //id값 넘겨줌
                receiveViewController.pw = inputPWD //pwd 값 넘겨줌
                self.navigationController?.show(receiveViewController, sender: self)

            case .requestErr(let message):
                guard let message = message as? String else {return}
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkfail")
                }
            }
            case .requestErr(let message):
                        guard let message = message as? String else {return}
                        let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                        alertViewController.addAction(action)
                        self.present(alertViewController, animated: true, completion: nil)
                    case .pathErr: print("path")
                    case .serverErr: print("serverErr")
                    case .networkFail: print("networkfail")
                        
                    }
                    
                }
            }
    
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
        
        enterID.addLeftSpace2()
        enterPW.addLeftSpace2()
        enterName.addLeftSpace2()
        enterEmail.addLeftSpace2()
        enterNum.addLeftSpace2()
        
    }
    
    func setLayout() {
        finishButton.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.height * 0.5
        })
    
    }

}

// 텍스트 공간 남기기
extension UITextField {
    func addLeftSpace2() {
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: self.frame.height))
        self.leftView = spaceView
        self.leftViewMode = ViewMode.always
    }
}

