//
//  ContentView.swift
//  SwiftUI-BasicAnimation
//
//  Created by Meng To on 2019-06-06.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        
        VStack {
            Text("Learning SwiftUI")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(4)
//                .animation(.basic(duration: 0.3, curve: .easeOut))
            
            Image("ui")
                .frame(width: show ? 414 : 300, height: show ? 600 : 300)
                .clipped()
                .cornerRadius(show ? 0 : 30)
                .shadow(radius: 30)
                .blur(radius: show ? 0 : 30)
                .animation(.spring())
                .aspectRatio(contentMode: .fill)
            
            Text("A course focused on UI")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .padding(4)
//                .animation(.basic(duration: 0.4, curve: .easeIn))
            
            Button(action: {
                withAnimation {
                    self.show.toggle()
                }
            }) {
                Text("Animate")
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .colorScheme(.dark)
    }
}
#endif
