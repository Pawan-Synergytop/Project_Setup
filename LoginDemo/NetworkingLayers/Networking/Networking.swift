//
//  Networking.swift
//  LoginDemo
//
//  Created by Mac on 06/12/20.
//

import Foundation
import UIKit
import Alamofire

struct Networking {
    
    enum Router: URLRequestConvertible {
        
        case PostLogin([String: Any])
        
        
        
        var method: Alamofire.HTTPMethod {
            switch self {
            case .PostLogin :
                return .post
                
            }
        }
        var UrlPath: String {
            switch self {
            case .PostLogin:
                return ApiConstant.BASEURL+ApiConstant.SubURLs.login
                
            }
        }
        //** MARK: URLRequestConvertible
        func asURLRequest() throws -> URLRequest {
            
            let strUrl = UrlPath
            let URL = Foundation.URL(string:strUrl)!
            var urlRequest = URLRequest(url: URL as URL)
            urlRequest.httpMethod = method.rawValue
            
            switch self {
            case .PostLogin(let parameters):
                urlRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
                
            }
            return urlRequest
        }
    }
}
