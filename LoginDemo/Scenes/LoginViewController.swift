//
//  LoginViewController.swift
//  LoginDemo
//
//  Created by Mac on 03/06/21.
//

import UIKit

class LoginViewController: BaseClassViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    // MARK: - Injection
    let viewModel = LoginViewModel(dataService: DataService.shared)
    var resourceList = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
//                self.txtEmail.text = "gy@gmail.com"
//                self.txtPassword.text = "Ashok@1234"
        self.setupViewModel()
        self.resourceList = self.loadJson(filename: "responce")!
        print(self.resourceList.count, self.resourceList)
        
        var param = [String: Any]()
        param["data"] = self.resourceList
        let data = try! JSONSerialization.data(withJSONObject: param as Any, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        if let json = json {
            print("params --->\(json)")
        }
        
    }
    
    func loadJson(filename fileName: String) -> NSMutableArray? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                
                if let dictionary = object as? NSDictionary {
                    let primaryCriteriaArray = dictionary.value(forKey: "primary_criteria") as! NSArray
                    let secondaryCriteriaArray = dictionary.value(forKey: "secondary_criteria") as! NSArray
                    let resourceListArray = ((dictionary.value(forKey: "resource_list") as! NSArray).mutableCopy()) as! NSMutableArray
                    
                    for i in 0..<resourceListArray.count{
                        let objResource = (resourceListArray[i] as! NSDictionary).mutableCopy() as! NSMutableDictionary
                        let valuesArray = objResource.value(forKey: "values") as! NSArray
                        
                        let seniorityRanking = objResource.value(forKey: "seniority_ranking") as! String
                        let totalRanking = objResource.value(forKey: "total_ranking") as! String
                        
                        let subArray = NSMutableArray()
                        let subDic = NSMutableDictionary()
                        subDic.setValue("Seniority Ranking", forKey: "title")
                        subDic.setValue(seniorityRanking, forKey: "value")
                        subDic.setValue(false, forKey: "isEditable")
                        subDic.setValue("seniorityRanking", forKey: "type")
                        
                        subArray.add(subDic)
                        
                        for pIndex in 0..<primaryCriteriaArray.count{
                            let objPrimaryCriteria = (primaryCriteriaArray[pIndex] as! NSDictionary).mutableCopy() as! NSMutableDictionary
                            let primaryId = objPrimaryCriteria.value(forKey: "id") as! Int
                            
                            for v in 0..<valuesArray.count{
                                let objVal = valuesArray[v] as! NSDictionary
                                let valId = objVal.value(forKey: "criteria_id") as! Int
                                let valValue = objVal.value(forKey: "criteria_value") as! Int
                                
                                if valId == primaryId{
                                    objPrimaryCriteria.setValue(valValue, forKey: "value")
                                    break
                                }
                            }
                            
                            objPrimaryCriteria.setValue(true, forKey: "isEditable")
                            objPrimaryCriteria.setValue("primary_criteria", forKey: "type")
                            
                            subArray.add(objPrimaryCriteria)
                        }
                        
                        
                        
                        for sIndex in 0..<secondaryCriteriaArray.count{
                            let objSecondaryCriteria = (secondaryCriteriaArray[sIndex] as! NSDictionary).mutableCopy() as! NSMutableDictionary
                            let secondaryId = objSecondaryCriteria.value(forKey: "id") as! Int
                            
                            for v in 0..<valuesArray.count{
                                let objVal = valuesArray[v] as! NSDictionary
                                let valId = objVal.value(forKey: "criteria_id") as! Int
                                let valValue = objVal.value(forKey: "criteria_value") as! Int
                                
                                if valId == secondaryId{
                                    objSecondaryCriteria.setValue(valValue, forKey: "value")
                                    break
                                }
                            }
                            
                            objSecondaryCriteria.setValue(true, forKey: "isEditable")
                            objSecondaryCriteria.setValue("secondary_criteria", forKey: "type")
                            
                            subArray.add(objSecondaryCriteria)
                        }
                        
                        let subDic1 = NSMutableDictionary()
                        subDic1.setValue("Notification Score/Ranking", forKey: "title")
                        subDic1.setValue(totalRanking, forKey: "value")
                        subDic1.setValue(false, forKey: "isEditable")
                        subDic1.setValue("total_ranking", forKey: "type")
                        subArray.add(subDic1)
                        
                        objResource["subArray"] = subArray
                        resourceListArray[i] = objResource
                    }
                    
                    return resourceListArray
                }
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return nil
    }
    
    @IBAction func btnLoginAction(_sender : Any){
        if  !self.checkPasswordChangeValidation(){
            self.viewModel.fetchVerifyCodeIsValid(email: self.txtEmail.text!, password: self.txtPassword.text!)
        }
    }
  
    private func gotoOnHomeScreen()  {
        let homeVC = storyBoard.Main.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}

extension LoginViewController {
    func checkPasswordChangeValidation() -> Bool {
        guard let email = txtEmail.text , email != "", isValidEmail(email: txtEmail.text)
        else {showAlert(title: AppConstant.ValidationMessages.alert, message: AppConstant.ValidationMessages.validEmail)
            return true}
        
        guard let paasword = txtPassword.text , paasword != ""
        else {showAlert(title: AppConstant.ValidationMessages.alert, message: AppConstant.ValidationMessages.enterPassword)
            return true}
        
        return false
    }
}

// MARK: - Extension for API
extension LoginViewController {
    
    // MARK: - Networking
    private func setupViewModel() {
        viewModel.updateLoadingStatus = {
            let _ = self.viewModel.isLoading ? self.showSpinner(onView: self.view) : self.removeSpinner()
        }
        
        viewModel.showAlertClosure = {
            if let error = self.viewModel.error {
                print(error.localizedDescription)
                self.showAlert(title: AppConstant.ValidationMessages.alert, message: error.localizedDescription)
            }
        }
        
        viewModel.didFinishFetch = {
            self.gotoOnHomeScreen()
        }
    }
    
}


