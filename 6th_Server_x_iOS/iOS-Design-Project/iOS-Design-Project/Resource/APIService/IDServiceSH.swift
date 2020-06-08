//
//  IDServiceSH.swift
//  iOS-Design-Project
//
//  Created by Sehwa Ryu on 03/06/2020.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

struct IDServiceSH {
    // Singleton
    static let idService = IDServiceSH()

    func getImage(completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = Alamofire.request(APIConstants.itemsURL, method: .get, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
        switch dataResponse.result {
        // 회원가입 성공
        case .success:
            print("success")
        // 회원가입 실패
        case .failure:
            completion(.networkFail)
            }
            
        }
        
    }
    
//    func getTrending(completion: @escaping (NetworkResult<Any>) -> Void) {
//        //let header: HTTPHeaders = ["Content-Type": "application/json"]
//        let dataRequest = Alamofire.request(APIConstants.searchURL)
//
//        dataRequest.responseData { dataResponse in
//            switch dataResponse.result {
//            case .success:
//                //guard let statusCode = dataResponse.response?.statusCode else { return }
//                guard let value = dataResponse.result.value else { return }
//                let networkResult = self.judge(by: statusCode, value)
//                completion(networkResult)
//            case .failure:
//                completion(.networkFail)
//                }
//            }
//        }
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isProduct(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }

    private func isProduct(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try?
            decoder.decode(trendingDataSH.self, from: data) else {
                return .pathErr }
        guard let productData: [trendingData] = decodedData.data else {
            return .requestErr(decodedData.message) }
        return .success(productData)
    }
    

}
