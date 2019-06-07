//
//  InstaPhoto.swift
//  Instagram-SWUI
//
//  Created by Steven Lee on 6/4/19.
//  Copyright © 2019 leavenstee llc. All rights reserved.
//

import Foundation
import SwiftUI

struct InstaPhoto: Identifiable {
    let id: Int
    let username: String
    let comments: [String]
    let likes: Int
    let image: String
}
