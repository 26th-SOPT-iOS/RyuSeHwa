## Week 3 (5/9)

### 세미나

Delegate Pattern & Protocol

- Delegate Pattern (대리자 위임자): 뷰의 일부 기능을 다른 컨트롤러에 넘기는 것
  - <u>*대신 처리해줄 객체*</u>와 *<u>처리하라고 시키는 객체</u>*를 기억하면 됨
- Extension: 기존 소스 코드에서 접근하지 못하는 타입들을 확장하는 것

```swift
extension ViewController: UIPickerViewDataSource { // 데이터 모델의 집합
}  

extension ViewController: UIPickerViewDelegate {  // 뷰의 기능 위임
}
```

| UIPickerView                                                 | UITableView                                                  | UICollectionView                                             |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img width="170" alt="세미나_1" src="https://user-images.githubusercontent.com/46921003/81468767-8ff29200-921c-11ea-9d0d-9215fc3fad8a.png"> | <img width="170" alt="세미나_2-1" src="https://user-images.githubusercontent.com/46921003/81468781-a862ac80-921c-11ea-8ca9-66cca5984763.png"><img width="170" alt="세미나_2-2" src="https://user-images.githubusercontent.com/46921003/81468793-bd3f4000-921c-11ea-9b47-e6d8987472f6.png"> | <img width="170" alt="세미나_3" src="https://user-images.githubusercontent.com/46921003/81468815-d21bd380-921c-11ea-95bf-507e6611fe73.png"> |



<u>PickerView, TableView, CollectionView 구현 방법은 큰 틀에서는 비슷한 순서를 따른다!!</u>

1. UI요소를 ViewController에 끌어와 준 후 기본적인 오토레이아웃을 잡아준다.
2. 새로운 Swift파일 생성 후 후에 입력될 데이터들에 대한 코드 작성을 해준다. ViewController에서 해당 클래스/구조체에 대한 선언을 해준다.
3. ViewController에서 새로운 function에 가지고 있는 데이터를 작성해준다.
4. ViewController에서 추가한 프로토콜 **DataSource**에서 UIView에 **들어갈 값에 대한 정의**를 해준다. ( 예) 행의 갯수, 높이 등 )
5. ViewController에서 추가한 프로토콜 **Delegate**에서 UIView에서 **이벤트가 발생할 때 어떻게 처리할지에 대한 정의**를 해준다. ( 예) touchEvent 등 )



### 과제 1: UITableView 사용하여 카카오톡 채팅화면 구현하기

