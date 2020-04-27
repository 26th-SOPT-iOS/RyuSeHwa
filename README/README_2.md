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

