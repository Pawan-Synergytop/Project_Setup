//
//  HomeViewController.swift
//  LoginDemo
//
//  Created by Mac on 03/06/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var lblDetails: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblDetails.text = "UserID- \(Prefs.sharedInstance.getUserID()) \n UserEmail- \(Prefs.sharedInstance.getUserEmail()) \n UserName- \(Prefs.sharedInstance.getUserFName())"
    }
}
