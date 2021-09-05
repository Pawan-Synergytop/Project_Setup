//
//  Extensions.swift
//  LoginDemo
//
//  Created by Mac on 06/12/20.
//

import Foundation
import UIKit
import MobileCoreServices
import AVFoundation

//MARK: Use Class name as a identifier
public extension NSObject{
    class var nameOfClass: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
}
//MARK: Push and Present UIViewControllers
extension UIViewController{
    func push(_ viewControllerClass: UIViewController){
        self.navigationController?.pushViewController(viewControllerClass, animated: true)
    }
    func present(_ viewControllerClass: UIViewController){
        viewControllerClass.modalTransitionStyle = .coverVertical
        self.present(viewControllerClass, animated: true, completion: nil)
    }
    func presentOnRoot(`with` viewController : UIViewController ,isAnimated:Bool){
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(navigationController, animated: isAnimated, completion: nil)
    }
    func presentWithTransparent(_ viewControllerClass: UIViewController){
        //           viewControllerClass.modalTransitionStyle = .coverVertical
        self.present(viewControllerClass, animated: true, completion: nil)
    }
    func showAlert(title:String , message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
//            if !(self.navigationController?.visibleViewController?.isKind(of: UIAlertController.self))! {
//               present(alertController, animated: true, completion: nil)
//            }
        self.present(alertController, animated: true, completion: nil)
        }
    func isValidEmail(email:String?) -> Bool {
        guard email != nil else { return false }
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    func isValidPassword(password:String?) -> Bool {
        
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: password)
    }
    func isValidatePasswordLength(password:String?)-> Bool
    {
        if (password?.count)! >= 8{
            return true
        }
        else{showAlert(title: AppConstant.ValidationMessages.alert, message: "Password must be at least 8 digits long.")
            return false
        }
    }
    func PasswordMatch(pawwaord: String, confirmPassword:String) -> Bool {
        if pawwaord == confirmPassword{
            return true
        }
        else{ showAlert(title: AppConstant.ValidationMessages.alert, message:AppConstant.ValidationMessages.passwordMatch)  }
        return false
    }
}
//MARK: Strings

extension String{
    
    func addingPercentEncodingForQuery() -> String? {
        let allowed = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._* ")
        return addingPercentEncoding(withAllowedCharacters: allowed)?.replacingOccurrences(of: " ", with: "+")
    }
    
    //for dynamic width of string
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func randomAlphaNumericString(length: Int) -> String {
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.count)
        var randomString = ""
        
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
    
}

extension NSLayoutConstraint {
    /// A helper function to activate layout constraints.
    static func activate(_ constraints: NSLayoutConstraint? ...) {
        for case let constraint in constraints {
            guard let constraint = constraint else {
                continue
            }
            
            (constraint.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
            constraint.isActive = true
        }
    }
}

extension Array where Element: NSLayoutConstraint {
    func activate() {
        forEach {
            if !$0.isActive {
                $0.isActive = true
            }
        }
    }
    
    func deactivate() {
        forEach {
            if $0.isActive {
                $0.isActive = false
            }
        }
    }
}

extension UIApplication {
    
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        return viewController
    }
}
extension Encodable {
  var dictionary: [String: Any] {
    guard let data = try? JSONEncoder().encode(self) else { return [:] }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }!
  }
}
extension UITextField {

    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}
public extension UIColor {
    
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if (cString.count != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
extension UIButton {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
