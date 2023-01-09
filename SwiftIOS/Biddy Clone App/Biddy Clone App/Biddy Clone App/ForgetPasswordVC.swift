//
//  ForgetPasswordVC.swift
//  Biddy Clone App
//
//  Created by Avi on 03/01/23.
//

import UIKit

class ForgetPasswordVC: UIViewController {

    @IBOutlet weak var useremailFP: UITextField!
    
    @IBOutlet weak var continueBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBttn.layer.cornerRadius = 25

    }
    
    @IBAction func forgetPasswordRetrieve(_ sender: Any) {
        let useremail = useremailFP.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let verifyemail = Utility.isValidEmailAddress(emailAddressString: useremail)
        if useremail.count < 1 {
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: LiteralMessage.EnteredWrongEmail, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {success in })
        }
        else if verifyemail == false{
            AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: LiteralMessage.EnteredWrongEmail, btnTitle: LiteralMessage.OK, viewController: self, completionHandler: {success in })

        }
        else {
            let viewcontroller = storyboard?.instantiateViewController(withIdentifier: "OTPScreenVC") as! OTPScreenVC
            viewcontroller.email = useremail
            viewcontroller.isViaForget = true
            self.navigationController?.pushViewController(viewcontroller, animated: true)
        }
    }
}
