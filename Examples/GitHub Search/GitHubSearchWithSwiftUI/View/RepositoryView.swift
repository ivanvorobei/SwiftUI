//
//  RepositoryView.swift
//  GitHubSearchWithSwiftUI
//
//  Created by marty-suzuki on 2019/06/05.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import SwiftUI

struct RepositoryView : View {

    let repository: Repository

    var body: some View {
        
        VStack(alignment: .leading) {

            HStack {
                Image(systemName: "doc.text")
                Text(repository.fullName)
                    .bold()
            }

            // Show text if description exists
            repository.description
                .map(Text.init)?
                .lineLimit(nil)

            HStack {
                Image(systemName: "star")
                Text("\(repository.stargazersCount)")
            }
        }
    }
}
