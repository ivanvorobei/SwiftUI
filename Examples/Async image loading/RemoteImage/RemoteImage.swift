//
//  RemoteImage.swift
//  Landmarks
//
//  Created by Callum Trounce on 06/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

@available(iOS 13.0, *)
class RemoteImage: BindableObject {

    var didChange = PassthroughSubject<Image?, Never>()

    typealias PublisherType = PassthroughSubject<Image?, Never>

    var image: Image? = nil {
        didSet {
            guard oldValue != image else { return }
            DispatchQueue.main.async {
                self.didChange.send(self.image!)
            }
        }
    }

    func load(url: URL) -> Self {
        guard image == nil else { return self }
        ImageLoader.shared.load(url: url) { [unowned self] (image) in
            let final = Image.init(image, scale: 1, label: Text(url.lastPathComponent))
            self.image = final
        }
        return self
    }
}
