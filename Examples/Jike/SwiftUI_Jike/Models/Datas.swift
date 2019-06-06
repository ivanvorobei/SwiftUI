//
//  Datas.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/5.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

let tabItems: [TabBarItem] = getTabItems()

func getTabItems() -> [TabBarItem] {
    
    var items = [TabBarItem]()
    let item0 = TabBarItem(id: 0, title: "首页", image: "tab_home_normal", imageSelect: "tab_home_select")
    items.append(item0)
    let item1 = TabBarItem(id: 1, title: "动态", image: "tab_status_normal", imageSelect: "tab_status_select")
    items.append(item1)
    let item2 = TabBarItem(id: 2, title: "聊天", image: "tab_chat_normal", imageSelect: "tab_chat_select")
    items.append(item2)
    let item3 = TabBarItem(id: 3, title: "我的", image: "tab_me_normal", imageSelect: "tab_me_select")
    items.append(item3)
    
    return items
}
