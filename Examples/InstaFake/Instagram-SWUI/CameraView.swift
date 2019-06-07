//
//  CameraView.swift
//  Instagram-SWUI
//
//  Created by Steven Lee on 6/5/19.
//  Copyright © 2019 leavenstee llc. All rights reserved.
//

import SwiftUI
import UIKit

struct CameraView : UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> CameraViewController {
        return CameraViewController()
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: UIViewControllerRepresentableContext<CameraView>) {
        
    }
    
    typealias UIViewControllerType = CameraViewController
    
    
}

