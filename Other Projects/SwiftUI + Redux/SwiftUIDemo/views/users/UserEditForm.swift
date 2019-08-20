 //
 //  UserEditForm.swift
 //  SwiftUIDemo
 //
 //  Created by Thomas Ricouard on 05/06/2019.
 //  Copyright © 2019 Thomas Ricouarf. All rights reserved.
 //
 
 import SwiftUI
 
 struct UserEditForm : View {
    @EnvironmentObject var state: AppState
    
    let userId: Int
    let saveHandler: ((Bool) -> Swift.Void)?
    
    @State var newUserName = ""
    @State var newUserUsername = ""
    @State var showSaved = false
    @State var showError = false
    
    var body: some View {
        let user = state.usersState.users[userId]
        return NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("User name")
                TextField("New name", text: $newUserName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Divider()
                Text("Username")
                TextField("New username", text: $newUserUsername)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(16)
            Button(action: save) {
                Text("Save")
                    .padding(8)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(8)
                }
                .navigationBarItems(trailing: Button(action: close) {
                    Text("Close")
                })
                .navigationBarTitle(Text("Edit \(user.name)"), displayMode: .inline)

            Badge(text: "Saved successfully", color: .green, show: $showSaved)
            Badge(text: "Missing username or name", color: .red, show: $showError)
        }
    }
    
    func save() {
        guard !newUserName.isEmpty && !newUserUsername.isEmpty else {
            withAnimation{
                showError = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.showError = false
            }
            return
        }
        
        withAnimation {
            showSaved = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showSaved = false
        }
        
        state.dispatch(action: UserActions.editUser(id: userId, name: newUserName, username: newUserUsername))
        saveHandler?(true)
    }
    
    func close() {
        saveHandler?(false)
    }
 }
 
 #if DEBUG
 struct UserEditForm_Previews : PreviewProvider {
    static var previews: some View {
        UserEditForm(userId: 0, saveHandler: nil).environmentObject(sampleStore)
    }
 }
 #endif
 
 

