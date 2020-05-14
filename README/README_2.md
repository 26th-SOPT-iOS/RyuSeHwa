## Week 2 (4/25)

### Seminar: AutoLayout, StackView, ScrollView

- Tabbar Controller

<img width="300" alt="Screen Shot 2020-05-10 at 9 56 25 PM" src="https://user-images.githubusercontent.com/46921003/81499816-2603e680-9309-11ea-9b29-a4ff3cb0df8c.png">

- 오토레이아웃: View의 위치와 크기를 자동으로 결정하는 Layout System (매우 중요함)

<img width="251" alt="2nd_AutoLayout" src="https://user-images.githubusercontent.com/46921003/80296448-52bae880-87b6-11ea-84b9-33b53700c2fc.png"><img width="246" alt="2nd_AutoLayout_2" src="https://user-images.githubusercontent.com/46921003/80296595-93673180-87b7-11ea-91ab-4291c46fa7d5.png">

▶️ 오토레이아웃 설정 순서 *(사람마다 다른 방법을 따르지만 혼자만의 규칙을 정해놓는게 나중에 헷갈리지 않는다고 한다!)*:

1. 각 View의 위, 아래, 양옆 Constraint 걸어주기
2. 3개 이상의 View를 설정할 때에는 한개의 뷰를 기점으로 Equal Height/Width, Horizontal/Vertical Spacing 설정 해주기
3. Size Inspector에서 Constraint 확인해주고 Proportion 체크해주기
4. 알맞게 Constraint가 설정되었을때는 위의 사진처럼 파랗게 뜬다!



### 과제 1: 계산기 만들기

<img width="250" alt="2nd_Calculator" src="https://user-images.githubusercontent.com/46921003/81264240-0310d280-907c-11ea-8fd9-d9be08217703.png">

1. Vertical Stack 생성 후 오토레이아웃 설정
2. Fill Equally 선택 후 Horizontal Stack 네개 배치
3. Horizontal Stack 안에 버튼 네개 배치

- 계산기 버튼 둥글게 만들기

```swift
@IBOutlet var digitButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    
    func setLayout(){
        digitButton.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.height  * 0.5
        })
    }
```



### 과제 2: 제플린 참고 SOPT 로그인 화면 + ScrollView

<img width="230" alt="SOPT_1" src="https://user-images.githubusercontent.com/46921003/81264040-baf1b000-907b-11ea-86c5-883363dbe034.png"><img width="230" alt="SOPT_2" src="https://user-images.githubusercontent.com/46921003/81264121-d9f04200-907b-11ea-9788-686c52c98619.png"><img width="230" alt="SOPT_3" src="https://user-images.githubusercontent.com/46921003/81263842-62221780-907b-11ea-8ee3-1a9e3cffefda.png">

<u>▶️ ScrollView 만들기</u>

1. 전체 화면에 Scroll View 배치하기

2. ScrollView 오토레이아웃 설정하기 (위, 옆, *<u>**아래** (중요!!)</u>*)

3. Vertical Stack 안에 Horizontal View 중첩하기

4. Horizontal View 내에서 각 View들 equally 배치하기

5. 이미지 위에 뷰 만들고 오토레이아웃 설정

6. 뷰 위에 레이블 배치하고 뷰에 대한 레이블 오토레이아웃 설정하기

   







