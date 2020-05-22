//
//  ViewController.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 30/04/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var enterID: UITextField!
    @IBOutlet weak var enterPW: UITextField!
    @IBOutlet var joinButton: [UIButton]!
    
    var id: String?
    var pw: String?
    
    private func setLabels() {
        guard let id = self.id else { return }
        guard let pw = self.pw else { return }
        
        enterID.text = id
        enterPW.text = pw
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLayout()
        setLabels()
        enterID.layer.cornerRadius = 22.0
        enterID.layer.borderWidth = 1.0
        enterID.layer.borderColor = UIColor.white.cgColor
        
        enterPW.layer.cornerRadius = 22.0
        enterPW.layer.borderWidth = 1.0
        enterPW.layer.borderColor = UIColor.white.cgColor
        
        enterID.addLeftSpace()
        enterPW.addLeftSpace()
    }
    
    @IBAction func login(_ sender: Any) {
        guard let inputID = enterID.text else { return }
        guard let inputPWD = enterPW.text else { return }
        
        // 미리 정의해 둔 싱글톤 객체 통해 데이터 통신
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                // 로그인 성공 후 tabbar controller로 넘어가기
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "customTabbarController") as? UITabBarController
                    else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
            // 로그인 실패시 AlertViewcon 열기
            case .requestErr(let message):
                    guard let message = message as? String else { return }
                    let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                    alertViewController.addAction(action)
                    self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr") case .networkFail: print("networkFail") }
        }
    }

    
    func setLayout() {
        joinButton.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.height * 0.5
        })
}
}

extension UITextField {
    func addLeftSpace() {
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: self.frame.height))
        self.leftView = spaceView
        self.leftViewMode = ViewMode.always
    }
}

    

