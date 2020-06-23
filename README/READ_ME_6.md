## Week 6 (5/30)

### 세미나: 서버 & 클라이언트 합동 세미나

이번 세미나 목표: 저번주에 만든 뷰와 서버통신 연결하기!!

우리가 받아야 할 API는 다음과 같다:

> ### 홈 화면
>
> 1. 배너 이미지
>    1. 제픔 idx로 정보요청
> 2. 제품 리스트
> 3. 제품 정보
>    1. 제픔 idx로 정보요청
> 4. 장바구니에 있는 제품 개수
>    1. 제품 갯수만 받는 API 요청
>
> ### 장바구니
>
> 1. 장바구니 제품정보
>    1. 제품마다 카테고리 불리언값으로 로켓프레시, 로켓배송, 일반 상품 카테고리 분류



서버 분들이 주신 API 명세서 >> https://github.com/sopt-26-joint-seminar/Sever-X-iOS-Seminar

-----



#### 과제 시작!

가져와야할 데이터는 크게 두개로 나뉜다.

1. **이미지 데이터** (URL, 상품 이름, 상품 가격, 상품 정보)
   1. 화면을 꽉 채우는 배너 형태의 컬렉션 뷰
   2. 상품 데이터 컬렉션 뷰
2. **실시간 검색어 데이터** (String 값)
   1. 확장되는 테이블 뷰



🔥*1번부터 살펴보도록 하자!* 🔥

저번 서버 세미나와는 다르게 이번에 주로 사용할 데이터 통신 방식은 ***GET***이다. 주로 이미지나 텍스트 데이터를 서버로부터 <u>받아올 때</u> 사용하는 방식이다. 



1. API 명세서에 따라 API 정보를 담은 구조체를 만들어 주었다. -> APIConstants.swift

```swift
import Foundation

struct APIConstants {
    static let baseURL = "http://ec2-3-34-36-2.ap-northeast-2.compute.amazonaws.com:3000"
    
    // URL Info
    // Items URL
    static let itemsURL = APIConstants.baseURL + "/items"
    static let itemsRecommandedURL = APIConstants.itemsURL + "/recommand"
    static let itemsInBasketURL = APIConstants.itemsURL + "/basket"
    static let itemsCountInBasketURL = APIConstants.itemsInBasketURL + "/count"
    // Search URL
    static let searchURL = APIConstants.baseURL + "/search"
    
}
```

2. 디코딩 해줄 데이터를 담는 구조체를 만들어 주었다 -> trendingDataSH.swift, imageDataSH.swift

> 실시간 검색어를 받아올 구조체. 텍스트 값 하나만 넘겨오기 때문에 name 변수 하나만 지정해주면 된다

```swift
struct trendingDataSH: Codable {
    //var status: Int
    var success: Bool
    var message: String
    var data: [trendingData]

    enum CodingKeys: String, CodingKey {
        //case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([trendingData].self, forKey: .data)) ?? []
    }
}
struct trendingData: Codable {
    var name: String
}
```

> 이미지 URL, 상품 이름, 가격, 로켓/프레쉬/와우 배지 이미지를 불러오는 구조체이다. 로켓/프레쉬/와우는 불리언 형태로, 해당 제품이 해당하는 카테고리에 맞게 이미지를 불러오는 형식이다. 

```swift
import Foundation
struct imageDataSH: Codable {
    var success : Bool
    var message : String
    var data : [ImageData]
    
    enum CodingKeys: String, CodingKey{
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init (from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([ImageData].self, forKey: .data)) ?? [ImageData(id: 0, name: "", price: 0, wow: false, delivery: false, fresh: false, basket: false, img: "", bannerimg: "")]
    }
}

struct ImageData:Codable{
    var id:Int
    var name:String
    var price:Int
    var wow:Bool
    var delivery:Bool
    var fresh:Bool
    var basket:Bool
    var img:String
    var bannerimg:String
}

```



3. Alamofire을 사용한 통신 구조체를 만들어 주었다 -> IDServiceSH.swift

> GET은 POST와 다르게 request안에 서버 URL 값만 넣어주면 된다. Alamofire request의 디폴트 값이 GET이기 때문에 parameter 같은 것을 지정해줄 필요가 없다! (로그인, 회원가입과 같이 사용자가 데이터를 입력을 해야할 때만 파라미터 지정)

```swift
struct IDServiceSH {
    static let idService = IDServiceSH()

    func getImage(completion: @escaping (NetworkResult<Any>) -> Void) {
        toggle = true

        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        // function to get image
        let dataRequest = Alamofire.request(APIConstants.itemsURL, headers: header)
        
        dataRequest.responseData { dataResponse in
        switch dataResponse.result {
        case .success :
            guard let statusCode = dataResponse.response?.statusCode else {return}
            guard let value = dataResponse.result.value else {return}
            let networkResult = self.judge(by: statusCode,value)
            completion(networkResult)
        case .failure : completion(.networkFail)
        }
            
        }
    
    }
```

4. 메인ViewController에 배너이미지(CollectionView)와 상품정보를 불러오는 함수를 지정해준다.

> 배너 구조체(AdsSH)와 상품구조체(RecSH)에 새로운 리스트를 선언해준다. 통신이 성공일 경우일 때 서버에서 불러와준 데이터를 각각의 리스트에 append해준다. Print해서 확인해 봤을때 URL 정보와 상품 정보가 잘 넘어왔다면 성공!

