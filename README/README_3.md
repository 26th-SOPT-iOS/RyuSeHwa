## Week 3 (5/9)

### 세미나

Delegate Pattern & Protocol

- Delegate Pattern (대리자 위임자): 뷰의 일부 기능을 다른 컨트롤러에 넘기는 것
  - *대신 처리해줄 객체*와 *처리하라고 시키는 객체*를 기억하면 됨

```swift
extension ViewController: UIPickerViewDataSource { // 데이터 넘기기
}  

extension ViewController: UIPickerViewDelegate {  // 뷰의 기능 위임
}
```

| UIPickerView                                                 | UITableView                                                  | UICollectionView                                             |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img width="170" alt="세미나_1" src="https://user-images.githubusercontent.com/46921003/81468767-8ff29200-921c-11ea-9d0d-9215fc3fad8a.png"> | <img width="170" alt="세미나_2-1" src="https://user-images.githubusercontent.com/46921003/81468781-a862ac80-921c-11ea-8ca9-66cca5984763.png"><img width="170" alt="세미나_2-2" src="https://user-images.githubusercontent.com/46921003/81468793-bd3f4000-921c-11ea-9b47-e6d8987472f6.png"> | <img width="170" alt="세미나_3" src="https://user-images.githubusercontent.com/46921003/81468815-d21bd380-921c-11ea-95bf-507e6611fe73.png"> |

