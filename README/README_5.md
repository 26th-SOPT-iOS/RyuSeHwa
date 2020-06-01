## Week 5 (5/23)

### 세미나: 디자인 & 클라이언트 합동 세미나

*<u>디자이너와의 협업은 어떻게 이루어질까?</u>*

우리 조의 디자이너분들(안다혜, 곽민주님)께서는 쿠팡의 홈 화면과 장바구니 화면을 구현해오셨다. 





▶️ 홈 화면에서는:

1. 쿠팡 홈 화면 기존의 **조잡함을 보완**하고 (로켓배송, 로켓직구, 로켓 프레쉬의 쉬운 구분)

2. 일관적인 사이즈를 따르지 않는 **이미지 사이즈를 규격화** 시켰다.

   **해당 홈 뷰에서 우측 하단의 장바구니 아이콘을 클릭하면 아래의 장바구니 뷰가 열린다.*

<img width="232" alt="Screen Shot 2020-05-24 at 8 33 23 PM" src="https://user-images.githubusercontent.com/46921003/82753078-de4b8780-9dfd-11ea-9e95-7b693e99787d.png">

▶️ 장바구니 화면에서는:

1. **로켓프레쉬, 로켓 배송 별로 무슨 상품**을 담았는지 **필터**를 통해 쉽게 확인할 수 있으며
2. 각 섹션 별 **게이지바**를 통해 추가해야하는 액수를 직관적으로 확인할 수 있다. 

<img width="500" alt="Screen Shot 2020-05-24 at 8 34 11 PM" src="https://user-images.githubusercontent.com/46921003/82753090-f8856580-9dfd-11ea-80eb-95a9c004348d.png">



----



### 세미나 과제: 쿠팡 홈 화면 View 구현해오기

나는 세미나와 과제에서 비교적 접해볼 기회가 없었던 CollectionView를 사용해볼 수 있는 **홈 화면을 구현**해보기로 했다. 



🌟🌟 홈 화면 구현은 다음과 같은 순서를 따른다.

1. 메인 Tabbar 생성 후 각 bar 별로 VC, View 생성
   1. *합칠 때 충돌이 나지 않기 위해 각각 스토리보드 생성*
2. 메인 Tabbar의 홈 아이콘에 홈 View 연결
3. ScrollView 구현
4. CollectionView 3개 구현
   - 검색창 밑의 광고 슬라이더
   - 광고 슬라이더 밑의 카테고리 슬라이더
   - 추천상품 목록
5. TableView 1개 구현
   1. 실시간 검색어 (prototype cell 두개 생성)



*협업은 처음이라 헷갈리는 부분이 많았지만 우리 팀 OB 주혁오빠가 매우 친절하게 github을 사용한 협업에 관해 손수 [readme까지](https://github.com/SOPT26-iOS-X-Design/iOS-Design-Project) 만들어 설명해주셨다!!*





▶️ 내가 작업하고 있는 Storyboard를 메인 스토리보드로 쓰는 방법!

1. 해당 스토리보드 선택 후 Deployment info에서 main interface를 바꿔준다
2. Info.plist 파일에서 Storyboard Name과 Main Storyboard file base name 이름을 바꿔준다.

<img width="450" alt="Screen Shot 2020-05-24 at 7 10 04 PM" src="https://user-images.githubusercontent.com/46921003/82753477-e822ba00-9e00-11ea-898d-0dfdd2938293.png">



▶️ 텍스트 필드 안에 (돋보기) 이미지 추가하기

<img width="330" alt="Screen Shot 2020-05-25 at 7 27 32 PM" src="https://user-images.githubusercontent.com/46921003/82804762-d4895900-9ebd-11ea-8c10-f962d535daca.png">

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        
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
  
  			// View를 만들어 image의 위치 지정해주기
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        view.addSubview(imageView)
        searchField.leftViewMode = UITextField.ViewMode.always
        searchField.leftView = view
    }
```



▶️ CollectionView를 사용해 이미지 슬라이더(pagination) 만들기

> 화면을 꽉 채우는 Carousel 형태의 CollectionView 만들기
>

```swift
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
  			 // 한 섹션에서 다른 섹션으로 넘어가는 것
         AdCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
```



> 두개의 row로 이루어져있는 CollectionView 만들기

```swift
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
      // 한 Section 당 item 개수 지정
        if (collectionView == self.AdCollectionView) {
            return adImageList.count
        } else {
            return catImageList.count/2
        }
    }
