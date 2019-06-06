//
//  ItemResponse.swift
//  GitHubSearchWithSwiftUI
//
//  Created by marty-suzuki on 2019/06/06.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import Foundation

struct ItemResponse<T: Decodable>: Decodable {
    let items: [T]
}
