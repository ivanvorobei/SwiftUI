//
//  HomeView.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/5.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct HomeView : View {
    let itemId = "关注"
    let segItems: [String] = ["关注", "推荐", "附近", "即刻合伙人"]
    var body: some View {
        VStack{
            VStack{
                VStack{
                    Color(red: 1.0, green: 228.0/255.0, blue: 20.0/255)
                    }
                    .frame(height: 40)
                    .edgesIgnoringSafeArea(.top)
                HStack{
                    HStack{
                        Image("search_icon")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        Text("优衣库KAWS遭疯抢")
                        .font(Font.system(size: 14))
                        .foregroundColor(Color.gray)
                        Spacer()
                        }
                        .background(
                            Color.white
                            .cornerRadius(5)
                        )
                        .frame(height: 50)
                    Image("scan_icon")
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                }
                .padding(.leading, 20)
                .background(Color(red: 1.0, green: 228.0/255.0, blue: 20.0/255))
                .padding(.top, -52)
            }
            
            VStack{
                HStack{
                    Text("我的圈子")
                        .font(Font.system(size: 16))
                        .bold()
                        .padding(.leading, 15)
                    Spacer()
                    Image("righ_arrow")
                    .frame(width: 21, height: 36, alignment: .center)
                    .scaledToFill()
                }
                .frame(height:36)
                CategoryRow(items: zonnData)
            }
            .padding(.top, -10)
            .frame(height: 135)
            HStack{
                Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255)
                    .frame(height: 10.0)
                }
                .padding(.top, -5)
            HStack{
                GYSegmentView(titles: segItems, currentPage: .constant(0))
                .frame(width: 160, alignment: .leading)
                Spacer()
            }
            .padding(.leading, 10)
            
            List{
                HomeCell(zoneName: "人人都爱宝可梦", zoneImgName: "30_Fotor", userIcon: "pokemon", nickName: "皮卡丘", timeStamp: "2小时前",content: "蒜头丘！\n皮卡皮卡₍₍ (̨̡ ‾᷄ᗣ‾᷅ )̧̢ ₎₎", imgName: "kcc"
                )
                HomeCell(zoneName: "人人都爱宝可梦", zoneImgName: "30_Fotor", userIcon: "pokemon", nickName: "皮卡丘", timeStamp: "2小时前",content: "蒜头丘！\n皮卡皮卡₍₍ (̨̡ ‾᷄ᗣ‾᷅ )̧̢ ₎₎", imgName: "kcc"
                )
                HomeCell(zoneName: "人人都爱宝可梦", zoneImgName: "30_Fotor", userIcon: "pokemon", nickName: "皮卡丘", timeStamp: "2小时前",content: "蒜头丘！\n皮卡皮卡₍₍ (̨̡ ‾᷄ᗣ‾᷅ )̧̢ ₎₎", imgName: "kcc"
                )
            }
            .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: -20))
        }
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
