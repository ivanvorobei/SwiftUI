/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

final class UserData: BindableObject {
    let willChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            willChange.send(self)
        }
    }

    var landmarks = landmarkData {
        didSet {
            willChange.send(self)
        }
    }
}
