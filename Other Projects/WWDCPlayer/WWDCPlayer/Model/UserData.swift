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
    @Published var showFavoriteOnly = false
    
    @Published var videos = videoList
    
    @Published var currentVideo = videoList[0]
}
