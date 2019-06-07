//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct ClockView : View {
    
    @State var showMilitaryTime = false
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        return formatter
    }()
    
    private var militaryDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:MM"
        
        return formatter
    }()
    
    private var timeString: String {
        if showMilitaryTime {
            return militaryDateFormatter.string(from: Date())
        } else {
            return dateFormatter.string(from: Date())
        }
    }
    
    var body: some View {
        VStack {
            Button(action: {
                self.showMilitaryTime.toggle()
            }) {
                Text(self.timeString)
                    .font(.headline)
            }
//
//            Text("quinta hora noctis")
//                .font(.subheadline)
//                .italic()
//                .padding(.top, 10)
        }
    }
    
}

#if DEBUG
struct Clock_Previews : PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
#endif
