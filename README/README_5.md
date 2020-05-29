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

우리 조 개발자 분들과 이야기를 나눠본 결과, 홈 화면 구현은 다음과 같은 순서를 따른다.

1. 메인 Tabbar 생성 후 각 bar 별로 VC, View 생성
2. 메인 Tabbar의 홈 아이콘에 홈 View 연결
3. ScrollView 구현
4. CollectionView 3개 구현
   - 검색창 밑의 광고 슬러이더
   - 광고 슬라이더 밑의 카테고리 슬라이더
   - 추천상품 목록



*개발자 분들과의 협업은 처음이라 헷갈리는 부분이 많았지만 우리 팀 OB 주혁오빠가 매우 친절하게 github을 사용한 협업에 관해 손수 [readme까지](https://github.com/SOPT26-iOS-X-Design/iOS-Design-Project) 만들어 설명해주셨다!!*



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



> 두개의 행으로 이루어져있는 CollectionView 만들기

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



▶️ TableView로 Expandable Cell 만들기 (클릭 후 확장되는 기능)

<img width="300" alt="Screen Shot 2020-05-25 at 7 28 31 PM" src="https://user-images.githubusercontent.com/46921003/82804833-f1be2780-9ebd-11ea-8b58-4a7b7e5c9108.png">



1. 검색어 셀, 그리고 펼쳤을 때의 셀 각각 Prototype Cell을 두개를 만들어준 후 identifier를 지정해준다.
2. didSelectRowAt으로 Row 0를 선택할 때 나타나는 효과들을 지정해준다.
   - '고구마'를 삭제해준다
   - '10분전 업데이트' 텍스트를 추가해준다
   - 밑으로 내리는 버튼을 위로 올리는 버튼 이미지로 바꿔준다
   - TableView 전체 height를 늘려준다

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

완성!!!

![Design_실검](https://user-images.githubusercontent.com/46921003/83236241-2851b600-a1ce-11ea-9688-bfb90aad9f82.gif)





