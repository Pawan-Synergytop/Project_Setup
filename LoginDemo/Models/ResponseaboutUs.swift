//
//  ResponseaboutUs.swift
//  LoginDemo
//
//  Created by Mac on 03/06/21.
//

import Foundation
struct BaseResponse: Codable {
    let responseCode: Int
    let message: String
    enum CodingKeys: String, CodingKey {
        case responseCode, message
    }
}

struct LoginResponse: Codable {
    let data : UserData?
    let response : Bool?
    let status : String?
    let error: String?

    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case response = "response"
        case status = "status"
        case error = "error"
    }
    
}

struct UserData: Codable {
    let firstName : String?
    let lastName : String?
    let userEmail : String?
    let userId : String?
    let userImage : String?
    let userPhone : String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case userEmail = "user_email"
        case userId = "user_id"
        case userImage = "user_image"
        case userPhone = "user_phone"
    }
}
