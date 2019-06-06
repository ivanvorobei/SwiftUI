//
//  File 2.swift
//  
//
//  Created by Callum Trounce on 05/06/2019.
//

import Foundation
import SwiftUI
import Combine

@available(iOS 13.0, *)
class ImageLoader {
    
    static let shared = ImageLoader()
    
    private let fileManager = FileManager()
    
    private let cache = ImageCache()
    
    private lazy var session = URLSession.init(configuration: .default)
    
    public func load(url: URL, result: @escaping ((CGImage) -> Void)) {
        
        if let cachedImage = cache.image(for: url) {
            result(cachedImage)
            return
        }
        
        let request = session.downloadTask(with: url, completionHandler: { [weak self] (downloadLocation, response, error) in
            self?.handleDownload(response: response!, location: downloadLocation!, result: result)
        })
        
        request.resume()
    }

    func handleDownload(response: URLResponse, location: URL, result: @escaping ((CGImage) -> Void)) {
        guard let url = response.url else { return }
        do {
            let directory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(location.lastPathComponent)
            try fileManager.copyItem(at: location, to: directory)
            
            guard
                let imageSource = CGImageSourceCreateWithURL(directory as NSURL, nil) else {
                    fatalError("couldn't create image source")
            }

            guard let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
                else {
                    fatalError("Couldn't load image \(directory)")
            }
            
            cache.store(image: image, for: url)
            result(image)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
