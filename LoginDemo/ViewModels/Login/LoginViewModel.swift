//
//  LoginViewModel.swift
//  LoginDemo
//
//  Created by Mac on 03/06/21.
//

import Foundation

class LoginViewModel {
    
    // MARK: - Properties
    private var responseData: LoginResponse? {
        didSet {
            guard let response = responseData else { return }
            self.setupText(with: response)
            self.didFinishFetch?()
        }
    }
    var error: Error? {
        didSet { self.showAlertClosure?() }
    }
    var isLoading: Bool = false {
        didSet { self.updateLoadingStatus?() }
    }
    
    
    private var dataService: DataService?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    // MARK: - Network call
    func fetchVerifyCodeIsValid(email: String,password: String) {
        self.isLoading = true
        let parameters = LoginRequest(userEmail: email, userPassword: password)
        self.dataService!.getLoginUserData(parameters: parameters, successHandler: { (response) in
            if response.error == nil{
                debugPrint("success")
                Prefs.sharedInstance.saveLoginDetail(response: response.data!)
                self.error = nil
                self.isLoading = false
                self.responseData = response
            }else{
                debugPrint("error: \(response.error ?? "")")
                self.error = NSError(domain: "ERROR", code: 500, userInfo:[NSLocalizedDescriptionKey: response.error ?? "error"])
                self.isLoading = false
            }
        }) { error in
            debugPrint("error: \(error)")
            self.error = error
            self.isLoading = false
        }
    }
    
    // MARK: - UI Logic
    private func setupText(with responseData: LoginResponse) {
        
    }
}
