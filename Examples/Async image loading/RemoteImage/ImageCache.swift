//
//  File 2.swift
//  
//
//  Created by Callum Trounce on 05/06/2019.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
class ImageCache {
    
    private let cache = NSCache<NSURL, CGImage>()
    
    private let queue = DispatchQueue.init(label: "cacheQueue", qos: .userInteractive)
    
    func store(image: CGImage, for url: URL) {
        queue.async { [unowned cache] in
            cache.setObject(image, forKey: url as NSURL)
        }
    }
    
    func image(for url: URL) -> CGImage? {
        return cache.object(forKey: url as NSURL)
    }
}
