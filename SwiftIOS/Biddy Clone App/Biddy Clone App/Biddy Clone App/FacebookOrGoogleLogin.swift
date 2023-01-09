//
//  FacebookOrGoogleLogin.swift
//  Biddy Clone App
//
//  Created by Avi on 02/01/23.
//

import UIKit

class FacebookOrGoogleLogin: NSObject {
    
    struct SocialLogin {
        static let gUserInfo = "GLogin"
    }
    
    static var isGoogleLogin:Bool?{
        get{
            guard let user = UserDefaults.standard.object(forKey: SocialLogin.gUserInfo) as? Bool
                else {return false}
            return user
        }
        set{
            UserDefaults.standard.set(newValue, forKey: SocialLogin.gUserInfo)
        }
    }
}
