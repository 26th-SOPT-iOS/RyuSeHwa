//
//  SignupService.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 18/05/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import Alamofire


struct SignupService {
    static let shared = SignupService()
    // 입력하는 데이터 값들
    private func makeParameter(_ id: String, _ pwd: String, _ name: String, _ email: String, _ phone: String ) -> Parameters{
        return ["id": id, "password": pwd, "name": name, "email": email, "phone": phone]
    }
    
    func Signup(id: String, pwd: String, name: String, email: String, phone: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        // Header 생성
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        // 데이터 리퀘스트
        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(id, pwd, name, email, phone), encoding:
            JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            // 회원가입 성공
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            // 회원가입 실패
            case .failure: completion(.networkFail)
                }
        }
    }
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isSignUp(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail }
    }
}
    
    private func isSignUp(by data:Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignupData.self, from: data)
            else {return .pathErr}
        print(decodedData.status, "\n", decodedData.success, "\n", decodedData.message, "\n")

        if decodedData.success {
            return .success(data)
        }
        else {
            return .requestErr(decodedData.message)}
    }
    

