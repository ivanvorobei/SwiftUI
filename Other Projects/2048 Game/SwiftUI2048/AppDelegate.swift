//
//  AppDelegate.swift
//  SwiftUI2048
//
//  Created by Hongyu on 6/5/19.
//  Copyright © 2019 Cyandev. All rights reserved.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var gameLogic: GameLogic!
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        gameLogic = GameLogic()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UIHostingController(rootView:
            GameView().environmentObject(gameLogic)
        )
        window!.makeKeyAndVisible()
        
        self.becomeFirstResponder()
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    @objc func newGame(_ sender: AnyObject?) {
        gameLogic.newGame()
    }
    
    override func buildMenu(with builder: UIMenuBuilder) {
        builder.remove(menu: .edit)
        builder.remove(menu: .format)
        builder.remove(menu: .view)
        
        builder.replaceChildren(ofMenu: .file) { oldChildren in
            var newChildren = oldChildren
            let newGameItem = UIKeyCommand(input: "N",
                                                  modifierFlags: .command,
                                                  action: #selector(newGame(_:)))
            newGameItem.title = "New Game"
            newChildren.insert(newGameItem, at: 0)
            return newChildren
        }
    }

}

