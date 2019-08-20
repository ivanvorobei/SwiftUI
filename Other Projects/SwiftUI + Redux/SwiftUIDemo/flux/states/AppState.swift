//
//  AppStore.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 05/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class AppState: ObservableObject {
    var objectWillChange = PassthroughSubject<AppState, Never>()
    
    var usersState: UsersState
    
    init(usersState: UsersState = UsersState()) {
        self.usersState = usersState
    }
    
    func dispatch(action: Action) {
        usersState = UserStateReducer().reduce(state: usersState, action: action)
        objectWillChange.send(self)
    }
}

let store = AppState()

#if DEBUG
let sampleStore = AppState(usersState: UsersState(users: sampleData))
#endif


