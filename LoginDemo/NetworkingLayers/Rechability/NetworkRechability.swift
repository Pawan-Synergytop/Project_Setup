//
//  NetworkRechability.swift
//  LoginDemo
//
//  Created by Mac on 06/12/20.
//
import Foundation
import Alamofire

struct Connectivity {
  static let sharedInstance = NetworkReachabilityManager()!
  static var isConnectedToInternet:Bool {
      return self.sharedInstance.isReachable
    }
}
