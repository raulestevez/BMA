//
//  AppDelegate.swift
//  Sample
//
//  Created by Raul Estevez on 18.10.21.
//

import UIKit
import SendBirdUIKit
import SendBirdSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let APP_ID = "6274DFF1-D06A-41F4-A0B9-623245722F8E" // The ID of the Sendbird application you created on the Sendbird Dashboard.
        SBUMain.initialize(applicationId: APP_ID)
          
        // Case 1: USER_ID only
        let USER_ID = "raul"
        SBUGlobals.CurrentUser = SBUUser(userId: USER_ID) // Such as user1 created on the Sendbird Dashboard.
        return true
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


}

