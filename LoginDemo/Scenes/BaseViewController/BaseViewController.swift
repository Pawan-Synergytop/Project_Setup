//
//  BaseViewController.swift
//  LoginDemo
//
//  Created by Mac on 03/06/21.
//

import UIKit

class BaseClassViewController: UIViewController {
    var loadingView : UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  
        if self.navigationController?.viewControllers.count != nil{
            if (self.navigationController?.viewControllers.count)! > 1 {
                self.setBackBarButtonCustom()
            }
        }
        
    }
    
    public func showSpinner(onView : UIView) {
        if loadingView == nil {
            if #available(iOS 13.0, *) {
                loadingView = UIActivityIndicatorView.init(style: .large)
            } else {
                loadingView = UIActivityIndicatorView.init(style: .whiteLarge)
            }
            loadingView?.transform = CGAffineTransform(scaleX: 2.3, y: 2.3)
            loadingView?.color = UIColor.red
            loadingView?.startAnimating()
            loadingView?.center = onView.center
            UIApplication.shared.beginIgnoringInteractionEvents()

            DispatchQueue.main.async {
                if let view = self.loadingView {
                    onView.addSubview(view)
                }
            }
        } else {
            removeSpinner()
        }
    }
    
    override public func viewDidLayoutSubviews() {
        self.loadingView?.center = self.view.center
    }
    
    public func removeSpinner() {
        UIApplication.shared.endIgnoringInteractionEvents()
        DispatchQueue.main.async {
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
    func setTitle(title:String)  {
        self.title = title
    }
    
    
    func setBackBarButtonCustom()
    {
        //Back buttion
        let btnLeftMenu: UIButton = UIButton()
        btnLeftMenu.setImage(UIImage(named: "back arrow")?.withRenderingMode(.alwaysOriginal), for: UIControl.State())
        btnLeftMenu.addTarget(self, action: #selector(onClcikBack), for: .touchUpInside)
        btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        //        btnLeftMenu.backgroundColor = .red
        btnLeftMenu.contentHorizontalAlignment = .left
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
    }
    

    
    @objc func onClcikBack()
    {
            _ = self.navigationController?.popViewController(animated: true)
    }
    
}



