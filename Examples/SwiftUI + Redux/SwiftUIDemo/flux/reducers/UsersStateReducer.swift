//
//  UsersStateReducer.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 05/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import Foundation

struct UserStateReducer: Reducer {    
    func reduce(state: UsersState, action: Action) -> UsersState {
        var state = state
        switch action {
        case UserActions.addUser:
            state.users.append(User(id: state.users.count,
                                    name: "New user \(state.users.count + 1)",
                                    username: "@newuser\(state.users.count + 1)"))
        case let UserActions.deleteUser(index):
            state.users.remove(at: index)
        case let UserActions.move(from, to):
            let user = state.users.remove(at: from)
            state.users.insert(user, at: to)
        case let UserActions.editUser(id, name, username):
            var user = state.users[id]
            user.name = name
            user.username = username
            state.users[id] = user
        case UserActions.testEditFirstUser:
            if !state.users.isEmpty {
                state.users[0] = User(id: 0, name: "user1", username: "u\ns\ne\nr\nn\na\nm\ne")
            }
        case UserActions.startEditUser:
            state.isEditingUser = true
        case UserActions.stopEditUser:
            state.isEditingUser = false
        default:
            break
        }
        return state
    }
}
