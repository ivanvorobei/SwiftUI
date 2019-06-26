//
//  ChatView.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/5.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct ChatView : View {
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Spacer()
                    Text("聊天").bold()
                    .padding(.leading, 44)
                    Spacer()
                    Image("discovery_icon")
                    .padding(.horizontal, 10)
                }
                Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255)
                    .frame(height: 1)
            }
            Group() {
                ChatCell(imageName: "chat_box", title: "招呼",subTitle: "和XX等人的9999个招呼")
                HStack{
                    Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255)
                    .frame(height: 10.0)
                    }
                
                ChatCell(imageName: "subIcon", title: "墨小埋",subTitle: "[有事找你]")
                Divider()
                ChatCell(imageName: "subIcon", title: "墨小埋",subTitle: "[有事找你]")
                Divider()
                ChatCell(imageName: "subIcon", title: "墨小埋",subTitle: "[有事找你]")
                Divider()
            }
            Spacer()
            
        }
    }
}

#if DEBUG
struct ChatView_Previews : PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
#endif
