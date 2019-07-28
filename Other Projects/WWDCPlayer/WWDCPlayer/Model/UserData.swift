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
    let willChange = PassthroughSubject<UserData, Never>()
    
    var showFavoriteOnly = false {
        didSet {
            willChange.send(self)
        }
    }
    
    var videos = videoList {
        didSet {
            willChange.send(self)
        }
    }
    
    var currentVideo = videoList[0] {
        didSet {
            willChange.send(self)
        }
    }
}
