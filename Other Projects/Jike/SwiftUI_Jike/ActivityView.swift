//
//  ActivityView.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/5.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct ActivityView : View {
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Image("addPer")
                        .padding(.horizontal, 10)
                    Spacer()
                    Text("动态").bold()
                        .padding(.trailing, 44)
                    Spacer()
                    
                }
            }
            HStack{
                Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255)
                }
                .padding(.top, 0)
                .frame(height: 10.0)
            HStack(alignment: .center){
                CircleImage(imgName: "subIcon")
                .padding(.leading, 10)
                Text("发布动态...")
                    .foregroundColor(Color.gray)
                Spacer()
            }
            HStack{
                Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255)
                }
                .padding(.top, 0)
                .frame(height: 10.0)
            
                List{
                    ActivityCell(nickName: "皮卡丘", timeStamp: "2小时前",content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！", imgName: "sucai"
                    )
                    ActivityCell(nickName: "皮卡丘", timeStamp: "2小时前",content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！", imgName: "sucai"
                    )
                    ActivityCell(nickName: "皮卡丘", timeStamp: "2小时前",content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！", imgName: "sucai"
                    )
                    ActivityCell(nickName: "皮卡丘", timeStamp: "2小时前",content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！", imgName: "sucai"
                    )
                }
                .padding(.leading, -20)
            
        }
    }
}

#if DEBUG
struct ActivityView_Previews : PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
#endif
