//
//  ViewController.swift
//  Biddy Clone App
//
//  Created by Avi on 27/12/22.
//

import UIKit
import GoogleSignIn
import FirebaseCoreInternal
import FBSDKLoginKit
import FBSDKCoreKit
class ViewController: UIViewController, UIScrollViewDelegate, GIDSignInDelegate {

    var isHidden = Bool()
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var signupAttribute: UILabel!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var switchViewToSignup: UIButton!
    @IBOutlet weak var hideshowEye: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var facebookButton: FBLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview.delegate = self
        loginButton.layer.cornerRadius = 25
        var main_string = "Already a user?"
        var string_to_color =  " Login"
        var range = (main_string as NSString).range(of: string_to_color)

        var attributedString = NSMutableAttributedString(string:main_string)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
        if let token = AccessToken.current,
              !token.isExpired {
              // User is logged in, do work such as go to next view controller.
          }
        else {
            facebookButton.permissions = ["public_profile" , "email"]
            facebookButton.delegate = self
        }
    }

    @IBAction func loginActionButton(_ sender: Any) {
        let useremail = userEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let userpassword = userPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        if (useremail.count < 1) {
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON_RED_COLOR(alertTitle: "", message: LiteralMessage.EnterEmail, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {(error) in
            })
            return
        }
        else if (Utility.isValidEmailAddress(emailAddressString: useremail) == false){
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: LiteralMessage.EnteredWrongEmail, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {(error) in
                
            })
          return
        }
        
        else if (userpassword.count < 6){
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: LiteralMessage.EnterPassword, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {(error) in
                
            })
        return
        }
        else {
           let param =  ["email": useremail,"password":userpassword,"deviceToken":SaveToken.deviceToken]
            Constants.showProgressBar(view: self.view)
            USERAPI.vipLogin(param: param, success: {success in
                print(success)},
                             failure: { fail in
                print(fail)
                AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: LiteralMessage.EnteredWrongEmail, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {success in })
            })
        
        }

    } // login button end
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
             withError error: Error!) {
          if (error == nil) {
            
            socialLogin(userType: .google, firstName: user.profile.name!,lastName: "", email: user.profile.email!, socialLoginId: user.userID!, devicetoken: SaveToken.deviceToken ?? "empty", ProfilePic: "\((user.profile.imageURL(withDimension: 500))!)")
        } else {
            print("\(error!)")
          }
    }
    @IBAction func googleSignButton(_ sender: Any) {
        print("Button Pressed")
        self.googleSign()
    }
    
    @IBAction func passwordHideShow(_ sender: Any) {
        if !isHidden{
            isHidden = true
            userPassword.isSecureTextEntry = false
            self.hideshowEye.setImage(UIImage(named: "ic_eye"), for: .normal)
        }
        else{
            isHidden = false
            userPassword.isSecureTextEntry = true
            self.hideshowEye.setImage(UIImage(named: "ic_eye_close"), for: .normal)
        }
    }
    
    
    @IBAction func forgetPassword(_ sender: Any) {        
        let forgetvc = storyboard?.instantiateViewController(withIdentifier: "ForgetPasswordVC") as! ForgetPasswordVC
        self.navigationController?.pushViewController(forgetvc, animated: true)
    }
    
    @IBAction func switchViewToSignup(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpScreenVC1") as! SignUpScreenVC1
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func googleSign(){
       GIDSignIn.sharedInstance()?.presentingViewController = self
       GIDSignIn.sharedInstance().signIn()
       GIDSignIn.sharedInstance()?.delegate = self
    }
    
    
    func socialLogin(userType: userType, firstName: String,lastName:String, email: String, socialLoginId: String,devicetoken:String?,ProfilePic: String?){
         var params = ["firstName": firstName,
                       "lastName":lastName,
                       "email": email,
                       "deviceToken": SaveToken.deviceToken ?? "empty",
                       "profilePic": ProfilePic!,"deviceType":"ios"] as [String:Any]
         if userType == .google{
             FacebookOrGoogleLogin.isGoogleLogin = true
             params.updateValue(socialLoginId, forKey: "googleId")
             params.updateValue("google", forKey: "authType")
         }
        
        USERAPI.socialLoginSign(param: params, success: { (res) in print(res)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TwitterScreenVC") as! TwitterScreenVC
            self.navigationController?.pushViewController(vc, animated: true)
        }, failure: { failure in print(failure)
        })
        

    }
}

    

extension ViewController: LoginButtonDelegate{
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "name , email"], tokenString: token, version: nil, httpMethod: .get)
        request.start{ (connection, result, error) in print(result)}
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Logged out Successfully")
    }
}
