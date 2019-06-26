//
//  AppDelegate.swift
//  BehindTheScenes
//
//  Created by Simeon Saint-Saens on 4/6/19.
//  Copyright © 2019 Two Lives Left. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var sceneCount = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        sceneCount += 1
        
        connectingSceneSession.userInfo = ["SceneCount" : sceneCount ]
        
        var sceneDelegateClass: AnyClass = SceneDelegate.self
        
        if let activity = options.userActivities.first,
            let sceneType = SceneType(rawValue: activity.activityType) {
            
            switch sceneType {
            case .uikitScene:
                sceneDelegateClass = SceneDelegate.self
            case .swiftuiScene:
                sceneDelegateClass = SwiftUISceneDelegate.self
            }
        }
        
        let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        config.sceneClass = UIWindowScene.self
        config.delegateClass = sceneDelegateClass

        return config
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

