import SwiftUI

struct AddItemView: View {
    
    @EnvironmentObject var store: Store<TodoState>
    
    var body: some View {
        
        let textBinding = Binding(
            get: { self.store.state.partialItemName },
            set: { self.store.dispatch(event: .changePartialItemName($0)) })
        
        return VStack(spacing: 16) {
            TextField("Title", text: textBinding)
            Button(action: {
                self.store.dispatch(event: .addItem)
            }) {
                HStack {
                    Spacer()
                    Text("Add").padding([.top, .bottom], 8.0)
                    Spacer()
                }

                }
//                .relativeWidth(1.0)
                .background(Color.accentColor)
                .disabled(store.state.partialItemName.isEmpty)
                .foregroundColor(.white)
                .cornerRadius(8.0)
        }
        .padding()
    }
}
#if DEBUG
struct AddItemView_Previews : PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
#endif
