# Ryu Sehwa

🌸SOPT iOS 26th YB🌸

## 목차

| 제목                                                         | 내용                                                        | 기한  |
| ------------------------------------------------------------ | ----------------------------------------------------------- | ----- |
| 1주차 [세미나](https://github.com/26th-SOPT-iOS/RyuSeHwa/tree/master/iOS_FirstWeek_Seminar) | XCode, View 전환 및 데이터 전달                             | -     |
| 1주차 [과제 1](https://github.com/26th-SOPT-iOS/RyuSeHwa/tree/master/iOS_FirstWeek_Assignment_Navigation) | Navigation Controller를 이용하여 화면이동하기               | ~4/24 |
| 1주차 [과제 2](https://github.com/26th-SOPT-iOS/RyuSeHwa/tree/master/iOS_FirstWeek_Assignment_Login) | SOPT 로그인, 회원가입 UI 구현 & 가입자 정보 데이터 트랜스퍼 | ~4/24 |
| 2주차 [세미나](https://github.com/26th-SOPT-iOS/RyuSeHwa/tree/master/iOS_SecondWeek_Seminar) | AutoLayout, StackView, ScrollView                           | -     |
| 2주차 과제 1                                                 | StackView를 활용한 계산기                                   | ~5/1  |
| 2주차 과제 2                                                 | Zeplin 참고 SOPT 로그인 화면 재구성                         | ~5/1  |
| 2주차 도전과제                                               | ScrollView                                                  |       |



## Week 1 (4/18)

### 과제 1

<u>Navigation Controller를 이용하여 화면이동하기</u>

- 코드, 혹은 스토리보드에서 포인터 설정 둘 중 **하나만** 하기
  - Present, Push 둘 다 스토리보드로 설정함

<img width="548" alt="1st_Navigation" src="https://user-images.githubusercontent.com/46921003/80296172-a6780280-87b3-11ea-8e39-fe1bac037e53.png">

### 과제 2

<u>로그인, 회원가입 UI 구현 & 데이터 트랜스퍼</u>



- 회원가입 화면에서 바로 첫번째 화면으로 가기: 'popViewController'

```swift
@IBAction func transferData(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else { return }
        
        receiveViewController.id = enterID.text
        receiveViewController.pw = enterPW.text
        self.present(receiveViewController, animated: true, completion: {if let navController = self.navigationController {
        navController.popViewController(animated: true)
    }}) // completion: return to the main page by 'popViewController'
```



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

