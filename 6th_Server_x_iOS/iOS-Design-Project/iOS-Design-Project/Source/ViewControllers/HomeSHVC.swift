//
//  HomeSHVC.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 24/05/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class HomeSHVC: UIViewController {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var iconAlarm: UIButton!
    @IBOutlet weak var searchField: UITextField!
    
    @IBOutlet weak var AdCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var rocketDelivery: UIButton!
    @IBOutlet weak var rocketOverseas: UIButton!
    @IBOutlet weak var rocketFresh: UIButton!
    @IBOutlet weak var CatCollectionView: UICollectionView!
    @IBOutlet weak var RecCollectionView: UICollectionView!
    @IBOutlet weak var RocketCollectionView: UICollectionView!
    @IBOutlet weak var TodayCollectionView: UICollectionView!
    @IBOutlet weak var popularTableView: UITableView!
    
    private var adImageList : [AdsSH] = []
    private var catImageList: [CatSH] = []
    private var recList: [RecSH] = []
    private var rocketList: [RocketSH] = []
    private var todayList: [TodaySH] = []
    private var items: [PopularSH] = []
    
   
    // network
    var ProductInformation:[ImageData] = []
    var urls: [String] = []
    var productNames: [String] = []
    var productPrices: [Int] = []
    var urlInformation: [AdsSH] = []
    var productURLInformation: [RecSH] = []
    
    // 인기 검색어
    var rankingName:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 검색창 설정
        setSearchIcon()
        
        // AdCollectionView
        //setAdsList()
        setAdsView()
        AdCollectionView.delegate = self
        AdCollectionView.dataSource = self
        AdCollectionView.isPagingEnabled = true
        AdCollectionView.showsHorizontalScrollIndicator = false
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .mainblue
        
        // CatCollectionView
        setCatList()
        setCatsView()
        CatCollectionView.delegate = self
        CatCollectionView.dataSource = self
        CatCollectionView.isPagingEnabled = true
        CatCollectionView.showsHorizontalScrollIndicator = false

        // RecCollectionView
        //setRecList()
        setRecView()
        RecCollectionView.delegate = self
        RecCollectionView.dataSource = self
        RecCollectionView.isPagingEnabled = true
        RecCollectionView.showsHorizontalScrollIndicator = false
        
        // RocketCollectionView
        setRocketList()
        setRocketView()
        RocketCollectionView.delegate = self
        RocketCollectionView.dataSource = self
        RocketCollectionView.isPagingEnabled = true
        RecCollectionView.showsHorizontalScrollIndicator = false
        
        // TodayCollectionView
        setTodayList()
        setTodayView()
        TodayCollectionView.delegate = self
        TodayCollectionView.dataSource = self
        TodayCollectionView.isPagingEnabled = true
        TodayCollectionView.showsHorizontalScrollIndicator = false
        
        // 인기검색어
        setPopList()
        popularTableView.delegate = self
        popularTableView.dataSource = self
        
        // 광고 배너
        getURLBanner()
        DispatchQueue.main.async {
            self.AdCollectionView.reloadData()
        }
        getURLProduct()
        DispatchQueue.main.async {
            self.RecCollectionView.reloadData()
        }

    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 배너 이미지 통신
    func getURLBanner(){
        var bannerImage : [AdsSH] = []
        IDServiceSH.idService.getImage() { networkResult in
            switch networkResult {
            case .success(let resultData):
                
                guard let data=resultData as? [ImageData] else {
                    return }
                for index in 0..<data.count {
                    //self.urls.append(data[index].bannerimg)
                    let item = AdsSH(imageName: data[index].bannerimg)
                    bannerImage.append(item)
                }
                self.urlInformation = bannerImage
                print("Success")
                print(self.urlInformation[0])
                self.ProductInformation = data
            case .pathErr : print("Patherr")
            case .serverErr : print("ServerErr")
            case .requestErr(let message) : print(message)
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    
    // 상품 이미지 통신
    func getURLProduct(){
        IDServiceSH.idService.getImage() { networkResult in
            var productImage : [RecSH] = []
            //var productName : [RecSH] = []
            var recommend:[RecSH] = []
            var rocketFresh:[RecSH] = []
            var todayPrice:[RecSH] = []
            switch networkResult {
            case .success(let resultData):

                guard let data = resultData as? [ImageData] else {
                    return}
                for index in 0..<data.count {
                    let item = RecSH(imagename: data[index].img, name: data[index].name, price: data[index].price, rocket: data[index].wow, fresh: data[index].fresh, delivery: data[index].delivery)
                    productImage.append(item)
                    recommend.append(item)
                    rocketFresh.append(item)
                    todayPrice.append(item)
                }
                self.productURLInformation = productImage
                print("Success2")
                print(self.productURLInformation[0])
                //self.ProductInformation = data

            case .pathErr : print("Patherr")
            case .serverErr : print("ServerErr")
            case .requestErr(let message) : print(message)
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    
    // 검색창 설정하기
    private func setSearchIcon() {
        // 검색창 border color, shape 바꾸기
         searchField.layer.cornerRadius = 18.0
         searchField.layer.borderWidth = 1.0
         searchField.layer.borderColor = UIColor.mainblue.cgColor
         searchField.backgroundColor = UIColor.white
         searchField.addLeftPadding()
        
         // 검색창에 검색 아이콘 추가하기
         let imageView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 15, height: 15))
         let image = UIImage(named: "iconTopSearch")
         imageView.image = image
         imageView.contentMode = .scaleAspectFit

         let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
         view.addSubview(imageView)
         searchField.leftViewMode = UITextField.ViewMode.always
         searchField.leftView = view
        
        
    }
    
    // 광고 이미지 불러오기
//    private func setAdsList() {
//        let image1 = AdsSH(imageName: "ad1")
//        let image2 = AdsSH(imageName: "ad2")
//        let image3 = AdsSH(imageName: "ad3")
//        let image4 = AdsSH(imageName: "ad4")
//        let image5 = AdsSH(imageName: "ad5")
//        //let image6 = AdsSH(imageName: "ad6")
//
//        adImageList = [image1, image2, image3, image4, image5]
//    }
    
    // AdCollectionView 설정
    private func setAdsView() {
        // width, height 설정
        let cellWidth = AdCollectionView.frame.width
        let cellHeight = AdCollectionView.frame.height
        
        // 상하 inset value 설정
        let insetY = (AdCollectionView.bounds.height - cellHeight) / 2.0
        let layout = AdCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        AdCollectionView.contentInset = UIEdgeInsets(top: insetY, left: 0, bottom: insetY, right: 0)
        
        // 스크롤 시 빠르게 감속 되도록 설정
        AdCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    
    // 카테고리 이미지 불러오기
    private func setCatList() {
        let image1 = CatSH(imageName: "iconBeauty")
        let image2 = CatSH(imageName: "iconBook")
        let image3 = CatSH(imageName: "iconCook")
        let image4 = CatSH(imageName: "iconDigital")
        let image5 = CatSH(imageName: "iconFashion")
        let image6 = CatSH(imageName: "iconHealth")
        let image7 = CatSH(imageName: "iconOffice")
        let image8 = CatSH(imageName: "iconSport")
        let image9 = CatSH(imageName: "iconSupply")
        let image10 = CatSH(imageName: "iconTicket")
        
        catImageList = [image1, image2, image3, image4, image5, image6, image7, image8, image9, image10, image1, image2, image3, image4, image5, image6, image7, image8, image9, image10]
    }
    
    // CatCollectionView 설정
    private func setCatsView() {
        // width, height 설정
        let cellWidth = CatCollectionView.frame.width/5
        let cellHeight = CatCollectionView.frame.height/3
         
         // 상하 inset value 설정
         //let insetY = (CatCollectionView.bounds.height - cellHeight) / 2.0
         let layout = CatCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
         layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
         layout.minimumLineSpacing = 0
         layout.scrollDirection = .horizontal
        
         CatCollectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
         
         // 스크롤 시 빠르게 감속 되도록 설정
         CatCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
//    private func setRecList() {
//        let image1 = RecSH(imageName: "img1", productName: "[보랄] 더 셰프 인덕션", price: "51,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "badgeRoketdelivery")
//        let image2 = RecSH(imageName: "img2", productName: "고구마는 원래 노랗다", price: "51,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
//        let image3 = RecSH(imageName: "img3", productName: "[해찬들] 국산 고추장", price: "31,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
//        let image4 = RecSH(imageName: "img4", productName: "면도기", price: "71,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
//        let image5 = RecSH(imageName: "img5", productName: "[보랄] 더 셰프 인덕션", price: "51,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
//        let image6 = RecSH(imageName: "img6", productName: "건강 샐러드", price: "8,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
//        let image7 = RecSH(imageName: "img7", productName: "고구마는 원래 노랗다", price: "51,900원", rWow: "badgeRoketwow", rFresh: "", rDeliver: "")
//        let image8 = RecSH(imageName: "img8", productName: "[보랄] 더 셰프 인덕션", price: "11,900원", rWow: "", rFresh: "badgeRoketfresh", rDeliver: "")
//
//        recList = [image1, image2, image3, image4, image5, image6, image7, image8]
//    }
    
    // RecCollectionView 설정
    private func setRecView() {
        // width, height 설정
         let cellWidth = RecCollectionView.frame.width
         let cellHeight = RecCollectionView.frame.height
         
         // 상하 inset value 설정
         //let insetY = (RecCollectionView.bounds.height - cellHeight) / 2.0
         let layout = RecCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
         layout.itemSize = CGSize(width: cellWidth/4, height: cellHeight)
         layout.minimumLineSpacing = 10
         layout.scrollDirection = .horizontal
        
         RecCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    // Rocket Collection List
    private func setRocketList() {
        let image1 = RocketSH(imageName: "img1", productName: "[보랄] 더 셰프 인덕션", price: "51,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "badgeRoketdelivery")
        let image2 = RocketSH(imageName: "img2", productName: "고구마는 원래 노랗다", price: "51,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
        let image3 = RocketSH(imageName: "img3", productName: "[해찬들] 국산 고추장", price: "31,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
        let image4 = RocketSH(imageName: "img4", productName: "면도기", price: "71,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
        let image5 = RocketSH(imageName: "img5", productName: "[보랄] 더 셰프 인덕션", price: "51,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
        let image6 = RocketSH(imageName: "img6", productName: "건강 샐러드", price: "8,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
        let image7 = RocketSH(imageName: "img7", productName: "고구마는 원래 노랗다", price: "51,900원", rWow: "badgeRoketwow", rFresh: "", rDeliver: "")
        let image8 = RocketSH(imageName: "img8", productName: "[보랄] 더 셰프 인덕션", price: "11,900원", rWow: "", rFresh: "badgeRoketfresh", rDeliver: "")
        
        rocketList = [image1, image2, image3, image4, image5, image6, image7, image8]
    }
    
    private func setRocketView() {
        // width, height 설정
         let cellWidth = RocketCollectionView.frame.width
         let cellHeight = RocketCollectionView.frame.height
        
        print(cellWidth)
         
         // 상하 inset value 설정
         //let insetY = (TodayCollectionView.bounds.height - cellHeight) / 2.0
         let layout = RocketCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
         layout.itemSize = CGSize(width: cellWidth / 4, height: cellHeight)
         layout.minimumLineSpacing = 10
         layout.scrollDirection = .horizontal
        
         RocketCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    // Today Collection List
    private func setTodayList() {
        let image1 = TodaySH(imageName: "img1", productName: "[보랄] 더 셰프 인덕션", price: "51,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "badgeRoketdelivery")
        let image2 = TodaySH(imageName: "img2", productName: "고구마는 원래 노랗다", price: "51,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
        let image3 = TodaySH(imageName: "img3", productName: "[해찬들] 국산 고추장", price: "31,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
        let image4 = TodaySH(imageName: "img4", productName: "면도기", price: "71,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
        let image5 = TodaySH(imageName: "img5", productName: "[보랄] 더 셰프 인덕션", price: "51,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
        let image6 = TodaySH(imageName: "img6", productName: "건강 샐러드", price: "8,900원", rWow: "badgeRoketwow", rFresh: "badgeRoketfresh", rDeliver: "")
        let image7 = TodaySH(imageName: "img7", productName: "고구마는 원래 노랗다", price: "51,900원", rWow: "badgeRoketwow", rFresh: "", rDeliver: "")
        let image8 = TodaySH(imageName: "img8", productName: "[보랄] 더 셰프 인덕션", price: "11,900원", rWow: "", rFresh: "badgeRoketfresh", rDeliver: "")
        
        todayList = [image1, image2, image3, image4, image5, image6, image7, image8]
    }
    
    // TodayCollectionView 설정
    private func setTodayView() {
        // width, height 설정
         let cellWidth = TodayCollectionView.frame.width
         let cellHeight = TodayCollectionView.frame.height
         
         // 상하 inset value 설정
         //let insetY = (TodayCollectionView.bounds.height - cellHeight) / 2.0
         let layout = TodayCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
         layout.itemSize = CGSize(width: cellWidth/4, height: cellHeight)
         layout.minimumLineSpacing = 10
         layout.scrollDirection = .horizontal
        
         TodayCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    // 인기검색어 이미지 불러오기
    private func setPopList() {
        let image1 = PopularSH(Product: "고구마1", arrowImg: "", titleProduct: "", rankNumber: "", update: "", realTime: "")
        let image2 = PopularSH(Product: "고구마1", arrowImg: "", titleProduct: "", rankNumber: "", update: "", realTime: "")
        let image3 = PopularSH(Product: "해산물", arrowImg: "", titleProduct: "", rankNumber: "", update: "", realTime: "")
        let image4 = PopularSH(Product: "고구마1", arrowImg: "", titleProduct: "", rankNumber: "", update: "", realTime: "")
        let image5 = PopularSH(Product: "고구마1", arrowImg: "",titleProduct: "", rankNumber: "", update: "", realTime: "")
        let image6 = PopularSH(Product: "고구마1", arrowImg: "",titleProduct: "", rankNumber: "", update: "", realTime: "")
        
        items = [image1, image2, image3, image4, image5, image6]
    }
    
}



extension HomeSHVC: UICollectionViewDataSource, UICollectionViewDelegate {
    // CollectionView의 Section별 Row 개수 지정
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.CatCollectionView {
            return 2
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.AdCollectionView) {
            pageControl.numberOfPages = urlInformation.count
            return urlInformation.count
        } else if collectionView == self.CatCollectionView {
            return catImageList.count/2
        } else if collectionView == self.RecCollectionView {
            return productURLInformation.count
        } else if collectionView == self.RocketCollectionView {
            return rocketList.count
        } else {
            return todayList.count
        }
    }
    
    
    // CollectionView IndexPath 별 Cell 지정
    // 서버 통신 Cell 연결
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.AdCollectionView {
            guard let adCell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCellSH.identifier, for: indexPath) as? AdCellSH else { return UICollectionViewCell()}
            adCell.adImageView.setImage(path: urlInformation[indexPath.row].imageName)
            adCell.adImageView.contentMode = UIView.ContentMode.scaleAspectFill
            return adCell
        } else if collectionView == self.CatCollectionView {
            guard let catCell = collectionView.dequeueReusableCell(withReuseIdentifier: CatCellSH.identifier, for: indexPath) as? CatCellSH else { return UICollectionViewCell()}
            catCell.set(catImageList[indexPath.row])
            return catCell
        } else if collectionView == self.RecCollectionView {
            guard let recCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecCellSH.identifier, for: indexPath) as? RecCellSH else { return UICollectionViewCell()}
            recCell.productImage.setImage(path: productURLInformation[indexPath.row].productImageName)
            recCell.productName.text = productURLInformation[indexPath.row].ProductName
            recCell.productPrice.text = productURLInformation[indexPath.row].ProductPrice + " 원"
            if productURLInformation[indexPath.row].rocket == true {
                recCell.rocketWow.image = UIImage(named: "badgeRoketdelivery")
            }
            if productURLInformation[indexPath.row].fresh == true {
                recCell.rocketFresh.image = UIImage(named: "badgeRoketfresh")
            }
            if productURLInformation[indexPath.row].delivery == true {
                recCell.rocketDelivery.image = UIImage(named: "badgeRoketwow")
            }
            
            
            return recCell
        } else if collectionView == self.RocketCollectionView{
            guard let rocketCell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketCellSH.identifier, for: indexPath) as? RocketCellSH else { return UICollectionViewCell()}
            rocketCell.set(rocketList[indexPath.row])
            return rocketCell
        }
            else {
            guard let todayCell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCellSH.identifier, for: indexPath) as? TodayCellSH else { return UICollectionViewCell()}
            todayCell.set(todayList[indexPath.row])
            return todayCell
        }
    }
    
    // Cell Width, height 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.CatCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 2)
        } else {
            return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.RecCollectionView {
            return 20
        } else {
            return 0
        }

}
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.AdCollectionView {
           pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }

    }


    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    

            
}
        


extension HomeSHVC: UITableViewDelegate, UITableViewDataSource {
    //section 수
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
    //cell 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items[section].open == true {
            return 1 + 1
        }else{
            return 1
        }
    }

    //cell 크기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 40
        } else {
            return 200
        }
    }
    
    //cell구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell: PopularTitleCellSH = tableView.dequeueReusableCell(withIdentifier: "Section0", for: indexPath) as! PopularTitleCellSH
            return cell
        } else {
            //클릭시 펼쳐질 셀
            let cell: PopularCellSH = tableView.dequeueReusableCell(withIdentifier: "Section1", for: indexPath) as! PopularCellSH
            IDServiceSH.idService.getTrending(){ networkResult in
                switch networkResult {
                case .success(let rank):
                    guard let data=rank as? [trendingData] else {
                        return}
                    for index in 0..<data.count {
                        self.rankingName.append(data[index].name)
                    }
                    cell.p1.text = self.rankingName[0]
                    cell.p2.text = self.rankingName[1]
                    cell.p3.text = self.rankingName[2]
                    cell.p4.text = self.rankingName[3]
                    cell.p5.text = self.rankingName[4]
                    cell.p6.text = self.rankingName[5]
                    cell.p7.text = self.rankingName[6]
                    cell.p8.text = self.rankingName[7]
                    cell.p9.text = self.rankingName[8]
                    cell.p10.text = self.rankingName[9]
                case .pathErr : print("Patherr")
                case .serverErr : print("ServerErr")
                case .requestErr(let message) : print(message)
                case .networkFail:
                    print("networkFail")
                }
            }
            return cell
        }
    }
    
    //cell 확장효과
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? PopularTitleCellSH else {return}
        guard let index = tableView.indexPath(for: cell) else { return }
        
        heightConstraint.constant = 170
        if index.row == indexPath.row {
            if index.row == 0 {
                if items[indexPath.section].open == true {
                    items[indexPath.section].open = false
                    cell.arrowImg.image = UIImage(named: "iconRealtimeDown")
                    cell.productLabel.text = ""
                    cell.rankNumber.text = ""
                    cell.update.text = "10분전 업데이트"
                    cell.realTime.image = UIImage(named: "")
                    let section = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(section, with: .fade)
                    heightConstraint.constant = 38
                    UIView.animate(withDuration: 0.5) {
                        self.view.layoutIfNeeded()
                    }
                } else {
                    items[indexPath.section].open = true
                    IDServiceSH.idService.getTrending() { networkResult in
                        switch networkResult{
                        case .success(let rank):
                            guard let data=rank as? [trendingData] else {
                                return}
                            for index in 0..<data.count {
                                self.rankingName.append(data[index].name)
                            }
                            cell.productLabel.text = self.rankingName[0]
                        case .pathErr : print("Patherr")
                        case .serverErr : print("ServerErr")
                        case .requestErr(let message) : print(message)
                        case .networkFail:
                            print("networkFail")
                        }
                    }
                    cell.arrowImg.image = UIImage(named: "iconRealtimeMore2")
                    //cell.productLabel.text = "고구마"
                    cell.rankNumber.text = "1"
                    cell.update.text = ""
                    cell.realTime.image = UIImage(named: "realtimestate")
                    let section = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(section, with: .fade)
                    UIView.animate(withDuration: 0.5) {
                        self.view.layoutIfNeeded()
                    }
                }
            }
        }
    
    
    }
    
}

extension UIImageView {
    func setImage(path:URL) {
       let url = path
        DispatchQueue.global(qos: .background).async {
            guard let data:Data = try? Data(contentsOf: url), let image:UIImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}






