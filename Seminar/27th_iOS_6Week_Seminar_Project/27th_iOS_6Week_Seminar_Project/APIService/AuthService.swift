//
//  AuthService.swift
//  27th_iOS_6Week_Seminar_Project
//
//  Created by 최영재 on 2020/11/21.
//

import Foundation
import Alamofire

struct AuthService {
    static let shared = AuthService()
    
    func signIn(email: String, password: String, completion: @escaping (NetworkResult<Any>) -> ()){
        
        let url = APIConstants.usersSignInURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email": email,
            "password" : password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { (response) in
            
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                completion(judgeSignInData(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeSignInData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SignInData>.self, from: data) else {
            return .pathErr
        }
        
        switch status {
        case 200:
            return .success(decodedData.data)
        case 400:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .pathErr
        }
        
    }
    
    
    
    
    func signUp(email: String, password: String, username: String, completion: @escaping (NetworkResult<Any>) -> ()){
        
        let url = APIConstants.usersSignUpURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email": email,
            "password" : password,
            "userName" : username
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { (response) in
            
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                completion(judgeSignUpData(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeSignUpData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SignUpData>.self, from: data) else {
            return .pathErr
        }
        
        switch status {
        case 200:
            return .success(decodedData.data)
        case 400:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .pathErr
        }
        
    }
    
}
