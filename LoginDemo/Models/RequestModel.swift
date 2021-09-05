//
//  ApiConstant.swift
//  LoginDemo
//
//  Created by Mac on 03/06/21.
//

import Foundation

struct LoginRequest: Codable {
    let userEmail : String?
    let userPassword : String?
    
    enum CodingKeys: String, CodingKey {
        case userEmail = "user_email"
        case userPassword = "user_password"
    }
}
