//
//  UserDetailView.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI
import Combine

struct UserDetailView : View {
    @EnvironmentObject var state: AppState
    let userId: Int
    
    var editModal: Modal {
        let user = state.usersState.users[userId]
        return Modal(UserEditForm(userId: user.id, saveHandler: { saved in
            self.state.dispatch(action: UserActions.stopEditUser)
        }).environmentObject(state)) {
            self.state.dispatch(action: UserActions.stopEditUser)
        }
    }
    
    var body: some View {
        let user = state.usersState.users[userId]
        return VStack {
            Image(systemName: user.imageName)
            Text(user.name)
            Text(user.username).lineLimit(0)
            }
            .navigationBarTitle(Text(user.name), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.state.dispatch(action: UserActions.startEditUser)
                }) {
                    Text("Edit user")
                    }
                    .presentation(self.state.usersState.isEditingUser ? self.editModal : nil))
    }
}

#if DEBUG
struct UserDetailView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(userId: 0).environmentObject(sampleStore)
        }
    }
}
#endif


