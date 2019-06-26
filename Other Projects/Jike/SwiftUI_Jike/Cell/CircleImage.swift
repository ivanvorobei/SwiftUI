/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that clips an image to a circle and adds a stroke and shadow.
*/

import SwiftUI

struct CircleImage: View {
    var imgName:String
    var body: some View {
        Image(imgName)
            .clipShape(Circle())
            .overlay(
                
                Circle().stroke(Color.white, lineWidth: 1))
            
            .shadow(radius: 3)
    }
}

struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage(imgName:"meIcon")
    }
}
