//
//  ActivityCell.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/5.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct ActivityCell : View {
    var nickName:String
    var timeStamp:String
    var content:String
    var imgName:String
    var body: some View {
        VStack(alignment: .leading){
            HStack(){
                VStack{
                    CircleImage(imgName: "pokemon")
                        .padding(.leading, 20)
                        .padding(.top, 10)
                    Spacer()
                }
                
                VStack(alignment: .leading){
                    HStack{
                        Text(nickName)
                            .padding(.top, 5)
                            .padding(.bottom, 2)
                        Spacer()
                    }
                    Text(timeStamp)
                    .font(Font.system(size: 12))
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 2)
                    
                    Text(content)
                        .frame(minHeight:50, maxHeight: 300, alignment: .top)
                    .font(Font.system(size: 15))
                    .lineLimit(-1)
                    Image(imgName)
                    .padding(.bottom, 20)
                    .padding(.trailing, 10)
                }
                
            }
            HStack{
                Spacer()
                Image("dianzan")
                Spacer()
                Image("pinglun")
                Spacer()
                Image("share")
                Spacer()
                Image("shenglue")
            }
        }
        .lineSpacing(0)
        .frame(minHeight: 300)
    }
}

#if DEBUG
struct ActivityCell_Previews : PreviewProvider {
    static var previews: some View {
        ActivityCell(nickName: "皮卡丘", timeStamp: "2小时前",content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！", imgName: "sucai"
        )
    }
}
#endif
