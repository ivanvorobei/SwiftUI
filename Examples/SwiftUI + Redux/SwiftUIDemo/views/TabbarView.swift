//
//  MainView.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 05/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI

struct TabbarView : View {
    @EnvironmentObject var state: AppState
    @State var selectedIndex: Int = 0
    
    var body: some View {
        TabbedView(selection: $selectedIndex) {
            UsersListView()
                .tabItemLabel(Text("Users"))
            MapView()
                .tabItemLabel(Text("Map"))
        }
    }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        TabbarView(selectedIndex: 0).environmentObject(sampleStore)
    }
}
#endif

