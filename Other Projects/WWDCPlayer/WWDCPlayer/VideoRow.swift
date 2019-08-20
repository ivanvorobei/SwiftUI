//
//  VideoRow.swift
//  WWDCPlayer
//
//  Created by sohee on 2019/06/06.
//  Copyright © 2019 daybreak. All rights reserved.
//

import SwiftUI

struct VideoRow : View {
    
    @EnvironmentObject var userData: UserData
    
    var video: Video
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                TitleText(text: video.title)
                HStack {
                    DescriptionText(text: "Session \(video.id)")
                    DescriptionText(text: "·")
                    DescriptionText(text: video.platformString)
                }
            }
            Spacer()
            HStack(spacing: 15) {
                if userData.currentVideo == video {
                    Image(systemName: "music.mic")
                }
                
                Image(systemName: video.isFavorite ? "star.fill" : "star")
                    .foregroundColor(video.isFavorite ? Color.yellow : Color.gray)
                    .onTapGesture {
                        self.setFavorite(video: self.video)
                    }
            }
        }
        .padding([.top, .bottom], 10)
        .onTapGesture {
            self.setCurrentVideo(video: self.video)
        }
    }
    
    func setCurrentVideo(video: Video) {
        guard self.userData.currentVideo != self.video else {
            return
        }
        self.userData.currentVideo = self.video
    }
    
    func setFavorite(video: Video) {
        guard let index = userData.videos.firstIndex (where: { $0 == video }) else {
            return
        }
        self.userData.videos[index].isFavorite.toggle()
    }
}

#if DEBUG
struct VideoRow_Previews : PreviewProvider {
    static var previews: some View {
        VideoRow(video: videoList[0])
            .environmentObject(UserData())
    }
}
#endif

struct TitleText: View {
    let text: String
    var body: some View {
        return Text(text)
            .foregroundColor(.primary)
            .bold()
    }
}

struct DescriptionText : View {
    let text: String
    var body: some View {
        return Text(text)
            .font(.footnote).fontWeight(.semibold)
            .foregroundColor(.secondary)
    }
}
