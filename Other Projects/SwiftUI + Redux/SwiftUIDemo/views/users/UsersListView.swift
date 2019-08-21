//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI

struct UsersListView : View {
    @EnvironmentObject var state: AppState
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addUser) {
                        Text("Add user")
                    }
                    Button(action: targetUpdate) {
                        Text("Update first")
                    }
                }
                Section {
                    ForEach(state.usersState.users) {user in
                        NavigationLink(destination: UserDetailView(userId: user.id)
                            .environmentObject(self.state)) {
                            UserRow(user: user)
                        }
                    }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                }
            }
                .listStyle(GroupedListStyle())
                .navigationBarTitle(Text("Users (\(state.usersState.users.count))"))
                .navigationBarItems(trailing: EditButton())
        }

    }
    
    func addUser() {
        state.dispatch(action: UserActions.addUser)

    }
    
    func targetUpdate() {
        state.dispatch(action: UserActions.testEditFirstUser)
    }
    
    func delete(at offset: IndexSet) {
        state.dispatch(action: UserActions.deleteUser(index: offset.first!))
    }
    
    func move(from: IndexSet, to: Int) {
        state.dispatch(action: UserActions.move(from: from.first!, to: to))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        UsersListView().environmentObject(sampleStore)
    }
}
#endif
