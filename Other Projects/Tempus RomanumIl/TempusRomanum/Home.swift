//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct Home : View {
    var body: some View {
        VStack {
            Text("Hello World")
            ClockView()
        }
    }
}

#if DEBUG
struct Home_Previews : PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
