//
//  USERAPI.swift
//  Biddy Clone App
//
//  Created by Avi on 29/12/22.
//

import Foundation
import Reachability
import Alamofire
import SwiftyJSON
import UIKit


class USERAPI{
    static let REGISTER = "user"
    static let LOGIN = "user/login"
    static var PROFILE = "user/profile"
//    static let verifyEmailOrMobileUrl = "user/verifyEmail"
    static private let verifyEmailOrMobileUrl = "user/verifyEmail"

    static private var SOCIALLOGIN = "user/social/login"
    static let verifyUsername = "user/verify/userName"
    static let OTP = "otp/create"
    static private var VERIFY = "otp/verify"

    class func RegisterAPI(params:[String:Any] , success: @escaping (Any) ->Void , failure:@escaping (NSError)->Void) ->Void{
        print(params)
        Alamofire.request("\(Constants.BASE_URL)\(REGISTER)", method: .post, parameters: params, headers: Headers.headers()).responseData { dataResponse in
            handleError.shared.HandlejsonData(dataResponse: dataResponse, success: { (dict) in
                print(dict)
                success(print(dict))
                
            }, failure: { (err) in
                failure(err)
            })
        }
    }
    
    class func VerifyUserEmail(params:[String:Any], viewController: UIViewController,view: UIView, success: @escaping (Any)-> Void , failure: @escaping (NSError)->Void ) -> Void{
        
        let baseurl = "\(Constants.BASE_URL)\(verifyEmailOrMobileUrl)"
        print(baseurl)
        Alamofire.request("\(Constants.BASE_URL)\(verifyEmailOrMobileUrl)", method: .post, parameters: params, encoding: JSONEncoding.default, headers: Headers.headers()).responseData { dataResponse in
            handleError.shared.HandlejsonData(dataResponse: dataResponse,vc: viewController,view: view, success: { (dict) in
                print(dict)
                success(print(dict))
                
            }, failure: { (err) in
                failure(err)
            })
        
//        let json = JSON(success.data).object
      //            let dict = json as? NSDictionary
      //            let dictValue = dict?.value(forKey: "data") as! NSDictionary
      //            let view = UIView()
      //                // your code with delay
      //                Constants.hideProgressBar(view: view.self)
      //            let emailStatus = dictValue.value(forKey: "message")!
      //            print(success)
    }
}
    
    class func createOTP(param:[String:Any],success :@escaping (Any) -> Void ,failure:@escaping (NSError) -> Void) -> Void{
        let url = "\(Constants.BASE_URL)\(OTP)"
        print(url)
            Alamofire.request(url, method : .post, parameters:param, encoding : JSONEncoding.default , headers : Headers.headers()).responseData { dataResponse in
                handleError.shared.HandlejsonData(dataResponse: dataResponse, success: { (dict) in
                    print(dict)
                    success(print(dict))
                    
                }, failure: { (err) in
                    failure(err)
                })
            }
    }
    
    class func VerifyOTP(param:[String:Any],success :@escaping (Any) -> Void ,failure:@escaping (NSError) -> Void) -> Void{
        
            Alamofire.request("\(Constants.BASE_URL)\(VERIFY)", method : .post, parameters:param, encoding : JSONEncoding.default , headers : Headers.headers()).responseData { dataResponse in
                handleError.shared.HandlejsonData(dataResponse: dataResponse, success: { (dict) in
                    success(print(dict))
                    
                }, failure: { (err) in
                    failure(err)
                })
            }
        }
    
    class func vipLogin(param:[String:Any],success :@escaping (UserModel) -> Void ,failure:@escaping (NSError) -> Void) -> Void{
            Alamofire.request("\(Constants.BASE_URL)\(LOGIN)", method : .post, parameters:param, encoding : JSONEncoding.default , headers : Headers.headers()).responseData { dataResponse in
                handleError.shared.HandlejsonData(dataResponse: dataResponse, success: { (dict) in
                    
                    if let str = dataResponse.response?.allHeaderFields["Authorization"] as? String{
                      UserDefaults.standard.set(str, forKey: "token")
                    }
                  //  print(dict)
                     let value = UserModel(fromDictionary: dict as! [String : Any])
                    success(value)
                }, failure: { (err) in
                    failure(err)
                })
            }
        }
    
    class func socialLoginSign(param:[String:Any],success :@escaping (UserModel) -> Void ,failure:@escaping (NSError) -> Void) -> Void{
            Alamofire.request("\(Constants.BASE_URL)\(SOCIALLOGIN)", method : .post, parameters:param, encoding : JSONEncoding.default , headers : Headers.headers()).responseData { dataResponse in
                if let str = dataResponse.response?.allHeaderFields["Authorization"] as? String{
                    UserDefaults.standard.set(str, forKey: "token")
                }
                handleError.shared.HandlejsonData(dataResponse: dataResponse, success: { (dict) in
                    let value = UserModel(fromDictionary: dict as! [String : Any])
                    success(value)
                    
                }, failure: { (err) in
                    failure(err)
                })
            }
    }
    }


