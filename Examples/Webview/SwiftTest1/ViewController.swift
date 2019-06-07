//
//  ViewController.swift
//  SwiftTest1
//
//  Created by Jacob Holman on 6/3/14.
//  Copyright (c) 2014 Jacob Holman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var helloWeb : UIWebView
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func buttonTapped(AnyObject) {
       
    helloWeb.loadRequest(NSURLRequest(URL:NSURL(string:"https://www.google.com")))
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

