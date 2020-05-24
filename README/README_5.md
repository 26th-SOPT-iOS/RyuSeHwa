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

1. **로켓프레쉬, 로켓 배송 별로 무슨 상품**을 담았는지 쉽게 확인할 수 있으며
2. 각 섹션 별 **게이지바**를 통해 추가해야하는 액수를 직관적으로 확인할 수 있다. 

<img width="400" alt="Screen Shot 2020-05-24 at 8 34 11 PM" src="https://user-images.githubusercontent.com/46921003/82753090-f8856580-9dfd-11ea-80eb-95a9c004348d.png">



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



▶️ CollectionView를 사용해 이미지 슬라이더 만들기

해당 사이트를 참고했다 : https://medium.com/@_josetony/page-slider-with-uicollectionview-in-swift-4-172c948128bd

