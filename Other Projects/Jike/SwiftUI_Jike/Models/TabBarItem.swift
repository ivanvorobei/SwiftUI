//
//  TabBarModel.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/6.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct TabBarItem: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var image: String
    var imageSelect: String
}
