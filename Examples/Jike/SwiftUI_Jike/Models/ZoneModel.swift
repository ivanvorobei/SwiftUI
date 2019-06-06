/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI

struct ZoneModel: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var category: String

    func image(forSize size: Int) -> Image {
        ImageStore.shared.image(name: imageName, size: size)
    }
}
