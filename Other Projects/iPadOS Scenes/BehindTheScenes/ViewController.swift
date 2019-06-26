//
//  ViewController.swift
//  BehindTheScenes
//
//  Created by Simeon Saint-Saens on 4/6/19.
//  Copyright © 2019 Two Lives Left. All rights reserved.
//

import UIKit

enum SceneType: String {
    case uikitScene
    case swiftuiScene
}

class ViewController: UIViewController {

    let count: Int
    
    init(count: Int) {
        self.count = count
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("NO THANKS XCODE")
    }
    
    override func viewDidLoad() {
        print("Loading view controller")
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(openScene(_:)), for: .touchUpInside)
        button.setTitle("Request New Scene", for: .normal)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let swiftUIbutton = UIButton(type: .system)
        swiftUIbutton.addTarget(self, action: #selector(openSwiftUIScene(_:)), for: .touchUpInside)
        swiftUIbutton.setTitle("Request Swift UI Test Scene", for: .normal)
        
        view.addSubview(swiftUIbutton)
        swiftUIbutton.translatesAutoresizingMaskIntoConstraints = false
        
        swiftUIbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        swiftUIbutton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16).isActive = true
        
        let countLabel = UILabel()
        countLabel.text = "\(count)"
        countLabel.textAlignment = .center
        countLabel.textColor = .black
        countLabel.font = UIFont.systemFont(ofSize: 144, weight: .heavy)
        
        view.addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        countLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -30).isActive = true
        countLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
    }

    @objc private func openScene(_ sender: Any) {
        let activity = NSUserActivity(activityType: SceneType.uikitScene.rawValue)
        
        UIApplication.shared.requestSceneSessionActivation(nil, userActivity: activity, options: nil, errorHandler: {
            print($0)
        })
    }
    
    @objc private func openSwiftUIScene(_ sender: Any) {
        let activity = NSUserActivity(activityType: SceneType.swiftuiScene.rawValue)
        
        UIApplication.shared.requestSceneSessionActivation(nil, userActivity: activity, options: nil, errorHandler: {
            print($0)
        })
    }
}

