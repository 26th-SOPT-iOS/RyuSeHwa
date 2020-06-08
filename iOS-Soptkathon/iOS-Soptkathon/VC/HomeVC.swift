//
//  HomeVC.swift
//  iOS-Soptkathon
//
//  Created by Sehwa Ryu on 06/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var ContentsCollectionView: UICollectionView!
    
    @IBOutlet weak var contentPageControl: UIPageControl!
    
    @IBOutlet weak var TravelCollectionView: UICollectionView!
    
    @IBOutlet weak var HeartCollectionView: UICollectionView!
    private var contentList : [ContentSH] = []
    
    private var travelList: [TravelSH] = []
    private var heartList: [TravelSH] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ContentsCollectionView.delegate = self
        ContentsCollectionView.dataSource = self
        setContentList()
        contentPageControl.pageIndicatorTintColor = .gray
        contentPageControl.currentPageIndicatorTintColor = .white
        
        TravelCollectionView.delegate = self
        TravelCollectionView.dataSource = self
        setTravelList()
        setTravelView()
        
        HeartCollectionView.delegate = self
        HeartCollectionView.dataSource = self
        setHeartList()
        setHeartView()
        
        

    }
    
    private func setContentList() {
        let sec1 = ContentSH(imageName: "12", titleName: "도쿄의 심장, 오사카", subtitleName: "누군가에겐 늘 똑같은 일상이 다른 누군가에겐 특별한 순간으로 기억됩니다.")
        let sec2 = ContentSH(imageName: "12", titleName: "도쿄의 심장, 오사카", subtitleName: "누군가에겐 늘 똑같은 일상이 다른 누군가에겐 특별한 순간으로 기억됩니다.")
        let sec3 = ContentSH(imageName: "12", titleName: "도쿄의 심장, 오사카", subtitleName: "누군가에겐 늘 똑같은 일상이 다른 누군가에겐 특별한 순간으로 기억됩니다.")
        
        contentList = [sec1, sec2, sec3]
    }
    
    private func setTravelList() {
        let sec1 = TravelSH(imageName: "homeContentsRowA01", titleName: "바쁜뉴욕의 길거리")
        let sec2 = TravelSH(imageName: "homeContentsRowA02", titleName: "영국의 크리스마스")
        let sec3 = TravelSH(imageName: "homeContentsRowA03", titleName: "바쁜뉴욕의 길거리")
        let sec4 = TravelSH(imageName: "homeContentsRowA01", titleName: "영국의 크리스마스")
        let sec5 = TravelSH(imageName: "homeContentsRowA02", titleName: "바쁜뉴욕의 길거리")
        
        travelList = [sec1, sec2, sec3, sec4, sec5]
    }
    
    private func setHeartList() {
        let sec1 = TravelSH(imageName: "homeContentsRowB01", titleName: "외딴섬 자르비스")
        let sec2 = TravelSH(imageName: "homeContentsRowB02", titleName: "영국의 크리스마스")
        let sec3 = TravelSH(imageName: "homeContentsRowB03", titleName: "바쁜뉴욕의 길거리")
        let sec4 = TravelSH(imageName: "homeContentsRowB03", titleName: "영국의 크리스마스")
        let sec5 = TravelSH(imageName: "homeContentsRowB03", titleName: "바쁜뉴욕의 길거리")
        
        heartList = [sec1, sec2, sec3, sec4, sec5]
    }
    
    private func setTravelView() {
        // width, height 설정
        let cellWidth = TravelCollectionView.frame.width/2
        let cellHeight = TravelCollectionView.frame.height
         
         // 상하 inset value 설정
         //let insetY = (CatCollectionView.bounds.height - cellHeight) / 2.0
         let layout = TravelCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
         layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
         layout.minimumLineSpacing = 0
         layout.scrollDirection = .horizontal
        
         TravelCollectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
         
         // 스크롤 시 빠르게 감속 되도록 설정
         TravelCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    private func setHeartView() {
        // width, height 설정
        let cellWidth = HeartCollectionView.frame.width/2
        let cellHeight = HeartCollectionView.frame.height
         
         // 상하 inset value 설정
         //let insetY = (CatCollectionView.bounds.height - cellHeight) / 2.0
         let layout = HeartCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
         layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
         layout.minimumLineSpacing = 0
         layout.scrollDirection = .horizontal
        
         HeartCollectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
         
         // 스크롤 시 빠르게 감속 되도록 설정
         HeartCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }


    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.ContentsCollectionView {
            return 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.ContentsCollectionView {
            contentPageControl.numberOfPages = contentList.count
            return contentList.count
        } else {
            return travelList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.ContentsCollectionView {
            guard let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentsCollectionViewCell.identifier, for: indexPath) as? ContentsCollectionViewCell else { return UICollectionViewCell()}
            contentCell.set(contentList[indexPath.row])
            return contentCell
        } else if collectionView == self.TravelCollectionView {
            guard let travelCell = collectionView.dequeueReusableCell(withReuseIdentifier: TravelCollectionViewCellSH.identifier, for: indexPath) as? TravelCollectionViewCellSH else { return UICollectionViewCell()}
            travelCell.set(travelList[indexPath.row])
            return travelCell
        } else {
            guard let heartCell = collectionView.dequeueReusableCell(withReuseIdentifier: HeartCollectionViewCell.identifier, for: indexPath) as? HeartCollectionViewCell else { return UICollectionViewCell()}
            heartCell.set(heartList[indexPath.row])
            return heartCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.ContentsCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else {
            return CGSize(width: collectionView.frame.width/1.5, height: collectionView.frame.height)
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            if collectionView == self.ContentsCollectionView {
                return 0
            } else {
                return 10
            }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.ContentsCollectionView {
            return 0
        } else {
            return 15
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        contentPageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)

    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        contentPageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

