//
//  HomeCell.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/6.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct HomeCell : View {
    var zoneName:String
    var zoneImgName:String
    var userIcon:String
    var nickName:String
    var timeStamp:String
    var content:String
    var imgName:String
    var body: some View {
        VStack(alignment: .leading){
            VStack(){
                
                HStack{
                    ImageStore.shared.image(name: zoneImgName, size: 60)
                    .cornerRadius(5)
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    VStack(alignment: .leading, spacing: 5){
                        Text(zoneName)
                            .font(Font.system(size: 16))
                            .bold()
                        Text(timeStamp)
                            .font(Font.system(size: 12))
                            .foregroundColor(Color.gray)
                            .padding(.top, 8)
                    }
                    Spacer()
                }
                .background(Color(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0))
                
                VStack(alignment: .leading){
                    Text(content)
                        .font(Font.system(size: 15))
                        .frame(minWidth: 320,minHeight:50, maxHeight: 300, alignment: .leading)
                        .lineLimit(-1)
                    ImageStore.shared.image(name: imgName, size: 200)
                        .padding(.bottom, 10)
                    }
                .padding(.leading, -20)
                
                HStack(alignment: .center){
                    CircleImage(imgName: userIcon)
                        .padding(.leading, 20)
                    Text(nickName)
                        .font(Font.system(size: 14))
                        .bold()
                    Text("发布")
                        .font(Font.system(size: 13))
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                
            }
            Divider()
            .padding(.horizontal,20)
            HStack{
                Image("dianzan")
                Spacer()
                Image("pinglun")
                Spacer()
                Image("share")
                Spacer()
                Image("shenglue")
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255.0)
                .frame(height: CGFloat(1.0))
            }
            .frame(height:450)
    }
}

#if DEBUG
struct HomeCell_Previews : PreviewProvider {
    static var previews: some View {
        HomeCell(zoneName: "人人都爱宝可梦", zoneImgName: "30_Fotor", userIcon: "pokemon", nickName: "皮卡丘", timeStamp: "2小时前",content: "蒜头丘！\n皮卡皮卡₍₍ (̨̡ ‾᷄ᗣ‾᷅ )̧̢ ₎₎", imgName: "kcc"
        )
    }
}
#endif
