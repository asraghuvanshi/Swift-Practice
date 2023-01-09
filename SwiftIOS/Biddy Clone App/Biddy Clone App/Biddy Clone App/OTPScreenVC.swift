//
//  OTPScreenVC.swift
//  Biddy Clone App
//
//  Created by Avi on 30/12/22.
//

import UIKit
import MBProgressHUD

class OTPScreenVC: UIViewController {

    var userData:[String:Any] = [String:Any]()
    var email = String()
    var str = "Didn't receive the code yet? Resend OTP"
    var runCount = 30
    var enteredOtp = String()
    var isRegisteredViaSignUp = Bool()
    var isViaForget = Bool()
    @IBOutlet weak var verifyOptButton: UIButton!
    @IBOutlet weak var otpInputField: UITextField!
    @IBOutlet weak var otpStatuslLabel: UILabel!
    @IBOutlet weak var otpStatusTop: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        verifyOptButton.layer.cornerRadius = 25
        otpInputField.keyboardType = .numberPad
    }

    override func viewWillAppear(_ animated: Bool) {
        self.generateOtpRequest()
    }
    
    func generateOtpRequest(){
        self.statTimmer()
        var param:[String:Any]!
        
        if isRegisteredViaSignUp{
            param = ["email" : email , "type" : "UR"]
        }
        if isViaForget{
            param = ["email" : email , "type" : "UFP"]
        }
        otpStatusTop.text = "OTP has been sent on your registered email \(email)"
        USERAPI.createOTP(param: param, success: { (response) in
            
            if let statusCode = ((response) as AnyObject)["statusCode"] as? Int {
                if statusCode == 200 {
                    print("success")
                }else{
                    let Success_Msg = ((response) as AnyObject)["data"] as? String ?? ""
                    AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message:Success_Msg, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: { (success) in
                    })
                }
            }
        }) { (error) in
            print(error)
        }
    }
    
    @IBAction func resendOTP(_ sender: Any) {
        AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: LiteralMessage.RESEND_OTP, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {success in })
        self.generateOtpRequest()

    }
    
    
    @IBAction func otpVerifyAction(_ sender: Any) {
        var param:[String:Any]!
        enteredOtp =  self.otpInputField.text!
        
        if enteredOtp.count == 4{
            if isRegisteredViaSignUp{
                param = ["otp":Int(enteredOtp) ?? 0,"type":"UR","email":email] as [String : Any]
            }
            if isViaForget{
                param = ["otp":Int(enteredOtp) ?? 0, "type":"UFP","email":email] as [String:Any]
            }
            USERAPI.VerifyOTP(param: param, success: { success in
                print(success)
                if let response = ((success) as AnyObject)["data"] as? NSDictionary {
                    let token   = response["token"] as! Int
                    SaveToken.otpToken = token
                    self.userData.updateValue(SaveToken.otpToken!, forKey:"otpToken" )
                    if(self.isRegisteredViaSignUp){
                        self.registerAPI()
                    }
                }
            }, failure: { failure in
                print(failure)
            })
        }
        else {
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "Error", message: LiteralMessage.InvalidOtp, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {(error) in })
        }
        Constants.hideProgressBar(view: self.view)
    } // verify action end
    
    func registerAPI(){
        Constants.showProgressBar(view: self.view)
        USERAPI.RegisterAPI(params: self.userData, success: {response in
            if (response as AnyObject).statusCode == 200{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "BiddyReceiverVC") as! BiddyReceiverVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }, failure: { error in
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: LiteralMessage.EnteredWrongEmail, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {success in })
            print("error")
        })
    }
    
    func statTimmer(){
//        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//            self.otpStatuslLabel.text = "Didn't receive the code yet?\nPlease wait 00:\(runCount)"
//            runCount -= 1
//            if runCount == 0{
//                timer.invalidate()
//                self.resendOTPAttribute()
//            }
//            if runCount < 10{
//                self.otpStatuslLabel.text = "Didn't receive the code yet?\nPlease wait 00:0\(runCount)"
//            }
//            if runCount == 0{
//                self.resendOTPAttribute()
//            }
//        }
    }
     
    func resendOTPAttribute(){
        self.otpStatuslLabel.text = str
        let strName = self.otpStatuslLabel.text!
        let string_to_color2 = "Resend OTP"
        let attributedString1 = NSMutableAttributedString(string:strName)
        let range2 = (strName as NSString).range(of: string_to_color2)
        attributedString1.addAttribute(NSAttributedString.Key.foregroundColor, value: Constants.GREEN_COLOUR , range: range2)
        self.otpStatuslLabel.attributedText = attributedString1
        
    }
} // class end
