//
//  UserModelData.swift
//  Biddy Clone App
//
//  Created by Avi on 02/01/23.
//

import Foundation

class UserModel{
    
    var data : UserData!
    var message : String!
    var statusCode : Int!
    var FailureMsg : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        
        
        print(dictionary)
        
        if let dataData = dictionary["data"] as? [String:Any]{
            data = UserData(fromDictionary: dataData)
        } else {
             FailureMsg = dictionary["data"] as? String
        }
                
        message = dictionary["message"] as? String
        statusCode = dictionary["statusCode"] as? Int
    }
    
}


class UserData{
    
    static private var userName:String!
    static private var email:String!
    static private var status:String!
    static private var insertDate : Double!
    static private var firstName : String!
    static private var lastName : String!
  
    static private var userId : String!
    static private var userType : String!
    static private var profilePic : String!
    static private var loc : String!
    static private var isStripeIntegrated : Bool!
    static private var areBankDetailsSubmitted : Bool!
    static private var tags:[String]!

    static private var stripeIntegrationPending : String!
    static private var isNewUser : Bool!
    static private var bid : String!
    static private var authType : String!

    static private var sentBids : Int!
    static private var recievedBids : Int!


    
    static var _tags:[String]?{
        get{
            return tags
        }
        set{
            tags = newValue
        }
    }

    
    static var _authType:String?{
         get{
             return authType
         }
         set{
             authType = newValue
         }
     }
    
    static var _isNewUser:Bool?{
         get{
             return isNewUser
         }
         set{
            isNewUser = newValue
         }
     }
    


    
    static var _bid:String?{
         get{
             return bid
         }
         set{
            bid = newValue
         }
     }
    

    static var _loc:String?{
         get{
             return loc
         }
         set{
            loc = newValue
         }
     }


    static var _profilePic:String?{
         get{
             return profilePic
         }
         set{
            profilePic = newValue
         }
     }


    static var _userId:String?{
         get{
             return userId
         }
         set{
             userId = newValue
         }
     }
    
    static var _userType:String?{
         get{
             return userType
         }
         set{
             userType = newValue
         }
     }
    static var _insertDate:Double?{
        get{
            return insertDate
        }
        set{
            insertDate = newValue
        }
    }
    static var _userName:String?{
        get{
            return userName
        }
        set{
            userName = newValue
        }
    }
    static var _status:String?{
        get{
            return status
        }
        set{
            status = newValue
        }
    }
    static var _firstName:String?{
        get{
            return firstName
        }
        set{
            firstName = newValue
        }
    }
    
    static var _email:String?{
        get{
            return email
        }
        set{
            email = newValue
        }
    }
    
    
    static var _lastName:String?{
        get{
            return lastName
        }
        set{
            lastName = newValue
        }
    }

    
    static var _areBankDetailsSubmitted:Bool?{
        get{
            return areBankDetailsSubmitted
        }
        set{
            areBankDetailsSubmitted = newValue
        }
    }
    static var _isStripeIntegrated:Bool?{
        get{
            return isStripeIntegrated
        }
        set{
            isStripeIntegrated = newValue
        }
    }
    
    static var _stripeIntegrationPending:String?{
        get{
            return stripeIntegrationPending
        }
        set{
            stripeIntegrationPending = newValue
        }
    }
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    public init(){ }
    convenience init(fromDictionary dictionary: [String:Any]) {
        self.init()
        
        print(dictionary)
        
        UserData._userId = dictionary["userId"] as? String
        UserData._authType = dictionary["authType"] as? String

        UserData._userType = dictionary["userType"] as? String
        UserData._profilePic = dictionary["profilePic"] as? String
        UserData._tags = dictionary["tags"] as? [String]

        UserData._email = dictionary["email"] as? String
        UserData._firstName = dictionary["firstName"] as? String
        UserData._status = dictionary["status"] as? String
        UserData._insertDate = dictionary["insertDate"] as? Double
        UserData._lastName = dictionary["lastName"] as? String
        UserData._userName = dictionary["userName"] as? String
        UserData._isNewUser = dictionary["isNewUser"] as? Bool
        UserData._bid = dictionary["bid"] as? String
//        UserData._sentBids = dictionary["sentBids"] as? Int ?? 0
//        UserData._recievedBids = dictionary["recievedBids"] as? Int ?? 0


        UserData._isStripeIntegrated = dictionary["isStripeIntegrated"] as? Bool
        UserData._areBankDetailsSubmitted = dictionary["areBankDetailsSubmitted"] as? Bool

        UserData._stripeIntegrationPending = dictionary["stripeIntegrationPending"] as? String
        UserDefaults.savetoDefaults(dict: dictionary as NSDictionary)
        
       
    }
  static  func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if UserData._areBankDetailsSubmitted != nil{
            dictionary["bankDetailsSubmitted"] =  UserData._areBankDetailsSubmitted
        }
        if  UserData._bid != nil{
            dictionary["bid"] =  UserData._bid
        }
        if UserData._firstName != nil{
            dictionary["firstName"] = UserData._firstName
        }
        
        if UserData._lastName != nil{
            dictionary["lastName"] = UserData._lastName
        }
        
        if UserData._profilePic != nil{
            dictionary["profilePic"] = UserData._profilePic
        }
        
        if UserData._userId != nil{
            dictionary["userId"] = UserData._userId
        }
        return dictionary
    }
    
}
extension UserDefaults{
  
    
  static func savetoDefaults(dict:NSDictionary){
    let data = NSKeyedArchiver.archivedData(withRootObject: dict)
    let defaults = self.standard
    defaults.set(data, forKey: "userData")
    
  }
  static func getFromUserDefaults(){
    if let data = self.standard.object(forKey: "userData") as? NSData {
      let dict = NSKeyedUnarchiver.unarchiveObject(with: data as Data)
      _ = UserData(fromDictionary: dict as! [String : Any])
    }
  }
}

