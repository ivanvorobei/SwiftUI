/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a scrollable list of landmarks.
*/

import SwiftUI

struct CategoryRow: View {
    var items: [ZoneModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items, id: \.id) { zone in
                            CategoryItem(zone: zone)
                    }
                }
            }
        }
    }
}

struct CategoryItem: View {
    var zone: ZoneModel
    var body: some View {
        VStack(alignment: .center) {
           
            VStack{
                Color.white
                    .frame(width:65,height:65)
                    .background(RoundedRectangle(cornerRadius: 15).strokeBorder(Color(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0), lineWidth: 3))
                    .cornerRadius(15)
                zone
                    .image(forSize: 55)
                    .renderingMode(.original)
                    .cornerRadius(10)
                    .padding(.top,-68)
                
            }
            Text(zone.name)
                .frame(width: 65, height: 20, alignment: .center)
                .font(Font.system(size: 12))
                .padding(.top, -8)
        }
        .padding(.trailing, -5)
        .padding(.leading, 10)
    }
}

#if DEBUG
struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        
        CategoryRow(items: zonnData)
    }
}
#endif
