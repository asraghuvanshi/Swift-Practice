import UIKit
import SwiftyJSON
import Alamofire

class handleError: NSObject {
    static var shared = handleError()
    
    
    func HandlejsonData (dataResponse:DataResponse<Data>,vc: UIViewController,view: UIView, success: @escaping(Any) -> Void ,failure:@escaping (NSError) -> Void)->Void{
        
        if((dataResponse.response?.statusCode) != nil){
            print(dataResponse.response?.statusCode)
            if dataResponse.response?.statusCode == 200 {
                
                let json = JSON(dataResponse.data!)
                let dict = json.object
                success(dict)
            } else{
                let json = JSON(dataResponse.data!)
                let dict = json.object
                
                guard let dict1 = dict as? NSDictionary else {return}
                if dict1.value(forKey: "statusCode") as? Int == 401 || dict1.value(forKey: "statusCode") as? Int == 403 {
                    return
                }
                if(dict1.value(forKey: "data") as? NSDictionary != nil){
                    let data = dict1.value(forKey: "data")! as! NSDictionary
                    Constants.hideProgressBar(view: view.self)
                    AlertController.SHOW_ALERT_CONTROLLER_SINGLE_BUTTON(alertTitle: "", message: LiteralMessage.EmailAlreadyExist, btnTitle: LiteralMessage.OK, viewController: vc.self, completionHandler: {succes in })

                }
                return
            }
            
        }else{
            let err = dataResponse.error
            failure(err! as NSError)
            print(err)
        }
    }
    
    
    func HandlejsonData (dataResponse:DataResponse<Data>, success: @escaping(Any) -> Void ,failure:@escaping (NSError) -> Void)->Void{
        
        if((dataResponse.response?.statusCode) != nil){
            print(dataResponse.response?.statusCode)
            if dataResponse.response?.statusCode == 200 {
                
                let json = JSON(dataResponse.data!)
                let dict = json.object
                success(dict)
            } else{
                let json = JSON(dataResponse.data!)
                let dict = json.object
                
                guard let dict1 = dict as? NSDictionary else {return}
                if dict1.value(forKey: "statusCode") as? Int == 401 || dict1.value(forKey: "statusCode") as? Int == 403 {
                    return
                }
                let view = UIView()
//                Constants.hideProgressBar(view: view.self)
                if(dict1.value(forKey: "data") as? NSDictionary != nil){
                    let data = dict1.value(forKey: "data")! as! NSDictionary

                }
                return
            }
            
        }else{
            let err = dataResponse.error
            failure(err! as NSError)
            print(err)
        }
    }
}
