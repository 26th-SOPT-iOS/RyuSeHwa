//
//  CollectionViewSampleViewController.swift
//  3rd_Seminar
//
//  Created by Sehwa Ryu on 09/05/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class CollectionViewSampleViewController: UIViewController {

    @IBOutlet weak var musicCollectionView: UICollectionView!
    
    private var musicList: [Music] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setMusicList()
        musicCollectionView.delegate = self
        musicCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    private func setMusicList() {
        let music1 = Music(coverName: "album_iu", singer: "아이유", title: "삐삐")
        let music2 = Music(coverName: "album_vibe", singer: "바이브", title: "가을타나봐")
        let music3 = Music(coverName: "album_yangdail", singer: "양다일", title: "고백")
        let music4 = Music(coverName: "album_im", singer: "임창정", title: "하루도 그대를 사랑하지 않은 적이 없었다.")
        let music5 = Music(coverName: "album_smtm7", singer: "루피(Loopy)", title: "Save (Feat. 팔토알토)")
        let music6 = Music(coverName: "album_ziont", singer: "자이언티", title: "멋지게 인사하는 법 (Feat. 슬기")
        let music7 = Music(coverName: "album_bts", singer: "방탄소년단", title: "IDOL")
        let music8 = Music(coverName: "album_loco", singer: "로꼬", title: "시간이 들겠지 (Feat. Colde)")
        let music9 = Music(coverName: "album_paul", singer: "폴킴", title: "모든 날, 모든 순간")
        let music10 = Music(coverName: "album_shaun", singer: "숀(SHAUN)", title: "Way Back Home")
        
        musicList = [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
    }

}

extension CollectionViewSampleViewController: UICollectionViewDataSource {
    // CollectionView의 Section별 Row 개수 지정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
        
    }
    // CollectionView IndexPath 별 Cell 지정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let musicCell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCell.identifier, for: indexPath) as? MusicCell else { return UICollectionViewCell()}
    musicCell.set(musicList[indexPath.row])
        return musicCell }
}

// FlowLayout: Delegate 사이즈 설정
extension CollectionViewSampleViewController: UICollectionViewDelegateFlowLayout {
    //Cell Width, height 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-40) / 2, height: collectionView.frame.height / 4)
}
    //CollectionView Content Inset 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10) }
    
    // CollectionView Cell 위, 아래 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20 }
    
    // CollectionView Cell 좌, 우 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20 }

}

