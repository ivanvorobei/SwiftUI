//
//  UserRw.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI

struct UserRow : View {
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: user.imageName)

                VStack {
                    Text(user.name)
                    Text(user.username)
                        .foregroundColor(.secondary)
                        .lineLimit(0)
                }
            }
        }
    }
}

#if DEBUG
struct UserRw_Previews : PreviewProvider {
    static var previews: some View {
        UserRow(user: sampleData[0])
    }
}
#endif
