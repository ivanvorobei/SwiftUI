//
//  ContentView.swift
//  BehindTheScenes
//
//  Created by Simeon Saint-Saens on 4/6/19.
//  Copyright © 2019 Two Lives Left. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    let count: Int
    
    var body: some View {
        VStack {
            Text("Scene \(count)")
            Text("This is a SwiftUI View 🚀")
        }
    }
}

