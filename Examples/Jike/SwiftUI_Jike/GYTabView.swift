//
//  GYTabView.swift
//  SegmentDemo
//
//  Created by alexyang on 2019/6/6.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct GYTabView<Page: View>: View {
    var titles:[String]
    var imgs:[String]
    var imgSels:[String]
    var viewControllers: [UIHostingController<Page>]
    
    init(_ views: [Page], titles: [String], images:[String], imageSels:[String]) {
        
        let vc0 = UIHostingController(rootView: HomeView())
        let vc1 = UIHostingController(rootView: ActivityView())
        let vc2 = UIHostingController(rootView: ChatView())
        let vc3 = UIHostingController(rootView: SettingView())
        self.viewControllers = [vc0,vc1,vc2,vc3] as! [UIHostingController<Page>]
        self.titles = titles
        self.imgs = images
        self.imgSels = imageSels
    }

    
    var body: some View {
        
        GYTabBarViewController(titles: titles, imgs: imgs, imgSels: imgSels, controllers: viewControllers)
    }
}

#if DEBUG
struct GYTabView_Previews : PreviewProvider {
    static var previews: some View {
        GYTabView([Text("haha"),Text("hah1"),Text("haa")],
                  titles: ["tab1","tab2","tab3"],
                  images: ["tab_home_normal","tab_chat_normal","tab_me_normal"],
                  imageSels: ["tab_home_select","tab_chat_select","tab_me_select"])
    }
}
#endif