```swift
var ProductInformation:[ImageData] = []
    var urls: [String] = []
    var urlInformation: [AdsSH] = []
    var productURLInformation: [RecSH] = []

// 배너 이미지 통신
    func getURLBanner(){
        var bannerImage : [AdsSH] = []
        IDServiceSH.idService.getImage() { networkResult in
            switch networkResult {
            case .success(let resultData):
                
                guard let data=resultData as? [ImageData] else {
                    return }
                for index in 0..<data.count {
                    //self.urls.append(data[index].bannerimg)
                    let item = AdsSH(imageName: data[index].bannerimg)
                    bannerImage.append(item)
                }
                self.urlInformation = bannerImage
                print("Success")
                print(self.urlInformation[0])
                self.ProductInformation = data
            case .pathErr : print("Patherr")
            case .serverErr : print("ServerErr")
            case .requestErr(let message) : print(message)
            case .networkFail:
                print("networkFail")
            }
        }
    }

// 상품 이미지 통신
    func getURLProduct(){
        IDServiceSH.idService.getImage() { networkResult in
            var productImage : [RecSH] = []
            //var productName : [RecSH] = []
            var recommend:[RecSH] = []
            var rocketFresh:[RecSH] = []
            var todayPrice:[RecSH] = []
            switch networkResult {
            case .success(let resultData):

                guard let data = resultData as? [ImageData] else {
                    return}
                for index in 0..<data.count {
                    let item = RecSH(imagename: data[index].img, name: data[index].name, price: data[index].price, rocket: data[index].wow, fresh: data[index].fresh, delivery: data[index].delivery)
                    productImage.append(item)
                }
                self.productURLInformation = productImage
                print("Success2")
                print(self.productURLInformation[0])

            case .pathErr : print("Patherr")
            case .serverErr : print("ServerErr")
            case .requestErr(let message) : print(message)
            case .networkFail:
                print("networkFail")
            }
        }
    }
```

5. collectionView의 cellForItemAt 함수에서 통신해서 받아온 데이터를 각 cell에 연결해준다. 

> 서버에서 받아온 URL 정보는 UIImageView extension을 사용하여 처리해주었다 (밑에서 참고)

```swift
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  // 배너뷰 설정
        if collectionView == self.AdCollectionView {
            guard let adCell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCellSH.identifier, for: indexPath) as? AdCellSH else { return UICollectionViewCell()}
          
            adCell.adImageView.setImage(path: urlInformation[indexPath.row].imageName)
            adCell.adImageView.contentMode = UIView.ContentMode.scaleAspectFill
            return adCell
          
        } 
  // 상품 정보 뷰 설정
  else if collectionView == self.RecCollectionView {
            guard let recCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecCellSH.identifier, for: indexPath) as? RecCellSH else { return UICollectionViewCell()}
            recCell.productImage.setImage(path: productURLInformation[indexPath.row].productImageName)
          // 제품 이름
            recCell.productName.text = productURLInformation[indexPath.row].ProductName
          // 제품 가격
            recCell.productPrice.text = productURLInformation[indexPath.row].ProductPrice + " 원"
          
          // 로켓 프레쉬/와우/배송의 불리언 값에 true가 입력됐을 경우 이미지 설정
            if productURLInformation[indexPath.row].rocket == true {
                recCell.rocketWow.image = UIImage(named: "badgeRoketdelivery")
            }
            if productURLInformation[indexPath.row].fresh == true {
                recCell.rocketFresh.image = UIImage(named: "badgeRoketfresh")
            }
            if productURLInformation[indexPath.row].delivery == true {
                recCell.rocketDelivery.image = UIImage(named: "badgeRoketwow")
            }
    
```

> 엄청 애먹었던 부분 🔥🔥
>
> 서버도 잘 통신이 되고 데이터도 잘 넘어오는데 컬렉션 뷰 자체가 로드가 되지 않아 엄청 헤맸었다... (한 세시간 정도 ㅠ)
>
> viewDidLoad에 아래의 코드를 추가해주니 정상적으로 뷰가 로드 됐다!
>
> DispatchQueue...? Async..? 뭐지..?
>
> 데이터 로딩 같은 무거운 작업을 실행하는 순간 어플리케이션의 UI는 느려지거나 멈추게 된다고 한다. 동시성(Concurrency)은 2개 이상의 일(task)를 "동시에" 수행할 수 있도록 해준다!! 밑의 함수는 뷰에 이런 동시성을 부여해준다. 자세한 설명은 이 [블로그에](https://wlaxhrl.tistory.com/81) 잘 나와있다. 

```swift
override func viewDidLoad() {

    getURLBanner()
    DispatchQueue.main.async {
        self.AdCollectionView.reloadData()
    }
    getURLProduct()
    DispatchQueue.main.async {
        self.RecCollectionView.reloadData()
    }
```


*서버 통신을 하면서 어려웠던 점* 🔆🔆

- 서버 통신 로직이 익숙치 않은 상태에서 여러 파일들을 오가며 함수를 만들고 기능을 연결시키는 것이 너무 헷갈렸다. 스토리보드 뷰에 바로 보여지는 이미지 뷰 같은건 상대적으로 구현하기가 쉬운데 컬렉션뷰, 테이블뷰 안에 넣으려니 조금 복잡해졌던건 사실이다ㅠ 그래도 단계별로 프린트해서 찍어보고 콘솔창에서 확인하니 해결할 수 있었다~! 더 연습해보기~
- 서버가 안올라와 있는 상태에서 혼자 과제를 하다 통신이 안돼서 멘붕이 왔었다..! 서버 연결할때는 무조건 포스트 맨으로 통신 확인하고 작업하기~!

