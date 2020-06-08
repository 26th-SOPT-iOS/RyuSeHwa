클라이언트 저장소

![image](https://user-images.githubusercontent.com/56633607/84016351-2222bd00-a9b8-11ea-8c01-6279d0afabee.png)



> ***사운드 여행, 뭔지 모르시겠다고요?***

![image](https://user-images.githubusercontent.com/56633607/84016488-50a09800-a9b8-11ea-9ddb-163e034e98e8.png)

![image](https://user-images.githubusercontent.com/56633607/84016536-63b36800-a9b8-11ea-84b1-1ba9d6df98d4.png)

![image](https://user-images.githubusercontent.com/56633607/84016616-7e85dc80-a9b8-11ea-8aab-fd86f5fc696d.png)

![image](https://user-images.githubusercontent.com/56633607/84016663-8d6c8f00-a9b8-11ea-9a5c-8e4923639fad.png)

![image](https://user-images.githubusercontent.com/56633607/84016842-d6244800-a9b8-11ea-84e6-b2f1ec2ad2ec.png)
![image](https://user-images.githubusercontent.com/56633607/84016915-ef2cf900-a9b8-11ea-9790-574f602d2e42.png)
![image](https://user-images.githubusercontent.com/56633607/84016860-dd4b5600-a9b8-11ea-8309-22feed2dafb9.png)

> **기획 파트**

<img width="1792" alt="스크린샷 2020-06-08 오후 6 51 48" src="https://user-images.githubusercontent.com/56633607/84017059-1f749780-a9b9-11ea-9874-31713191fbb6.png">

- 기획 <박세은> 이 Notion을 사용해서 디자인, 개발, 서버 파트와 함께 아이데이션 진행

- Timeline을 정해놓고 해커톤 시작!!
- ![image](https://user-images.githubusercontent.com/56633607/84018798-66638c80-a9bb-11ea-8183-ae62168e947a.png)
- [Notion](https://www.notion.so/30eecc83b2b94597bd6b999522af1ff5)

<hr/>

> 디자인 파트

- 디자인 파트에서는 WireFrame을 짜주고 전체적인 앱의 레이아웃과 이미지를 설정해주셨다.
- ![image](https://user-images.githubusercontent.com/56633607/84018026-86468080-a9ba-11ea-8563-8061cca0f42e.png)
- Zeplin
- <img width="1792" alt="스크린샷 2020-06-08 오후 7 01 47" src="https://user-images.githubusercontent.com/56633607/84018016-847cbd00-a9ba-11ea-90f2-44c34f8c1fa0.png">

> Client iOS
>
> > 내가 참여한 iOS개발 파트이다.

### **🌟가고싶은 여행지의 소리를 들을 수 있는 서비스**🌟

```
🔥류세화: 로그인 화면, 홈 화면

🔥김성은: 위치화면, 위치화면 2

🔥양재욱: 위치화면 3, 사운드 플레이 화면
```

<img width="400" alt="Screen Shot 2020-06-07 at 8 05 59 AM" src="https://user-images.githubusercontent.com/46921003/83956156-ee4f7680-a895-11ea-9c3c-a0421eae6c7a.png">

<img width="380" alt="Screen Shot 2020-06-07 at 8 06 15 AM" src="https://user-images.githubusercontent.com/46921003/83956160-fad3cf00-a895-11ea-97a5-e7b063d5ceb7.png"><img width="380" alt="Screen Shot 2020-06-07 at 8 06 23 AM" src="https://user-images.githubusercontent.com/46921003/83956161-00311980-a896-11ea-94d1-2ebb493479b4.png">

> 화면을 꽉 채우는 Carousel 형태의 CollectionView 만들기

~~~swift
```
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.ContentsCollectionView {
          // PageControl 연결
            contentPageControl.numberOfPages = contentList.count
            return contentList.count
        } else {
            return travelList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.ContentsCollectionView {
            guard let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentsCollectionViewCell.identifier, for: indexPath) as? ContentsCollectionViewCell else { return UICollectionViewCell()}
            contentCell.set(contentList[indexPath.row])
            return contentCell
        } else if collectionView == self.TravelCollectionView {
            guard let travelCell = collectionView.dequeueReusableCell(withReuseIdentifier: TravelCollectionViewCellSH.identifier, for: indexPath) as? TravelCollectionViewCellSH else { return UICollectionViewCell()}
            travelCell.set(travelList[indexPath.row])
            return travelCell
        } else {
            guard let heartCell = collectionView.dequeueReusableCell(withReuseIdentifier: HeartCollectionViewCell.identifier, for: indexPath) as? HeartCollectionViewCell else { return UICollectionViewCell()}
            heartCell.set(heartList[indexPath.row])
            return heartCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.ContentsCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else {
            return CGSize(width: collectionView.frame.width/1.5, height: collectionView.frame.height)
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            if collectionView == self.ContentsCollectionView {
                return 0
            } else {
                return 10
            }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.ContentsCollectionView {
            return 0
        } else {
            return 15
        }
    }
    
  // PageControl 연결하고 스크롤 기능 구현해주기
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        contentPageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)

    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        contentPageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
```
~~~

> 옆으로 넘어가는 형태의 CollectionView 만들기

~~~swift
```
private func setHeartView() {
        // width, height 설정
        let cellWidth = HeartCollectionView.frame.width/2
        let cellHeight = HeartCollectionView.frame.height
         
         // 상하 inset value 설정
         //let insetY = (CatCollectionView.bounds.height - cellHeight) / 2.0
         let layout = HeartCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
         layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
         layout.minimumLineSpacing = 0
         layout.scrollDirection = .horizontal
        
         HeartCollectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
         
         // 스크롤 시 빠르게 감속 되도록 설정
         HeartCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
```
~~~

<img width="400" alt="KakaoTalk_Photo_2020-06-07-08-49-49" src="https://user-images.githubusercontent.com/46921003/83956712-e266b300-a89b-11ea-8094-94eaaf7ddf6e.png">

> AVAudioPlayerDelegate을 사용한 플레이화면 구현
>
> > 단순히 유투브의 링크를 불러와 새로운 뷰에 동영상을 띄우고 싶지 않아 앱 내에서 플레이어 형태의 기능을 구현하게 해주는 라이브러리를 사용했다!

~~~swift
```swift
class PlayVC: UIViewController, AVAudioPlayerDelegate {
    
    //오디오 플레이어 인스턴스 변수
    var audioPlayer: AVAudioPlayer!
    //재생할 오디오의 파일명 변수
    var audioFile: URL!
    //타이머를 위한 변수
    var progressTimer: Timer!
    // timer selector
    let timePlayerSelector: Selector = #selector(PlayVC.updatePlayTime)

    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var btnHeart: UIButton!
    @IBOutlet var lblSubTitle: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblText1: UILabel!
    @IBOutlet var lblText2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        audioFile = Bundle.main.url(forResource: "IMG_9472", withExtension: "mp3")
        initPlay()   
    }
    
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError{
            print("Error-initPlay : \(error)")
        }
        
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        
        btnPlay.isEnabled = true
        btnPause.isEnabled = false
        btnStop.isEnabled = false
        
        setPlayButtons(true, pause: false, stop: false)
    }
    
    func setPlayButtons(_ play:Bool, pause:Bool, stop:Bool) {
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    func convertNSTimeInterval2String(_ time: TimeInterval) -> String {
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }
    
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(false, pause: true, stop: true)
        
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updatePlayTime(){
        lblCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
    }
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, pause: false, stop: false)
        progressTimer.invalidate()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        setPlayButtons(true, pause: false, stop: false)
    }

}

```
~~~

<img width="380" alt="KakaoTalk_Photo_2020-06-07-08-49-44" src="https://user-images.githubusercontent.com/46921003/83956720-f7434680-a89b-11ea-93af-011d8f95dc4f.png"><img width="380" alt="KakaoTalk_Photo_2020-06-07-08-49-40" src="https://user-images.githubusercontent.com/46921003/83956721-fdd1be00-a89b-11ea-82dc-d7a221a40fbc.png">

> 하트 수를 누적하는 데이터 통신
>
> > 하트 수를 1, 0 으로 쿼리에 저장하고 하트를 클릭하는대로 +1씩 증가하는 기능을 구현. Alamofire에서는 put 방법으로 통신한다!

~~~swift
```swift
import Foundation
import Alamofire

struct HeartsServiceSE {
    static let shared = HeartsServiceSE()
    
    func heart(musicIdx: Int, isChecked: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = Alamofire.request(APIConstants.heartsURL + "\(musicIdx)/\(isChecked)", method: .put, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.networkFail)
            }
            
        }
    }
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return decodeData(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func decodeData(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(HeartsDataSE.self, from: data) else { return .pathErr }
        guard let musicData = decodedData.data else { return .requestErr(decodedData.message) }
        print(musicData)
        return .success(musicData[0])
    }
}

```
~~~

**이번 해커톤에서 잘 한 점**❗️❗️: 

- 작업하는 내내 줌을 켜서 파트원들과 소통하였기 때문에 온라인 협업이었음에도 불구하고 원할하게 작업을 했다!!
- 파트에 국한되지 않고 서로서로의 파트의 역할에 적극적으로 아이디어를 내고 일을 분담하였다.
- 아요 파트원 세명 모두 솝트 전으로는 iOS 개발이 전무한 YB(ㅠㅠ) 였기에 함께 삽질도 많이 했지만 맡은 뷰와 기능들을 끝까지 책임지고 포기하지 않았다!!
- 매우 고되고 외로운(?) 온라인 해커톤이었지만 너무도 긍정적이고 파이팅 넘치는 팀원들과 함께였기에 재밌었다!! 🔥🔥

**이번 해커톤에서 어려웠던 점**❗️❗️:

- Git으로 작업하는 것이 익숙치 않아 처음에 git으로 작업물을 주고 받는 것을 익히는데에 시간이 많이 소요되었다 ㅠㅠ 또 중간 중간 발생한 conflict를 해결하는 데 해커톤 시간의 대부분을 뺏긴 것 같다.
- 데이터 통신이 확실히 너무 어렵다.. 앱잼 전까지 우리 모두 능숙하게 데이터 통신을 할 수 있도록 열심히 공부하기로 했다~!

**Git, Conflict 공부한 것들**❗️❗️:

> **깃을 통해 협업을 진행할 때 필수사항 정리!!**
>
> [Git 설명 잘 해놓은 링크](https://github.com/soogoon/Github-Cookbook/blob/master/Git-Github-Collaborating.md)

- master에 .gitignore, 대략적인 기본 Project file을 올린다.
- dev 브랜치를 만들어서 master을 건드리지 않도록 한다.

1. **git clone <remote>**
2. **git checkout -b <개인 브랜치명>**
3. **git push origin <개인 브랜치명>** // 로컬 브랜치랑 리모트 브랜치 연결!
4. 각자 작업
5. merge

> 동민이형이 친절하게 그려서 설명해준 Git Flow

![image](https://user-images.githubusercontent.com/56633607/84020396-b6435300-a9bd-11ea-915f-65e6fd0909e3.png)

- **2~3번 사이에 "git checkout 재욱" 이 추가되어야 한다!**



### ***Conflict가 생기면 어떻게 해결할까?***

1. 충돌이 생긴 부분을 확인한다
2. 터미널 or VSCode 로 해당 파일을 open 한다.

![image](https://user-images.githubusercontent.com/56633607/84020842-7761cd00-a9be-11ea-8a25-8409663b16d5.png)

- 이런식으로 충돌이 생긴부분에서 
  - <<<<<<HEAD
  - ========== 여기 까지가 **나의 코드**
  - '>>>>>>>> sehwaryu'까지 **세화 코드**
  - **겹치는 부분을 지워주고 저장한다!!**
- **add, commit, push를 한다.**
- **제대로 병합이 진행 되었는지 확인하기 위해 xcode로 프로젝트를 실행시켜본다!!**



### ***만약 프로젝트 파일에 문제가 생기거나 Git 을 뒤로 되돌리고 싶다면??***

1. ***git log*** 명령어를 사용해서 commit 내용들을 확인한다.
2. **git reset --hard <commit id>**
   - 특정한 commit으로 head를 옮길 수 있다.
   - **git push -f origin master** 명령어로 마스터 log를 밀어버린다.
   - 다시 시작한다....

<hr/>

> 서버 파트

서버 파트는 Readme가 잘 정리되어 있어서 링크를 첨부합니다.

[서버파트 README](https://github.com/soptkathon/soptkathon-server/blob/master/README.md)

