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

var toggle: Bool = true
struct IDServiceSH {
    // Singleton
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
    
    // function to get 인기검색어
    func getTrending(completion: @escaping (NetworkResult<Any>) -> Void) {
        toggle = false
        let dataRequest = Alamofire.request(APIConstants.searchURL)

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
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isProduct(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }

    private func isProduct(by data:Data) ->NetworkResult<Any> {
        let decoder = JSONDecoder()
        if toggle {
            guard let decodedData = try? decoder.decode(imageDataSH.self, from: data) else { return .pathErr }
            return .success(decodedData.data)

        }
        else {
            guard let decodedData = try? decoder.decode(trendingDataSH.self, from: data) else { return .pathErr }
            return .success(decodedData.data)
        }
    }
    

}
