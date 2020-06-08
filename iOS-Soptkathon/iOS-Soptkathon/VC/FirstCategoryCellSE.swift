//
//  FirstCategoryCellSE.swift
//  iOS-Soptkathon
//
//  Created by 김성은 on 2020/06/07.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class FirstCategoryCellSE: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var isChecked: Int = 0
    
    @IBAction func heartButton(_ sender: Any) {
        
        HeartsServiceSE.shared.heart(musicIdx: 1, isChecked: 0) { networkResult in
            switch networkResult {
            case .success(let data):
                print(data)
                
            case .requestErr(let message):
                /*guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)*/print("requestErr")
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }
}
