//
//  YJHomeVC.swift
//  iOS-Design-Project
//
//  Created by 이유진 on 2020/05/27.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit
import FSPagerView

class YJHomeVC: UIViewController,FSPagerViewDataSource,FSPagerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    //****var,let,IBOutlet
    
    //하단 맞춤상품과 로켓프레쉬 상품 CollecionView
    @IBOutlet var collection: UICollectionView! //맞춤상품
    @IBOutlet var collection2: UICollectionView! //로켓프레쉬
    private var products: [ProductInfo] = [] //맞춤상품에 띄울 정보를 담을 배열
    private var products2: [ProductInfo] = [] //로켓프레쉬에 띄울 정보를 담을 배열
    
    let username = "곽민주" //user이름(하단 '~님의 맞춤 상품'에 사용)
    let imageNames = ["ad1","ad1","ad1","ad1","ad1","ad1"] //홍보배너에 들어갈 이미지
    let product = ["고구마","마스크","선풍기","운동화","건조기","고등어","마스크","카메라","면도기","닌텐도"] //인기검색어에 들어갈 정보
    let cateimgs = ["iconFashion","iconBeauty","iconSport","iconCook","iconBook","iconTicket","iconOffice","iconSupply","iconHealth","iconDigital"] //카테고리뷰에 띄울 아이콘 이미지
    var numberOfItems = 6 //배너 수
    var numberOfnumbers = 10 //실시간 검색어 수
    var index = 0 //인기검색어 관련 반복문을 돌릴 때 사용할 인덱스
    
    @IBOutlet var cateUIView: UIView! //카테고리 아이콘을 띄울 UIView
    @IBOutlet var cateView: FSPagerView!{
        //배너처럼 슬라이딩 효과를 위해 외부 라이브러리 FSPagerView 사용
        //(->별로 안좋은 방법같아 차후에 수정 필요..)
        didSet{
            self.cateView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell4")
            //카테고리 뷰에 올라갈 정보의 Identifier = cell4
        }
    }
    @IBOutlet var catePageControl: FSPageControl!{
        //카테고리뷰 밑에 띄울 페이지컨트롤
        didSet {
            self.catePageControl.numberOfPages = 2 //페이지 수
            self.catePageControl.contentHorizontalAlignment = .center //뷰 중앙에 배치
            self.catePageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    @IBOutlet var cate1: [UIButton]! //카테고리뷰 ui버튼들
    @IBOutlet var user: UILabel! //user
    @IBOutlet var HomeSearchBar: UISearchBar! //홈 상단 searchbar
    
    @IBOutlet var pagerView: FSPagerView!{
        //상단 홍보배너
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            //홍보배너 뷰에 올라갈 정보의 Identifier = cell
        }
    }
    @IBOutlet var pageControl: FSPageControl!{
        //홍보배너 밑에 띄울 페이지컨트롤
        didSet {
            self.pageControl.numberOfPages = self.imageNames.count //페이지 수
            self.pageControl.contentHorizontalAlignment = .center //중앙에 배치
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    //인기검색어 또한 자동으로 롤링되는 것을 위해서 외부 라이브러리 FSPagerView 사용
    @IBOutlet var numView: FSPagerView!{
        didSet {
            self.numView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell2")
            //인기검색어 뷰(순위)에 올라갈 정보의 Identifier = cell
        }
    }
    @IBOutlet var productView: FSPagerView!{
        didSet {
            self.productView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell3")
            //인기검색어 뷰(상품이름)에 올라갈 정보의 Identifier = cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.text = username + "님의 추천상품"
        
        //홍보배너 뷰 페이지 아이콘 이미지 설정
        self.pageControl.setImage(UIImage(named: "stateCircle5"), for: .normal)
        self.pageControl.setImage(UIImage(named: "stateCircle6"), for: .selected)
        
        //카테고리 뷰 페이지 아이콘 이미지 설정
        self.catePageControl.setImage(UIImage(named: "secondstateCircle"), for: .normal)
        self.catePageControl.setImage(UIImage(named: "secondstateBar"), for: .selected)
        
        //데이터와 네비게이션 페이지컨트롤 설정
        setNavi()
        setPager()
        setSearchbar()
        setproductinfo()
        
        // Do any additional setup after loading the view.
    }
    
    //홈 배너의 페이지 뷰 설정
    private func setPager(){
        //페이지 무한대로 넘어감 (마지막 페이지 -> 첫번째 페이지)
        self.pagerView.isInfinite = true

        self.numView.isInfinite = true
        self.numView.scrollDirection = .vertical
        self.numView.automaticSlidingInterval = 3.0
        
        self.productView.isInfinite = true
        self.productView.scrollDirection = .vertical
        self.productView.automaticSlidingInterval = 3.0
        
    }
    
    //navigation bar 설정
    private func setNavi(){
        //navigation bar title에 logo 이미지 넣기
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 109, height: 28))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        navigationItem.titleView = imageView
        
        //navigation bar backgroun색 지정과 선 없애기
        self.navigationController?.navigationBar.backgroundColor = UIColor.init(displayP3Red: 244, green: 245, blue: 246, alpha: 1)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    //searchbar 설정
    private func setSearchbar(){
        //SearchBar textfield 뒷배경 이미지
        self.HomeSearchBar.setSearchFieldBackgroundImage(UIImage(named: "search"), for: UIControl.State.normal)
           
        // SearchBar 텍스트 크기 지정
        let textFieldInsideUISearchBar = HomeSearchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.font = textFieldInsideUISearchBar?.font?.withSize(12)

        // SearchBar placeholder 텍스트 색 지정
        let labelInsideUISearchBar = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
        labelInsideUISearchBar?.textColor = UIColor.init(displayP3Red: 112, green: 112, blue: 112, alpha: 1)
           
        //SearchBar icon 설정
        HomeSearchBar.setImage(UIImage(named: "iconTopSearch"), for: .search, state: .normal)

    }

    
    //FSPagerView 개수
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        if pagerView == self.pagerView{ //홍보배너
            return numberOfItems
        }
        else if pagerView == self.cateView{ //카테고리
            return 2
       }
        else{
            return numberOfnumbers //인기검색어
        }
    }
    
    //FSPagerView 뷰
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        if pagerView == self.pagerView{ //홍보배너
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
            cell.imageView?.image = UIImage(named: self.imageNames[index])
            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.clipsToBounds = true
            return cell
        }
        else if pagerView == self.numView{ //인기검색어(순위)
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell2", at: index)
            cell.textLabel?.superview?.backgroundColor = .white
            cell.textLabel?.text = String(index+1)
            cell.textLabel?.backgroundColor = .white
            if index < 3{ //3위까진 파란색과 볼드체
                cell.textLabel?.textColor = UIColor.mainblue
                cell.textLabel?.font = UIFont.init(name: "AppleSDGothicNeo-bold", size: 13)
            }
            else{ //그 외에는 기본
                cell.textLabel?.textColor = UIColor.darkGray
                cell.textLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 13)
            }
            return cell
        }
        else if pagerView == self.cateView{ //카테고리
             let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell4", at: index)
            self.index = 0
            for img in cateimgs {
                cate1[self.index].setImage(UIImage(named: img), for: .normal
                )
                cate1[self.index].tintColor = UIColor.darkGray
                self.index += 1
            }
            cell.addSubview(cateUIView)
            return cell
        }
        else{ //인기검색어(상품이름)
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell3", at: index)
            cell.textLabel?.superview?.backgroundColor = .white
            cell.textLabel?.text = self.product[index]
            cell.textLabel?.backgroundColor = .white
            cell.textLabel?.textColor = UIColor.darkGray
            cell.textLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 13)
            return cell
        }
        
    }
    
    //FSPagerView
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
       
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        if pagerView == self.pagerView{
            self.pageControl.currentPage = targetIndex
        }
        else if pagerView == self.cateView{
            self.catePageControl.currentPage = targetIndex
        }
    }
       
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        if pagerView == self.pagerView{
            self.pageControl.currentPage = pagerView.currentIndex
        }
        else if pagerView == self.cateView{
            self.catePageControl.currentPage = cateView.currentIndex
        }
    }
    
    //하단 collectionview에 띄울 상품 세팅
    private func setproductinfo(){
        let product1 = ProductInfo(mainimg: "img1", name: "[보랄] 더셰프 인덕션", price: "51,900원", subinfo: [true,true,true])
        let product2 = ProductInfo(mainimg: "img2", name: "고구마는 원래 노랗다", price: "21,900원", subinfo: [false,true,true])
        let product3 = ProductInfo(mainimg: "img3", name: "[해찬들] 국산 고추장", price: "31,900원", subinfo: [true,false,true])
        let product4 = ProductInfo(mainimg: "img4", name: "면도기", price: "71,900원", subinfo: [true,false,false])
        
        let product5 = ProductInfo(mainimg: "img9", name: "[보랄] 더셰프 인덕션", price: "51,900원", subinfo: [true,true,false])
        let product6 = ProductInfo(mainimg: "img6", name: "고구마는 원래 노랗다", price: "21,900원", subinfo: [true,false,true])
        let product7 = ProductInfo(mainimg: "img7", name: "[해찬들] 국산 고추장", price: "31,900원", subinfo: [true,true,true])
        let product8 = ProductInfo(mainimg: "img8", name: "면도기", price: "71,900원", subinfo: [false,true,false])
        
        products = [product1,product2,product3,product4] //맞춤상품에 띄울
        products2 = [product5,product6,product7,product8] //로켓프레쉬에 띄울
    }
    
    //collection뷰 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collection{
            return products.count
        }
        else{
            return products2.count
        }
    }
    
    //collectionView 셀 내용
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collection { //맞춤상품
            let productcell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell1", for: indexPath) as? ProductCollectionViewCell1
            productcell?.setProductInformation(Button_img: products[indexPath.row].mainimg, name: products[indexPath.row].name, price: products[indexPath.row].price, subinfo: products[indexPath.row].getImageName())
            
            return productcell!
            
        }
        else{ //로켓프레쉬
            let productcell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell2", for: indexPath) as? ProductCollectionViewCell2
            
            productcell?.setProductInformation(Button_img: products2[indexPath.row].mainimg, name: products2[indexPath.row].name, price: products2[indexPath.row].price, subinfo: products2[indexPath.row].getImageName())
            
            return productcell!
        }
        
    }
    
}


