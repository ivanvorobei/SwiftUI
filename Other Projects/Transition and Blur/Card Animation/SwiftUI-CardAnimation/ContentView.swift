//
//  ContentView.swift
//  SwiftUI-CardAnimation
//
//  Created by Meng To on 2019-06-06.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var show = false
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.show.toggle()
            }
        }) {
            VStack() {
                Text("Learn SwiftUI")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(.top, show ? 100 : 20)
                
                Text("A course on UI and animations")
                    .foregroundColor(Color(hue: 0.567, saturation: 0.158, brightness: 0.943))
                    .lineLimit(-1)
                
                Spacer()
                
                Text("Card Animation")
                    .foregroundColor(Color(hue: 0.498, saturation: 0.609, brightness: 1.0))
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.bottom, show ? 100 : 20)
                }
                .padding()
                .frame(width: show ? 414 : 300, height: show ? 950 : 300)
                .background(Color.blue)
            }
            .cornerRadius(30)
            .animation(.spring())
            .shadow(radius: 30)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
