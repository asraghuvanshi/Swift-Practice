//
//  Literals.swift
//  Biddy Clone App
//
//  Created by Avi on 28/12/22.
//

import Foundation
import UIKit
import MBProgressHUD

struct Constants{
    static let ContentType = "application/json"

    static let BASE_URL = "https://biddyapi.zimblecode.com/api/"
    static var SOCKET_URL = "https://biddyapi.zimblecode.com"
    static let ClientId = "394046963577-310t8ircc9amj4rnpm66kbug3t8fs594.apps.googleusercontent.com"
    static let pinkColor = UIColor(red: 252.0 / 255.0, green: 40.0 / 255.0, blue: 151.0 / 255.0, alpha: 1)
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
   
    static let GREEN_COLOUR = UIColor.green
    static func showProgressBar(view: UIView) ->Void {
         let spinnerActivity = MBProgressHUD.showAdded(to: view ,animated: true);
         spinnerActivity?.color = UIColor.black
         spinnerActivity?.labelText = "Loading..."
         spinnerActivity?.isUserInteractionEnabled = false
     }

    static func hideProgressBar(view: UIView){
         MBProgressHUD.hideAllHUDs(for: view, animated: true);
     }


}
struct LiteralMessage{
    
    static let OK = "OK"
    static let EnterFirstName = "Enter your first name"
    static let EnterLastName = "Enter your last name"
    static let EnterEmail = "Enter your email id"
    static let EnteredWrongEmail = "Please enter valid email id"
    static let EnterPassword = "Enter your password"
    static let InvalidOtp = "You have entered invalid OTP"
    static let EmailAlreadyExist = "Entered email is already exist please enter valid email"
    static let RESEND_OTP = "OTP has sent to your registered email"
}
