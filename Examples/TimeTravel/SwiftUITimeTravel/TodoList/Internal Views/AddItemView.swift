import SwiftUI

struct AddItemView: View {
    
    @EnvironmentObject var store: Store<TodoState>
    
    var body: some View {
        
        let textBinding = Binding<String>(
            getValue: { self.store.state.partialItemName },
            setValue: { self.store.dispatch(event: .changePartialItemName($0)) })
        
        return VStack(spacing: 16) {
            TextField(textBinding, placeholder: Text("Title"))
            Button(action: {
                self.store.dispatch(event: .addItem)
            }) {
                HStack {
                    Spacer()
                    Text("Add").padding([.top, .bottom], 8.0)
                    Spacer()
                }

                }
                .relativeWidth(1.0)
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
