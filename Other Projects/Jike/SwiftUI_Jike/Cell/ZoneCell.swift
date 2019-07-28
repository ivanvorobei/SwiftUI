//
//  ZoneCell.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/5.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct ZoneCell : View {
    var imgName:String
    var title:String
    var body: some View {
        VStack{
            Image(imgName)
            Text(title)
            .font(Font.system(size: 10))
            .foregroundColor(Color.gray)
            .frame(alignment: .center)
        }
        
    }
}

#if DEBUG
struct ZoneCell_Previews : PreviewProvider {
    static var previews: some View {
        ZoneCell(imgName: "pokemon", title: "苹果产品爱好者")
    }
}
#endif
