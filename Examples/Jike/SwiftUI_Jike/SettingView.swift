//
//  SettingView.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/5.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct SettingView : View {
    var body: some View {
        VStack{
            VStack{
                Color(red: 1.0, green: 228.0/255.0, blue: 20.0/255)
            }
            .frame(height: 50)
            .edgesIgnoringSafeArea(.top)
            VStack{
                HStack{
                    Spacer()
                    Image("setting_icon")
                    .padding(.horizontal, 15)
                    .padding(.vertical, 15)
                }
                Spacer()
            }
            .frame(height: 100)
            .background(Color(red: 1.0, green: 228.0/255.0, blue: 20.0/255)
                )
            .padding(.top, -70)
            
            VStack{
                HStack(alignment: .center){
                    CircleImage(imgName:"meIcon")
                    .padding(.horizontal, 15)
                    VStack(alignment: .leading){
                        Text("瓦恁")
                        HStack{
                            Image("touxiang")
                            Text("99999")
                        }
                    }
                    .padding(.horizontal, -10)
                    Spacer()
                }
                .frame(height: 100)
                .background(Color.white
                    .cornerRadius(10, antialiased: true))
                .shadow(radius: 5)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                
                Group() {
                    SettingCell(imageName: "setting_quanzi", title: "我的圈子")
                    SettingCell(imageName: "setting_shoucang", title: "我的收藏")
                    SettingCell(imageName: "setting_tongzhi", title: "我的通知")
                    SettingCell(imageName: "setting_feedback", title: "帮助与反馈")
                    HStack{
                        Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255)
                    }
                        .frame(height: 3.0)
                    SettingCell(imageName: "setting_mainliuliang", title: "免流量")
                    SettingCell(imageName: "setting_hehuoren", title: "即刻合伙人")
                }
                .background(Color.white)
                .padding(.bottom, -7)
                Spacer()
                }
                .padding(.top, -60)
        }
        //.edgesIgnoringSafeArea(.top)
        .background(Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255))
    }
    
    
}

#if DEBUG
struct SettingView_Previews : PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
#endif
