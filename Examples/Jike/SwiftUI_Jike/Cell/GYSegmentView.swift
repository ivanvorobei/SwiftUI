//
//  GYSegmentView.swift
//  Landmarks
//
//  Created by alexyang on 2019/6/6.
//  Copyright © 2019 Apple. All rights reserved.
//
import UIKit
import SwiftUI

struct GYSegmentView : UIViewRepresentable {
    func makeCoordinator() -> GYSegmentView.Coordinator {
        Coordinator(self)
    }
    
   
    var titles:[String]
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UISegmentedControl
    {
        let segment = UISegmentedControl(items: titles)
        segment.addTarget(context.coordinator, action:#selector(Coordinator.updateCurrentPage(sender:)) , for: .valueChanged)
        return segment
    }
    
    func updateUIView(_ segment: UISegmentedControl, context: Context) {
        
        segment.selectedSegmentIndex = currentPage
    }
    
    class Coordinator: NSObject {
        var control: GYSegmentView
        
        init(_ control: GYSegmentView) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UISegmentedControl) {
            control.currentPage = sender.selectedSegmentIndex
        }
    }
}

#if DEBUG
struct GYSegmentView_Previews : PreviewProvider {
    static var previews: some View {
        GYSegmentView(titles: ["哈哈","你好","无聊"], currentPage: .constant(0))
    }
}
#endif
