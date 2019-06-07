import UIKit
import PlaygroundSupport
import SwiftUI

var colors: [Color] = [.red, .blue, .black, .gray, .green, .yellow, .orange, .pink, .purple]

struct SymbolRow: View {
    var symbol: String
    
    var body: some View {
        HStack {
            Image(systemName: symbol).foregroundColor(colors.randomElement())
            Divider()
            Text(symbol)
        }
    }
}

struct SymbolDetail: View {
    var symbol: String
    
    var body: some View {
        VStack {
            Image(systemName: symbol)
                .foregroundColor(colors.randomElement())
                .imageScale(.large)
                .scaleEffect(3.0)
                .padding(.bottom, 100)
            Divider()
//                .animation(Animation.basic().delay(0.25))
            Text(symbol).font(.headline)
        }
    }
}

struct ContentView: View {

    var body: some View {
        let list = (0..<symbols.count)
        
        return NavigationView {
            List(list) { index in
                NavigationButton(destination: SymbolDetail(symbol: symbols[index])) {
                    SymbolRow(symbol: symbols[index])
                }
            }
        }.navigationBarTitle(Text("SF Symbols"))
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

let contentView = ContentView()
PlaygroundPage.current.liveView = UIHostingController(rootView: contentView)
