## Week 2 (4/25)

### Seminar: AutoLayout, StackView, ScrollView

- Tabbar Controller

- 오토레이아웃: View의 위치와 크기를 자동으로 결정하는 Layout System

<img width="251" alt="2nd_AutoLayout" src="https://user-images.githubusercontent.com/46921003/80296448-52bae880-87b6-11ea-84b9-33b53700c2fc.png"><img width="246" alt="2nd_AutoLayout_2" src="https://user-images.githubusercontent.com/46921003/80296595-93673180-87b7-11ea-91ab-4291c46fa7d5.png">

오토레이아웃 설정 순서 *(사람마다 다른 방법을 따르지만 혼자만의 규칙을 정해놓는게 나중에 헷갈리지 않는다고 한다!)*:

1. 각 View의 위, 아래, 양옆 Contraint 걸어주기
2. 3개 이상의 View를 설정할 때에는 한개의 뷰를 기점으로 Equal Height/Width, Horizontal/Vertical Spacing 설정 해주기
3. Size Inspector에서 Constraint 확인해주고 Proportion 체크해주기
4. 알맞게 Contraint가 설정되었을때는 위의 사진처럼 파랗게 뜬다!



### 과제 1: 계산기 만들기

<img src="https://user-images.githubusercontent.com/46921003/80783469-e294d400-8bb4-11ea-842a-0af2351a07d8.png" alt="Simulator Screen Shot - iPhone 11 Pro Max - 2020-05-01 at 11 27 33" style="zoom:20%;" />

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



### 과제 2: SOPT 로그인 화면 + ScrollView

