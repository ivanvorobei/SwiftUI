//
//  AnySubscription.swift
//  GitHubSearchWithSwiftUI
//
//  Created by John Holdsworth on 09/07/2019.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import Combine

/// - seealso: https://twitter.com/peres/status/1135970931153821696
final class AnySubscription: Subscription {

    private let cancellable: AnyCancellable

    init(_ cancel: @escaping () -> Void) {
        self.cancellable = AnyCancellable(cancel)
    }

    func request(_ demand: Subscribers.Demand) {}

    func cancel() {
        cancellable.cancel()
    }
}
