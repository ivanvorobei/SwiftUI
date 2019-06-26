//
//  MainView.swift
//  WWDCPlayer
//
//  Created by ms on 2019/06/05.
//  Copyright © 2019 daybreak. All rights reserved.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    
    @EnvironmentObject var userData: UserData
    
    let player = AVPlayer()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottom) {
                    PlayerViewController(video: $userData.currentVideo)
                }
                
                FavoriteToggleView()
                VideoListView()
                }
                .navigationBarTitle(Text(userData.currentVideo.title))
        }
    }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(UserData())
    }
}
#endif

struct FavoriteToggleView: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        Toggle(isOn: $userData.showFavoriteOnly) {
            Text("Favorite Only")
                .foregroundColor(Color.yellow)
            }
            .padding([.leading, .trailing], 20)
    }
}

struct VideoListView : View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            ForEach(allWeekDays) { day in
                Section(header: Text(day.rawValue.uppercased()).fontWeight(.bold)) {
                    ForEach(self.userData.videos.filter { $0.weekDay == day }) { video in
                        if !self.userData.showFavoriteOnly || video.isFavorite {
                            VideoRow(video: video)
                        }
                    }
                }
            }
        }.listStyle(.grouped)
    }
}
