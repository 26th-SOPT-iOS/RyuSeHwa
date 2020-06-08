//
//  ViewController.swift
//  iOS-Soptkathon
//
//  Created by Sehwa Ryu on 06/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var pwText: UITextField!
    @IBOutlet weak var login: UIButton!
    
    @IBAction func move(_ sender: Any) {
        let viewController:UIViewController = UIStoryboard(name: "Tabbar", bundle:nil).instantiateViewController(withIdentifier: "TabbarVC") as UIViewController
        self.present(viewController, animated: false, completion: nil)

    }
    
    
    
    @IBAction func login(_ sender: Any) {
        guard let inputID = idText.text else { return }
        guard let inputPWD = pwText.text else { return }

        // 미리 정의해 둔 싱글톤 객체 통해 데이터 통신
        LoginService.shared.login(id: inputID, password: inputPWD) {
            networkResult in
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                // 로그인 성공 후 tabbar controller로 넘어가기
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "TabbarVC") as? UITabBarController
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        idText.addLeftPadding()
        pwText.addLeftPadding()
    }
}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
