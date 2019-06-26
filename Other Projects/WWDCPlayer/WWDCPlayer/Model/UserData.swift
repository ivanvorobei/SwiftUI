//
//  UserData.swift
//  WWDCPlayer
//
//  Created by sohee on 2019/06/06.
//  Copyright © 2019 daybreak. All rights reserved.
//
import SwiftUI
import Combine

final class UserData: BindableObject  {
    let didChange = PassthroughSubject<UserData, Never>()
    
    var showFavoriteOnly = false {
        didSet {
            didChange.send(self)
        }
    }
    
    var videos = videoList {
        didSet {
            didChange.send(self)
        }
    }
    
    var currentVideo = videoList[0] {
        didSet {
            didChange.send(self)
        }
    }
}
