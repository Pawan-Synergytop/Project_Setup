//
//  AppPreference.swift
//  LoginDemo
//
//  Created by Mac on 06/12/20.
//

import Foundation

class Prefs: NSObject{
    
    private let defaults = UserDefaults.standard
    class var sharedInstance: Prefs {
        struct Singleton {
            static let instance: Prefs = Prefs()
        }
        return Singleton.instance
    }
    
    
    override init() {}
    
    
    private let CartValue = "CartValue"
    private let SaveUserID = "SaveUserID"
    private let IS_LOGIN = "IS_LOGIN"
    private let KEY_USER_ID = "KEY_USER_ID"
    private let TOKEN = "TOKEN"
    
    private let KEY_FIRST_NAME = "KEY_FIRST_NAME"
    private let KEY_LAST_NAME = "KEY_LAST_NAME"
    private let KEY_EMAIL = "KEY_EMAIL"
    private let KEY_MOBILE = "KEY_MOBILE"
    private let KEY_USER_IMAGE = "KEY_USER_IMAGE"
    private let KEY_APP_LANGUAGE = "KEY_APP_LANGUAGE"
    private let KEY_SAVE_PRODUCT_DATA = "KEY_SAVE_PRODUCT_DATA"
    private let KEY_NOTIFICATION_COUNT = "KEY_NOTIFICATION_COUNT"

    func saveLoginDetail(response: UserData) {
        defaults.set(true, forKey: IS_LOGIN)
        defaults.set(response.firstName, forKey: KEY_FIRST_NAME)
        defaults.set(response.lastName, forKey: KEY_LAST_NAME)
        defaults.set(response.userEmail, forKey: KEY_EMAIL)
        defaults.set(response.userId, forKey: KEY_USER_ID)
        defaults.set(response.userImage, forKey: KEY_USER_IMAGE)
        defaults.set(response.userPhone, forKey: KEY_MOBILE)
    }
    
    func userLogout() {
        let deviceToken = Prefs.sharedInstance.getToken()
        let domain = Bundle.main.bundleIdentifier!
        defaults.removePersistentDomain(forName: domain)
        defaults.synchronize()
        
        Prefs.sharedInstance.setToken(token: deviceToken )
    }
    
    func setUserProfilePic(userProfile: String) {
        defaults.set(userProfile, forKey: KEY_USER_IMAGE)
    }
    func setToken(token: String) {
        defaults.set(token, forKey: TOKEN)
    }
    func setNotificationCount(count: String) {
        defaults.set(count, forKey: KEY_NOTIFICATION_COUNT)
    }
    func getNotificationCount() -> String {
        return defaults.string(forKey: KEY_NOTIFICATION_COUNT) ?? ""
    }
    func setToCartValue(token: String) {
        defaults.set(token, forKey: CartValue)
    }
    func getToCartValue() -> String {
        return defaults.string(forKey: CartValue) ?? ""
    }
    func getToken() -> String {
        return defaults.string(forKey: TOKEN) ?? ""
    }
    
    func isUserLogin() -> Bool {
        return defaults.bool(forKey: IS_LOGIN)
    }
    
    func logoutUser() {
        defaults.set(false, forKey: IS_LOGIN)
    }
    
    func getUserID() -> String{
        return defaults.string(forKey: KEY_USER_ID) ?? ""
    }
    func getUserEmail() -> String {
        return defaults.string(forKey: KEY_EMAIL) ?? ""
    }
    
    func getUserFName() -> String {
        return defaults.string(forKey: KEY_FIRST_NAME) ?? ""
    }
    
    func getUserLName() -> String {
        return defaults.string(forKey: KEY_LAST_NAME) ?? ""
    }
    
    func getUserMobile() -> String {
        return defaults.string(forKey: KEY_MOBILE) ?? ""
    }
    
    func getUserProfilePic() -> String {
        return defaults.string(forKey: KEY_USER_IMAGE) ?? ""
    }
    
    func getAppLanguages() -> Int {
        let languageCode = LocalizationSystem.sharedInstance.getLanguage()
        if languageCode == "en"{
            return 1
        }else if languageCode == "ar"{
            return 2
        }else{
            return 1
        }
    }
 
}
