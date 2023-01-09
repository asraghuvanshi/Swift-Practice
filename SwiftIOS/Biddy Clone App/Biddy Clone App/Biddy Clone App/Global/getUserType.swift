//
//  getUserType.swift
//  Biddy Clone App
//
//  Created by Avi on 02/01/23.
//

import Foundation

public enum userType{
    case google
}

class getUserType{
    class func getUserType(type:userType)->String?{
        switch (type) {
        case .google:
            return "google"
        }
    }
}
