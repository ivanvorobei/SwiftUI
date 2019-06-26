//
//  GYTabBarViewController.swift
//  SegmentDemo
//
//  Created by alexyang on 2019/6/6.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct GYTabBarViewController : UIViewControllerRepresentable {
    
    func makeCoordinator() -> GYTabBarViewController.Coordinator {
        Coordinator(self)
    }
    
    var titles:[String]
    var imgs:[String]
    var imgSels:[String]
    var controllers:[UIViewController]
    
    func makeUIViewController(context: Context) -> UITabBarController {
        
        let tabBar = UITabBarController()
        var index:Int = 0
        let attributes =  [NSAttributedString.Key.foregroundColor: UIColor.black]
        for vc in controllers {
            let title = titles[index]
            let image = UIImage(named: imgs[index])
            let imgSel = UIImage(named: imgSels[index])
            let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: imgSel)
            tabBarItem.setTitleTextAttributes(attributes, for: .selected)
            vc.tabBarItem = tabBarItem
            index += 1
        }
        tabBar.viewControllers = controllers
        tabBar.delegate = context.coordinator
        return tabBar
    }
    
    func updateUIViewController(_ tabBarVC: UITabBarController, context: Context) {
        tabBarVC.setViewControllers(controllers, animated: true)
    }
    
    class Coordinator: NSObject, UITabBarControllerDelegate {
        var parent: GYTabBarViewController
        
        init(_ tabBarVC: GYTabBarViewController) {
            self.parent = tabBarVC
        }
        
        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        }
        
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            return true
        }
    }
}
