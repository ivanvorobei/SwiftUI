//
//  UsersAction.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 05/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import Foundation

enum UserActions: Action {
    case addUser
    case deleteUser(index: Int)
    case move(from: Int, to: Int)
    case editUser(id: Int, name: String, username: String)
    case testEditFirstUser
    case startEditUser
    case stopEditUser
}
