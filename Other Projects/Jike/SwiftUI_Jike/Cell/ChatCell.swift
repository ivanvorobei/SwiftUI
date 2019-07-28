//
//  ChatCell.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/5.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct ChatCell : View {
    var imageName:String
    var title:String
    var subTitle:String
    var body: some View {
            HStack(alignment: .center){
                CircleImage(imgName:imageName)
                VStack(alignment: .leading){
                    Text(title)
                    .bold()
                    .padding(.top, 4)
                    Text(subTitle)
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 8)
                }
                Spacer()
            }
            .padding(.horizontal, 15)
            .frame(height: 60)
        }
    
}

#if DEBUG
struct ChatCell_Previews : PreviewProvider {
    static var previews: some View {
        ChatCell(imageName: "chat_box",title: "一条虫",subTitle: "瓦恁出来挨打")
    }
}
#endif
