//
//  ContentView.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/5.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct ContentView : View {
	
    var body: some View {
		
		GYTabView([Text("233")], titles: ["首页","动态","聊天","我的"],
				  images: ["tab_home_normal",
							"tab_status_normal",
							"tab_chat_normal",
							"tab_me_normal"],
				  imageSels: ["tab_home_select",
							  "tab_status_select",
							  "tab_chat_select",
							  "tab_me_select"])
		.edgesIgnoringSafeArea(.top)
    }
	
	func getIndex(item: TabBarItem) -> Int {
		return 0
	}
	
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
		
    }
}
#endif
