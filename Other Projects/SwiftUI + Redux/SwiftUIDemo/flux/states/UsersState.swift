//
//  UsersStore.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct UsersState: FluxState {
    var users: [User]
    var isEditingUser = false
    
    init(users: [User] = []) {
        self.users = users
    }
}
