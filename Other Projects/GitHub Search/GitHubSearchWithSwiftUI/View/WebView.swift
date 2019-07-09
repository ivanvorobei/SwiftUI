//
//  WebView.swift
//  GitHubSearchWithSwiftUI
//
//  Created by marty-suzuki on 2019/06/11.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import SafariServices
import SwiftUI

struct WebView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<WebView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<WebView>) {}
}
