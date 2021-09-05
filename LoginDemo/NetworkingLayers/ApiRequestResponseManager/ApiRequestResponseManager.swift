//
//  ApiRequestResponseManager.swift
//  LoginDemo
//
//  Created by Mac on 06/12/20.
//

import Foundation
import UIKit
import Alamofire

struct DataService {
    
    // MARK: -  
    static let shared = DataService()
    
    private init() {}
    
    private func sendRequest<T:Codable>(_ requestName: Networking.Router,successHandler:@escaping(T)->(),failHandler:@escaping(Error)->()){
        //Get response from server
        AF.request(requestName).validate().responseDecodable(completionHandler: {(response:AFDataResponse<T>) in
            switch response.result{
            case .success(let responseData):
                successHandler(responseData)
            case .failure(let error):
                print("failed: \(error.localizedDescription)")
                failHandler(error)
            }
        })
    }
    
    private func sendGetRequest<T:Codable>(_ requestName: Networking.Router,successHandler:@escaping(T)->(),failHandler:@escaping(Error)->()){
        //Get response from server
        AF.request(requestName.UrlPath, method: requestName.method, parameters: nil).responseDecodable { (response:AFDataResponse<T>) in
            switch response.result{
            case .success(let responseData):
                successHandler(responseData)
            case .failure(let error):
                print("failed: \(error.localizedDescription)")
                failHandler(error)
            }
        }
    }
    
    public func getLoginUserData(parameters: LoginRequest, successHandler: @escaping (LoginResponse) -> (), failHandler: @escaping (Error) -> ()) {
        sendRequest(Networking.Router.PostLogin(parameters.dictionary), successHandler: successHandler, failHandler: failHandler)
    }
    
}
