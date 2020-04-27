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

