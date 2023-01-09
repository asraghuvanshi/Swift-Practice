//
//  AppDelegate.swift
//  Biddy Clone App
//
//  Created by Avi on 27/12/22.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import MBProgressHUD
import FBSDKCoreKit
import FBSDKLoginKit



@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var deviceTokens = ""
    var window:UIWindow?
    var hud:MBProgressHUD!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .sound], completionHandler: { didallow , error in })
        
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = "397145569012-t7nmsl5ino3oa760huq9alsg2lt6mfks.apps.googleusercontent.com"
        FBSDKCoreKit.ApplicationDelegate.shared.application(
             application,
             didFinishLaunchingWithOptions: launchOptions
         )
        return true
    }


    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let facebookDidHandle = ApplicationDelegate.shared.application(app, open: url, options: options)


        let googleDidhandle = GIDSignIn.sharedInstance().handle(url)
        return googleDidhandle || facebookDidHandle
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }

}

