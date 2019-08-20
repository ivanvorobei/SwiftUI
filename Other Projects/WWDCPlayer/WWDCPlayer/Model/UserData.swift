//
//  UserData.swift
//  WWDCPlayer
//
//  Created by sohee on 2019/06/06.
//  Copyright © 2019 daybreak. All rights reserved.
//
import SwiftUI
import Combine

final class UserData: ObservableObject  {
    let objectWillChange = PassthroughSubject<UserData, Never>()
    
    var showFavoriteOnly = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var videos = videoList {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var currentVideo = videoList[0] {
        didSet {
            objectWillChange.send(self)
        }
    }
}
