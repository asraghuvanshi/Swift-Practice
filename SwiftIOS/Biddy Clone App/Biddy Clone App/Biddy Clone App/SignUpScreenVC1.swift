//
//  SignUpScreenVC1.swift
//  Biddy Clone App
//
//  Created by Avi on 05/01/23.
//

import UIKit

class SignUpScreenVC1: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var isChecked: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var eyebutton: UIButton!
    @IBOutlet weak var privacyPolicyBtn: UIButton!
    var ischeck:Bool = false
    var isHidden:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.firstname.delegate = self
        self.lastname.delegate = self
        self.email.delegate = self
        self.password.delegate = self
        
        firstname.autocapitalizationType = .words
        lastname.autocapitalizationType = .words
        signUpButton.layer.cornerRadius = 25

        
    }
    
    
    @IBAction func passwordHideShowAction(_ sender: Any) {
        if !isHidden{
            isHidden = true
            password.isSecureTextEntry = false
            self.eyebutton.setImage(UIImage(named: "ic_eye"), for: .normal)
        }
        else{
            isHidden = false
            password.isSecureTextEntry = true
            self.eyebutton.setImage(UIImage(named: "ic_eye_close"), for: .normal)
        }
    }

    
    @IBAction func backToLoginButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        let firstname = firstname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastname = lastname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (firstname.count < 1 ){
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: LiteralMessage.EnterFirstName, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {(error) in
            })
            return
        }
        
        else if (lastname.count <  1){
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON_RED_COLOR(alertTitle: "", message: LiteralMessage.EnterLastName, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {(error) in
            })
            return
        }

        else if (email.count < 1) {
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON_RED_COLOR(alertTitle: "", message: LiteralMessage.EnterEmail, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {(error) in
            })
            return
        }
        else if (Utility.isValidEmailAddress(emailAddressString: email) == false){
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: LiteralMessage.EnteredWrongEmail, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {(error) in
                
            })
          return
        }
        
        else if (password.count < 6){
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: LiteralMessage.EnterPassword, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {(error) in
                
            })
        return
        }
        
        if ischeck == false{
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: "Please Tick Terms of Services and Privacy Policy to Continue", btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {success in
            })
            return
        }
            Constants.showProgressBar(view: self.view)
            let params_email = ["email" : email]
        USERAPI.VerifyUserEmail(params: params_email, viewController: self,view: self.view , success: {(response) in
               let useremailresponse = response
                print("user email " ,response)
                Constants.hideProgressBar(view: self.view)
                let param = ["email":email,"password":password,"deviceToken":SaveToken.deviceToken ?? "empty","firstName": firstname,"lastName":lastname,"authType":"app","deviceType":"ios"] as [String : Any]

                let vc = self.storyboard?.instantiateViewController(withIdentifier: "OTPScreenVC") as! OTPScreenVC
                vc.email = email
                vc.userData = param
                vc.isRegisteredViaSignUp = true
                self.navigationController?.pushViewController(vc, animated: true)
            },
            failure: {(error) in
                Constants.hideProgressBar(view: self.view)
            })
        
    } // action button end
    
    @IBAction func termsConditionCheck(_ sender: Any) {
        if !ischeck{
            ischeck = true
            isChecked.setImage(UIImage(named: "ic_checkbox_tick"), for: .normal)
        }
        else{
            ischeck = false
            isChecked.setImage(UIImage(named: "ic_checkbox"), for: .normal)
        }
    }
} // class end
