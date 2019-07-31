import SwiftUI

struct TodoListView : View {
    
    @EnvironmentObject var store: Store<TodoState>
    
    var body: some View {
        ZStack {
            NavigationView {
                List(store.state.todoItems) { item in TodoListItemView(item: item) }
                    .navigationBarTitle(Text("Todo List"))
                    .navigationBarItems(trailing: Button(action: {
                        withAnimation {
                            self.store.dispatch(event: .startCreatingItem)
                        }
                    }, label: { Image(systemName: "plus.circle") })) }
            
            if store.state.isCreatingItem {
                
                ModalDimmingView()
                
                VStack {
                    Spacer()
                    AddItemView()
//                        .relativeWidth(1.0)
                        .background(Color.white)
                        .cornerRadius(12.0)
                        .shadow(radius: 16.0)
                        .padding()
                    Spacer()
                }
                .transition(.move(edge: .bottom))
            }
        }
    }
}
#if DEBUG
struct TodoListView_Previews : PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
#endif
