/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

final class UserData: ObservableObject {
    let objectWillChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            objectWillChange.send(self)
        }
    }

    var landmarks = landmarkData {
        didSet {
            objectWillChange.send(self)
        }
    }
}
