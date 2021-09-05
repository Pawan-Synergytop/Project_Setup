//
//  Validations.swift
//  LoginDemo
//
//  Created by Mac on 06/12/20.
//
import Foundation
import UIKit

// MARK: Regex Method
enum RegexType {
    case firstName
    case lastName
    case mobile
    case email
    
    func getRegex() -> String {
        switch self {
        case .firstName:
            return "[a-zA-Z ]{1,20}" // can enter any characters  from 1 to 20
        case .lastName:
            return "[a-zA-Z ]{1,20}" // can enter any characters  from 1 to 20
        case .email:
            return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"  //standard email validation
        case .mobile :
            return "[\\d]{10}" //can enter mobile number from 1 to 11 digits
        }
    }
}
extension String {
    // validation method for textfield
    func isValid(type: RegexType) -> Bool {
        let regex = type.getRegex()
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    func encodedURL() -> (String) {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
}

