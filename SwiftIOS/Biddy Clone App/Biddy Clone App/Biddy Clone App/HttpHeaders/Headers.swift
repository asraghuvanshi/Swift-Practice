//
//  Headers.swift
//  Cloud Seat
//
//  Created by Ishan Grover on 21/11/19.
//  Copyright © 2019 CYL8R. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Headers: NSObject {
   //MARK:- API for Instance & Header Method
    class var sharedInstance: Headers {
        struct Static {
            
            static let sharedInstance: Headers = { Headers() }()
            
            static var token = {0}()
        }
        _ = Static.token
        
        return Static.sharedInstance
    }
    
    class func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type":Constants.ContentType,
        ]
        
        var token = ""
        if UserDefaults.standard.value(forKey: "token") != nil{
            token = UserDefaults.standard.value(forKey: "token") as! String
        }else{
          //  Constant.KAppDelegate.logOutApp()
        }
        
        headers["Authorization"] = token
        
        return headers
    }
}
