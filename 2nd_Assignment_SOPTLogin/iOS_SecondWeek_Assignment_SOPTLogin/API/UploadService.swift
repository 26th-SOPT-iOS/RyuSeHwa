//
//  UploadService.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 13/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//
import Foundation
import Alamofire

struct UploadService {
    static let shared = UploadService()
    func uploadImage(_ token: String, _ image: UIImage, _ imageName: String, completion: @escaping (NetworkResult<Any>) -> Void) { let headers: HTTPHeaders = [
        "Content-Type" : "multipart/form-data",
        "jwt" : token
        ]
        Alamofire.upload(multipartFormData: { multipartFormData in
            // UIImage 형식을 jpegData로 바꾸어 줌
            // compression quality: 사진의 압축률
            let imageData = image.jpegData(compressionQuality: 1.0)!
            multipartFormData.append(imageData, withName: "profile", fileName: imageName, mimeType: "image/jpeg")
        }, usingThreshold: UInt64.init(), to: APIConstants.profileURL, method: .post, headers: headers, encodingCompletion: { (result) in switch result {
        case .success(let upload, _, _): upload.uploadProgress(closure: { (progress) in
            print(progress.fractionCompleted) })
        upload.responseData { response in
            guard let statusCode = response.response?.statusCode, let data = response.result.value else { return }
            let networkResult = self.judge(statusCode, data)
            completion(networkResult)
            }
        case .failure(let error):
            print(error.localizedDescription)
            completion(.networkFail) }
        })
        
    }
    private func judge(_ statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUpdating(data)
        case 400: return .pathErr
        case 500: return .serverErr default: return .networkFail }
    }
    
    
    private func isUpdating(_ data:  Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(ProfileData.self, from: data) else { return .pathErr }
        if decodeData.status == 200 {
            guard let profileData = decodeData.data else { return .requestErr(decodeData.message) }
            return .success(profileData) }
        else {
            return .requestErr(decodeData.message) }
        }
}
   

