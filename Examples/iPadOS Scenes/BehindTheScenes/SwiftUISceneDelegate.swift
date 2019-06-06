//
//  SwiftUISceneDelegate.swift
//  BehindTheScenes
//
//  Created by Simeon Saint-Saens on 4/6/19.
//  Copyright © 2019 Two Lives Left. All rights reserved.
//

import UIKit
import SwiftUI

class SwiftUISceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let count = session.userInfo?["SceneCount"] as? Int ?? 0
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UIHostingController(rootView: ContentView(count: count))
        window?.makeKeyAndVisible()
    }
}
