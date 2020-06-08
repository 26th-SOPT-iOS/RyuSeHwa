//
//  HomeExVC.swift
//  iOS-Design-Project
//
//  Created by 이주혁 on 2020/05/24.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class HomeExVC: UIViewController {
    /// 상단 Banner
    @IBOutlet weak var Banner: UIView!
    private var bannerView:BannerView!
    private func setUpUI() {
        bannerView = BannerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width*(197.0/375.0)))
        self.Banner.addSubview(bannerView)
        print(bannerView.frame)
        bannerView.backgroundColor = UIColor.green
        Banner.frame = bannerView.frame
    }
    private func setUpBannerView(item:Int) {
      
        bannerView.reloadData(configuration: nil, numberOfItems: item) { (bannerView, index) -> (UIView) in
           
           return self.itemView(at: index)
        }
    }
        private func itemView(at index:Int)->UIImageView {
            let urls:[String] = ["ad1","ad2","ad3","ad4","ad5","ad6"]
            let itemImageView:UIImageView = UIImageView(frame: .zero)
            itemImageView.translatesAutoresizingMaskIntoConstraints = false
            itemImageView.image = UIImage(named: urls[index])
            itemImageView.clipsToBounds = true
            itemImageView.contentMode = UIView.ContentMode.scaleToFill
            itemImageView.isUserInteractionEnabled=true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(tapGestureRecognizer:)))
            itemImageView.addGestureRecognizer(tapGestureRecognizer)
            return itemImageView
        }
    @objc func buttonTapped(tapGestureRecognizer : UITapGestureRecognizer ){
        if(tapGestureRecognizer.state == .ended){
            print("터치")
        }
    }
    ///로켓시리즈
    @IBAction func roketDiliveryButton(_ sender: Any) {
        print("로켓배송 클릭")
    }
    @IBAction func roketFreshButton(_ sender: Any) {
        print("로켓프레쉬 클릭")
    }
    @IBAction func roketOverseaButton(_ sender: Any) {
        print("로켓직구 클릭")
    }
    
    
    ///카테고리 베너
    
    @IBOutlet weak var Category: UIView!
    @IBOutlet weak var CategoryCollectionView: UICollectionView!
    //@IBOutlet weak var CategoryScroll: UIScrollView!
    @IBOutlet weak var CategoryPageControl: UIPageControl!
    
    private var first_page_categoryImageInformation:[String]=[]

    
    private func setCategoryInformation(){
        first_page_categoryImageInformation=["iconBeauty","iconBook","iconCook","iconDigital","iconFashion","iconHealth","iconOffice","iconSport","iconSupply","iconTicket","iconBook","","iconCook","","iconDigital","","iconFashion","","iconBeauty",""]
        self.CategoryCollectionView.delegate = self
        self.CategoryCollectionView.dataSource = self
        self.CategoryCollectionView.showsHorizontalScrollIndicator = false
        self.Category.layer.shadowColor = UIColor.black.cgColor
        self.CategoryCollectionView.tag = 1
        let layout = self.CategoryCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = floor(self.view.frame.width / 5)-10
        let height = width
        layout.itemSize = CGSize(width: width, height:height)
        
    }
/// 인기검색어
    
    @IBOutlet weak var RankingViewHeight: NSLayoutConstraint!
    @IBOutlet weak var RankLabel: UILabel!
    @IBOutlet weak var RankItemLabel: UILabel!
    var toggle:Bool = true
    @IBOutlet weak var buttonImg: UIButton!
    @IBAction func RankButton(_ sender: Any) {
        if toggle {
            UIView.animate(withDuration: 0.5, animations: {
                self.RankingViewHeight.constant = 160
            })
            buttonImg.setImage(UIImage(named: "iconRealtimeMore"), for: .normal)
            RankLabel.alpha = 0
            RankItemLabel.alpha = 0
        }
        else {
            buttonImg.setImage(UIImage(named: "iconRealtimeMore2"), for: .normal)

            UIView.animate(withDuration: 0.5, animations: {
                self.RankingViewHeight.constant = 0
            })
            RankLabel.alpha = 1
            RankItemLabel.alpha = 1
            
        }
        toggle = !toggle
    }
    
    
    @IBOutlet weak var RankingCollectionView: UICollectionView!
    
    private func setRankInfo(){
        RankingCollectionView.delegate = self
        RankingCollectionView.dataSource = self
        RankingCollectionView.tag = 3
        let layout = RankingCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = floor(self.RankingCollectionView.frame.width / 2)
        //layout.itemSize = CGSize(width: width, height: 16)
    }
    
    
    
    
    
    
    
///아래 콜렉션뷰
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var ProductCollectionView: UICollectionView!
    
    private func setProductInformation(){
        ProductCollectionView.delegate = self
        ProductCollectionView.dataSource = self
        ProductCollectionView.tag = 2
    }
    private var headerLabel:[String] = ["@@@님의 추천상품","로켓프레시","오늘의 특가"]

    
    
    
/// 뷰디드로드
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpBannerView(item: 6)
        setCategoryInformation()
        setProductInformation()
        setRankInfo()
        collectionViewHeight.constant = ProductCollectionView.frame.height * 3
        // Do any additional setup after loading the view.

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
extension HomeExVC:UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 2{

            return 3
        }
        else {return 1}
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{return first_page_categoryImageInformation.count}
        else if collectionView.tag == 3 {
            return 10
        }
        else { return 1}
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / 300)
        self.CategoryPageControl.currentPage = page
    }
}

extension HomeExVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView.tag == 1 {
        let cell:CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.categoryImageView.image = UIImage(named: first_page_categoryImageInformation[indexPath.row * (indexPath.section+1)])

        return cell
        }
        else if collectionView.tag == 2{
            switch indexPath.section {
            default:
                let productCell : ProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
                productCell.sectionNumber = indexPath.section
                return productCell
            }
        }
        else {
            let cell:RankingCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCollectionViewCell.identifier, for: indexPath) as! RankingCollectionViewCell
            cell.RankLabel.text = String(indexPath.row + 1)
            cell.itemLabel.text = String(indexPath.row + 1) + "번째 아이템"
            if indexPath.row > 2{
                cell.RankLabel.textColor = UIColor.black
            }
            else {
                cell.RankLabel.textColor = UIColor(red: 78.0 / 255.0, green: 167.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)

            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexpath:IndexPath) ->UICollectionReusableView{

        var header : ProductCollectionViewHeader!
        if kind == UICollectionView.elementKindSectionHeader
        {
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headercell", for: indexpath) as? ProductCollectionViewHeader
            switch indexpath.section {
            case 0:
                header?.name.text = "@@@님의 추천상품"
                header?.sectionNumber = 0
            case 1:
                header?.name.text = "로켓프레쉬"
                header?.sectionNumber = 1
            case 2:
                header?.name.text = "오늘의 특가"
                header.sectionNumber = 2
            default:
                header?.layer.borderWidth=0.5
            }
        }
        return header!
    }
}
extension HomeExVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1 {
        return 10
        }
        else { return 0 }
    }
}
/*extension HomeExVC:UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage:Int = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        if currentPage == 0 {
            self.CategoryScroll.contentOffset = CGPoint(x: scrollView.frame.size.width * CGFloat(2), y: scrollView.contentOffset.y)
        }
        else if currentPage == 2 {
            self.CategoryScroll.contentOffset = CGPoint(x: 0, y: scrollView.contentOffset.y)
        }
        self.CategoryPageControl.currentPage = currentPage
    }
}
*/
