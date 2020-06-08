//
//  MusicServiceJU.swift
//  iOS-Soptkathon
//
//  Created by 양재욱 on 2020/06/07.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import Alamofire
//
//struct MusicService {
//    private init() { }
//    static let shared = MusicService()
//
//    let header: HTTPHeaders = [
//        "Content-Type" : "application/json"
//    ]
//
//    func getMusicResult(text1: String, completion: @escaping (_ b: Bool) -> Void) {
//
//        let url = APIConstants.musicURL
//        
//        func getData(completion: @escaping (NetworkResult<Any>)->Void){
//            let dataRequest = Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
//            
//            dataRequest.responseData{ dataResponse in
//                switch dataResponse.result{
//                case .success:
//                    guard let statusCode = dataResponse.response?.statusCode else { return }
//                    guard let value = dataResponse.result.value else { return }
//                    let networkResult = self.judge(by: statusCode, value)
//                    completion(networkResult)
//                case .failure: completion(.networkFail)
//                }
//            }
//        }
//        private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> { switch statusCode {
//            case 200: return isUser(by: data)
//            case 400: return .pathErr
//            case 500: return .serverErr default: return .networkFail }
//        }
//    }
//        private func isUser(by data: Data) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//            guard let decodedData = try? decoder.decode(SigininData.self, from: data) else { return .pathErr }
//            guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
//        return .success(tokenData.jwt)
//        }
//}
//        
