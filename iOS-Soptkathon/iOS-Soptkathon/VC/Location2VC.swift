//
//  Location2VC.swift
//  iOS-Soptkathon
//
//  Created by Sehwa Ryu on 06/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class Location2VC: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    
    var locationName: String = ""
    
    let koreaTitleList: [String] = ["서울의 비 내리는 저녁 산책", "서울 청계천 달빛 산책"]
    let japanTitleList: [String] = ["도쿄 야마노테선 한 바퀴", "오키나와 국제거리 신호등 소리"]
    let chinaTitleList: [String] = ["도쿄 야마노테선 한 바퀴", "오키나와 국제거리 신호등 소리"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        
        locationLabel.text = locationName
        
        firstCollectionView.dataSource = self
        firstCollectionView.delegate = self
        secondCollectionView.dataSource = self
        secondCollectionView.delegate = self
        thirdCollectionView.dataSource = self
        thirdCollectionView.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Location2VC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.secondCollectionView {
            let storyboard = UIStoryboard.init(name: "Play", bundle: nil)
            guard let view = storyboard.instantiateViewController(identifier: "PlayVC") as? PlayVC else { return }
            
            self.present(view, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /*MusicServiceSE.shared.getMusicList { networkResult in
            switch networkResult {
                
            case .success(let data):
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }*/
        
        
        switch collectionView {
        case self.firstCollectionView:
            guard let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCell", for: indexPath) as? FirstCategoryCellSE else { return UICollectionViewCell() }
            
            firstCell.titleLabel.text = koreaTitleList[indexPath.row]
            
            if indexPath.row == 0 {
                firstCell.imageView.image = UIImage(named: "imgRowA01")
            }
            else {
                firstCell.imageView.image = UIImage(named: "imgRowA02")
            }
            return firstCell
        case self.secondCollectionView:
            guard let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCell", for: indexPath) as? SecondCategoryCellSE else { return UICollectionViewCell() }
            
            secondCell.titleLabel.text = japanTitleList[indexPath.row]
            
            if indexPath.row == 0 {
                secondCell.imageView.image = UIImage(named: "imgRowB01")
            }
            else {
                secondCell.imageView.image = UIImage(named: "imgRowB02")
            }
            return secondCell
        default:
            guard let thirdCell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdCell", for: indexPath) as? ThirdCategoryCellSE else { return UICollectionViewCell() }
            
            thirdCell.titleLabel.text = chinaTitleList[indexPath.row]
            
            if indexPath.row == 0 {
                thirdCell.imageView.image = UIImage(named: "imgRowC01")
            }
            else {
                thirdCell.imageView.image = UIImage(named: "imgRowC02")
            }
            return thirdCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
