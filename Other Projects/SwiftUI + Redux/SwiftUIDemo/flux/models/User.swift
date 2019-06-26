//
//  User.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    let id: Int
    var name: String
    var username: String
    let imageName = "person"
}

let sampleData = [User(id: 0, name: "user 1", username: "@user1"),
                  User(id: 1, name: "user 2", username: "@user2")]
