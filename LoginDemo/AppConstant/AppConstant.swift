//
//  AppConstant.swift
//  LoginDemo
//
//  Created by Mac on 06/12/20.
//

import Foundation

struct AppConstant{
    enum ValidationMessages {
        internal static let alert = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ALERT", comment: "")
       internal static let enterEmail = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_EMAIL", comment: "")
        internal static let validEmail = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_CORRECT_EMAIL", comment: "")
        internal static let enterPassword = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_PASSWORD", comment: "")
        internal static let enterfullName = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Please enter full name", comment: "")
        internal static let passwordRegex = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Please Ensure that you have at least one lower case letter, one upper case letter, one digit and one special character", comment: "")
        internal static let passwordMatch = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Password & Confirm Pasword does not match", comment: "")
        
        internal static let enterInstruction = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_INSTRUCTION", comment: "")
        internal static let validPassword = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_CORRECT_PASSWORD", comment: "")
        internal static let oldPassword = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_OLD_PASSWORD", comment: "")
        internal static let enterConfirmPassword = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_CONFIRM_PASSWORD", comment: "")
        internal static let validConfirmPassword = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_CORRECT_CONFIRM_PASSWORD", comment: "")
        internal static let enterFirstName = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_FIRSTNAME", comment: "")
        internal static let validFirstName = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_CORRECT_FIRST_NAME", comment: "")
        internal static let enterLastName = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_LASTNAME", comment: "")
        internal static let validLastName = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_CORRECT_LAST_NAME", comment: "")
        internal static let enterName = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_NAME", comment: "")
        internal static let enterMobileNumber = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_MOBILENUMBER", comment: "")
        internal static let validMobileNumber = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_CORRECT_MOBILE_NO", comment: "")
        internal static let enterZip = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_ZIP", comment: "")
        internal static let enterCity = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_CITY", comment: "")
        internal static let enterState = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_STATE", comment: "")
        internal static let enterCountry = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_COUNTRY", comment: "")
        internal static let enterWebsite = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_WEBSITE", comment: "")
        internal static let enterCurrentPosition = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_CURRENTPOSITION", comment: "")
        internal static let enterSelectCategory = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_SELECTCATEGORY", comment: "")
        internal static let SelectProfileImage = LocalizationSystem.sharedInstance.localizedStringForKey(key: "SELECT_PROFILEIMAGE", comment: "")
        internal static let enterProffesionalSkills = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_PROFESSIONAL_SKILLS", comment: "")
        internal static let enterAdditionalSkills = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_ADDITIONAL_SKILLS", comment: "")


        
        internal static let checkInternetConnection = LocalizationSystem.sharedInstance.localizedStringForKey(key: "CHECK_NETWORK_CONNECTION", comment: "")
        internal static let labelContentData = LocalizationSystem.sharedInstance.localizedStringForKey(key: "LABEL_CONTENT_DATA", comment: "")
        internal static let acceptTermsAndCondition = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ACCEPT_TERMS&CONDITION", comment: "")
        internal static let noDataFound = LocalizationSystem.sharedInstance.localizedStringForKey(key: "NO_DATA_FOUND", comment: "")
        internal static let selectCategory = LocalizationSystem.sharedInstance.localizedStringForKey(key: "SELECT_CATEGORY", comment: "")
        internal static let setCurrentPosition = LocalizationSystem.sharedInstance.localizedStringForKey(key: "SET_CURRENT_POISITION", comment: "")
        internal static let addAdditionalSkills = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ADD_ADDITIONAL_SKILLS", comment: "")
        internal static let enterCurrentPassword = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_CURRENT_PASSWORD", comment: "")
        internal static let enterNewPassword = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_NEW_PASSWORD", comment: "")
        internal static let enterGroupName = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ENTER_GROUP_NAME", comment: "")
    }

//        API ERROR'S MESSAGE FROM SERVER
    enum ResponseErrorMessage{
        internal static let ERROR_REQUEST_TIMEOUT = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_REQUEST_TIMEOUT", comment: "")
        internal static let ERROR_SESSION_EXPIRED = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_SESSION_EXPIRED", comment: "")
        internal static let ERROR_AUTHENTICATION = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_AUTHENTICATION", comment: "")
        internal static let ERROR_BAD_REQUEST = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_BAD_REQUEST", comment: "")
        internal static let ERROR_URL_OUTDATED = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_URL_OUTDATED", comment: "")
        internal static let ERROR_REQUEST_CANCELED = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_REQUEST_CANCELED", comment: "")
        internal static let ERROR_TITLE = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_TITLE", comment: "")
        internal static let ERROR_CHECK_YOUR_INTERNET_CONNECTION = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_CHECK_YOUR_INTERNET_CONNECTION", comment: "")
        internal static let ERROR_NETWORK_CONNECTION_LOST = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_NETWORK_CONNECTION_LOST", comment: "")
        internal static let ERROR_SECURE_CONNECTION_FAILED = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_SECURE_CONNECTION_FAILED", comment: "")
        internal static let ERROR_SSL_SERVER_ERROR = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_SSL_SERVER_ERROR", comment: "")
        internal static let ERROR_LOADING_DATA = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ERROR_LOADING_DATA", comment: "")
        internal static let TITLE_OK = LocalizationSystem.sharedInstance.localizedStringForKey(key: "TITLE_OK", comment: "")
        internal static let TITLE_CANCEL = LocalizationSystem.sharedInstance.localizedStringForKey(key: "TITLE_CANCEL", comment: "")
   
       
    
    
    }
    
    
    internal static let GOOGLEAPIKEY = "AIzaSyAFFRBDZIlveZwqJ4Zk7VHOJMuUFKxkg5Q"
    
    internal static let Login = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Login", comment: "")

    internal static let EmailAddress = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Email Address", comment: "")
    
    internal static let Password = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Password", comment: "")

    internal static let ForgotPassword = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Forgot Password ?", comment: "")
    internal static let LoginMyAccount = LocalizationSystem.sharedInstance.localizedStringForKey(key: "LOGIN TO MY ACCOUNT", comment: "")
    internal static let RegisterNow = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Register Now", comment: "")
    

}
