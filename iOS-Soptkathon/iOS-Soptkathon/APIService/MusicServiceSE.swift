////
////  MusicServiceSE.swift
////  iOS-Soptkathon
////
////  Created by 김성은 on 2020/06/07.
////  Copyright © 2020 Sehwa Ryu. All rights reserved.
////
//
//import Foundation
//import Alamofire
//
//struct MusicServiceSE {
//    static let shared = MusicServiceSE()
//    
//    func getMusicList(completion: @escaping (NetworkResult<Any>) -> Void) {
//        let header: HTTPHeaders = ["Content-Type": "application/json"]
//        
//        let dataRequest = Alamofire.request(APIConstants.musicURL, method: .get, encoding: JSONEncoding.default, headers: header)
//        
//        dataRequest.responseData { dataResponse in
//            switch dataResponse.result {
//            case .success:
//                guard let statusCode = dataResponse.response?.statusCode else { return }
//                guard let value = dataResponse.result.value else { return }
//                let networkResult = self.judge(by: statusCode, value)
//                completion(networkResult)
//            case .failure: completion(.networkFail)
//            }
//            
//        }
//    }
//    
//    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
//        switch statusCode {
//        case 200: return isUser(by: data)
//        case 400: return .pathErr
//        case 500: return .serverErr
//        default: return .networkFail
//        }
//    }
//    
//    private func isUser(by data: Data) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//        guard let decodedData = try? decoder.decode(MusicDataSE.self, from: data) else { return .pathErr }
//        guard let musicData = decodedData.data else { return .requestErr(decodedData.message) }
//        print(musicData)
//        return .success(musicData)
//    }
//}
