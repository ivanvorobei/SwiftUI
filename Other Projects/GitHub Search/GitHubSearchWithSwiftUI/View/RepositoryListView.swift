//
//  RepositoryListView.swift
//  GitHubSearchWithSwiftUI
//
//  Created by marty-suzuki on 2019/06/05.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import SwiftUI

struct RepositoryListView : View {

    @ObservedObject
    private(set) var viewModel: RepositoryListViewModel

    var body: some View {

        NavigationView {

            VStack {
            HStack {

                TextField("Search repositories...", text: $viewModel.text,
                          onCommit: { self.viewModel.search() })
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 2))

                Button(action: { self.viewModel.search() }) {
                    Text("Search")
                }
                .frame(height: 40)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.blue, lineWidth: 2))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
            }

            List {

                viewModel.errorMessage.map(Text.init)?
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)

                ForEach(viewModel.repositories, id: \.id) { repository in

                    NavigationLink(destination:
                        WebView(url: repository.htmlUrl)
                            .navigationBarTitle(Text(repository.fullName))
                    ) {

                        RepositoryView(repository: repository)
                    }
                }
            }
            }
            .navigationBarTitle(Text("Search🔍"))
        }
    }
}