```



🔥 **중요**: CollectionView를 사용할 때는 Interface Builder에서 꼭 꼭 **Collection View Cell Size를 custom**으로 설정해준다! Automatic으로 설정이 돼있을 시 xcode에서 임의로 cell size를 지정해주기 때문에 코드로 작업을 할때 어떤 코드는 반영이 되고 어떤 코드는 안된다 ㅠ *~~(이것 때문에 알 수 없는 에러가 생겨서 엄청 오래 고생했었다 ㅠㅠ)~~*



▶️ TableView로 Expandable Cell 만들기 (클릭 후 확장되는 기능)

![Design_실검](https://user-images.githubusercontent.com/46921003/83236241-2851b600-a1ce-11ea-9688-bfb90aad9f82.gif)

1. 검색어 셀, 그리고 펼쳤을 때의 셀 각각 Prototype Cell을 두개를 만들어준 후 identifier를 지정해준다.
2. didSelectRowAt으로 Row 0를 선택할 때 나타나는 해당 효과들을 지정해줘야 한다.
   - '고구마'를 삭제해준다
   - '10분전 업데이트' 텍스트를 추가해준다
   - 밑으로 내리는 버튼을 위로 올리는 버튼 이미지로 바꿔준다
   - TableView 전체 height를 늘려준다



> tableView 구조체에 'open'이라는 변수를 추가해준 후 '닫힘' 상태가 default로 되게 설정했다.

```swift
// Cell 내에서 동적으로 변해야 하는 변수들 선언
struct PopularSH {
    var product: String
    var arrowImg: UIImage?
    var titleProduct: String
    var rankNumber: String
    var update: String
    var realTime: UIImage?
    var open = false


    init(Product: String, arrowImg: String, titleProduct: String, rankNumber: String, update: String, realTime: String) {
        self.product = Product
        self.arrowImg = UIImage(named: arrowImg)
        self.titleProduct = titleProduct
        self.rankNumber = rankNumber
        self.update = update
        self.realTime = UIImage(named: realTime)
}
```



> Cell이 선택(open = true가) 되고 다시 선택(open = false)일 때의 행동 정의

```swift
// cell구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell: PopularTitleCellSH = tableView.dequeueReusableCell(withIdentifier: "Section0", for: indexPath) as! PopularTitleCellSH
            return cell
        }else {
            //클릭시 펼쳐질 셀
            let cell: PopularCellSH = tableView.dequeueReusableCell(withIdentifier: "Section1", for: indexPath) as! PopularCellSH
            return cell
        }
    }

		// cell 확장효과
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
                    heightConstraint.constant = 35
                    UIView.animate(withDuration: 0.5) {
                        self.view.layoutIfNeeded()
                    }

                } else {
                    items[indexPath.section].open = true
                    cell.arrowImg.image = UIImage(named: "iconRealtimeMore")
                    cell.productLabel.text = "고구마"
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
```



> 뷰의 height나 width를 동적으로 바꾸기 위해서는 contraint를 변수로 선언 해준 후 코드에 추가한다!
>
> Animation Duration을 조정해 얼마나 셀이 열리고 닫히는지를 조정할 수 있다.

```swift
@IBOutlet weak var heightConstraint: NSLayoutConstraint!

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  // true(cell이 펼쳐질 때)의 height
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
                  // false (cell이 닫혔을 때)의 height
                    heightConstraint.constant = 35
                    UIView.animate(withDuration: 0.5) {
                        self.view.layoutIfNeeded()
                    }
```



▶️ CollectionView에서 PageControl

> pageControl 선언 후 설정

```swift
override func viewDidLoad() {
        super.viewDidLoad()
  pageControl.pageIndicatorTintColor = .white
  pageControl.currentPageIndicatorTintColor = .mainblue
}

extension HomeSHVC: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.AdCollectionView) {
          // CollectionView 페이지 수만큼 pageControl 추가
            pageControl.numberOfPages = adImageList.count
            return adImageList.count
        } else if collectionView == self.CatCollectionView {
            return catImageList.count/2
        } else if collectionView == self.RecCollectionView {
            return recList.count
        } else if collectionView == self.RocketCollectionView {
            return rocketList.count
        } else {
            return todayList.count
        }
    }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)

    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
        
```



🔥 뷰 안의 컬렉션뷰를 스크롤에 따라 넘길 때 모든 pageControl이 같이 넘어가는 오류가 발생했었다!

-> 꼭 각 collectionView를 pageControl에 연결해줘야함!!

```swift
func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
  if scrollView == self.AdCollectionView {
    pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
  } else if scrollView == self.CatCollectionView {
    pageControl2?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
  }
}
```



▶️ 완성!!!

![May-29-2020 21-34-22](https://user-images.githubusercontent.com/46921003/83260142-387c8c00-a1f4-11ea-9941-cf2f5a051880.gif)



