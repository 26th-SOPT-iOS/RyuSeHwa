## Week 3 (5/9)

### 세미나

▶️ Delegate Pattern & Protocol

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



<u>▶️ PickerView, TableView, CollectionView 구현 방법은 큰 틀에서는 비슷한 순서를 따른다!!</u>

1. UI요소를 ViewController에 끌어와 준 후 기본적인 오토레이아웃을 잡아준다.
2. 새로운 Swift파일 생성 후 후에 입력될 데이터들에 대한 코드 작성을 해준다. ViewController에서 해당 클래스/구조체에 대한 선언을 해준다.
3. ViewController에서 새로운 function에 가지고 있는 데이터를 작성해준다.
4. ViewController에서 추가한 프로토콜 **DataSource**에서 UIView에 **들어갈 값에 대한 정의**를 해준다. ( 예) 행의 갯수, 높이 등 )
5. ViewController에서 추가한 프로토콜 **Delegate**에서 UIView에서 **이벤트가 발생할 때 어떻게 처리할지에 대한 정의**를 해준다. ( 예) Touch Event 등 )
6. 완성!!





### 과제: UITableView 사용하여 친구목록화면 구현하기



<img width="250" alt="Screen Shot 2020-05-11 at 4 13 03 PM" src="https://user-images.githubusercontent.com/46921003/81826813-1e477a80-9573-11ea-86c1-258c582eb6c5.png"><img width="250" alt="Screen Shot 2020-05-13 at 11 39 49 PM" src="https://user-images.githubusercontent.com/46921003/81826870-2dc6c380-9573-11ea-84c0-24f1d709dcbc.png"><img width="250" alt="Screen Shot 2020-05-14 at 12 06 57 AM" src="https://user-images.githubusercontent.com/46921003/81830319-dfb3bf00-9576-11ea-90f1-542e30e1f93d.png">



▶️ 프로필 클릭 -> 팝업 창 표시

- 세미나에서 했던 **didSelectRowAt**을 사용해보고 싶어서 TableViewCell을 선택하면 프로필이 열리는 기능을 구현해보았다!

> didSelectRowAt -> InstantiateViewController

```swift
extension KakaotalkViewController: UITableViewDelegate { 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let detailViewController = self.storyboard?.instantiateViewController(identifier:
    "DetailViewController") as? DetailViewController else { return }
    detailViewController.imageProfile = profileInformations[indexPath.row].profile.getImageName()
    detailViewController.nameProfile = profileInformations[indexPath.row].name
    detailViewController.statusProfile = profileInformations[indexPath.row].status
        self.present(detailViewController, animated: true, completion: nil)
    }
```



▶️ 도전과제 1: Swipe to Delete

<img width="300" alt="Screen Shot 2020-05-14 at 11 26 53 AM" src="https://user-images.githubusercontent.com/46921003/81885787-140a9800-95d6-11ea-9af9-bbced5d4542c.png">

친구 행을 swipe해 해당 셀을 삭제할 수 있다. 

> Swipe to Delete

```swift
// Deleting cells
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            profileInformations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
```



▶️ 도전과제 2: ActionSheet 열기

<img width="300" alt="Screen Shot 2020-05-15 at 8 36 41 PM" src="https://user-images.githubusercontent.com/46921003/82048668-034e4500-96f0-11ea-9e1f-ce0e1745da33.png">

상단 우측의 톱니바퀴 버튼을 클릭해 ActionSheet를 열 수 있다. 

> ActionSheet

```swift
@IBAction func actionSheetButton(_ sender: UIButton) {
        let alert: UIAlertController

        alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        var cancelAction: UIAlertAction
        var editFriend: UIAlertAction
        var editAll: UIAlertAction

        cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: { (action: UIAlertAction) in
        })
        editFriend = UIAlertAction(title: "친구 관리", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
        })
        editAll = UIAlertAction(title: "전체 설정", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
        })
        
        alert.addAction(cancelAction)
        alert.addAction(editFriend)
        alert.addAction(editAll)
        self.present(alert,animated: true){

        }
    }
```

