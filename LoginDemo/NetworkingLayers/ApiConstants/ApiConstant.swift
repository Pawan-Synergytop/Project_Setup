//
//  ApiConstant.swift
//  Project_setup_mmgh
//
//  Created by Mac on 06/12/20.
//
import Foundation
import UIKit


enum NetworkEnvironment {
    case dev
    case staging
    case production
}
 
class ApiConstant: NSObject{
    static let environment : NetworkEnvironment = .dev
    
    
    static var BASEURL : String {
        switch ApiConstant.environment {
        case .dev:
            return "http://test.com/api/"
        case .staging:
            return "https://test.com/api/"
        case .production:
            return "https://test.com/api/"
        }
    }
    
    
    struct SubURLs {
        internal static let login = "login"
        
    }
}
