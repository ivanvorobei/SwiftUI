//
//  ContentView.swift
//  Instagram-SWUI
//
//  Created by Steven Lee on 6/4/19.
//  Copyright © 2019 leavenstee llc. All rights reserved.
//

import SwiftUI
import AVKit
import CoreLocation

struct ContentView : View {
    @State private var isCameraPresented = false
    var instaPhotos: [InstaPhoto]
  
    var body: some View {
        NavigationView {
            List {
                ForEach(instaPhotos, id: \.id) {
                    ImageCell(photo: $0)
                }
            }.navigationBarTitle("WWDC").navigationBarItems(trailing:
                Button(action: {
                    self.isCameraPresented = true
                }) {
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                        .accessibility(label: Text("User Profile"))
                        .padding()
                }
            ).sheet(isPresented: $isCameraPresented,
                    content: { CameraView() })
        }
    }
    
    func takePhoto() {
       // Open Camera
    
    }
  
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(instaPhotos: [InstaPhoto(id: 0, username: "leavenstee", comments: ["Nice", "Cool","Lame"], likes: 100, image: "wwdc"),InstaPhoto(id: 0, username: "leavenstee", comments: ["Nice", "Cool","Lame","Nice", "Cool","Lame"], likes: 200, image: "pizza"),
                                  InstaPhoto(id: 0, username: "leavenstee", comments: ["Nice", "Cool","Lame","Nice", "Cool","Lame","Nice", "Cool","Lame","Nice", "Cool","Lame"], likes: 4440, image: "wwdc"),InstaPhoto(id: 0, username: "leavenstee", comments: ["Nice", "Cool"], likes: 20, image: "badge")])
    }
}
#endif

struct ImageCell : View {
    @State var expanded = false
    @State var liked = false
    
    var photo: InstaPhoto
    
    var body: some View {
        return VStack(alignment: .leading) {
            HStack {
                Image("badge").resizable().scaledToFit().cornerRadius(100)
                Text(photo.username)
                Button(action: {}, label: {
                    Text("...")
                })
            }.frame(height: 40)
            
            Image(photo.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            // Control Buttons
            HStack {
                Button(action: withAnimation { likeButtonPressed }, label: {
                    Text( self.liked ? "❤️" :"💔")
                })
                Button(action: commentButtonPressed, label: {
                    Text("🗣")
                })
                Button(action: likeButtonPressed, label: {
                    Text("📪")
                })
                Spacer()
                Button(action: likeButtonPressed, label: {
                    Text("📕")
                })
            }
            Text("\(photo.likes) Likes")
                .multilineTextAlignment(.leading)
                Text(photo.username)
                    .multilineTextAlignment(.leading)
            Button(action: moreCommentsPressed, label: {
                Text("View All \(photo.comments.count) Comments")
                    .fontWeight(.light)
            })
            if expanded {
                VStack {
                    Text("Test Comment")
                    Text("Test Comment")
                    Text("Test Comment")
                    Text("Test Comment")
                }
            }
        }
    }
    
    func moreCommentsPressed() {
        expanded.toggle()
    }
    
    func likeButtonPressed() {
        liked.toggle()
    }

    func commentButtonPressed() {
       
    }

    func shareButtonPressed() {
    
    }

    func bookMarkButtonPressed() {
    
    }
}
