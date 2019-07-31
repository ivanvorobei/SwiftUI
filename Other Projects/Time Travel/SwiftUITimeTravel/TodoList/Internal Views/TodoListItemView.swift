import SwiftUI

struct TodoListItemView : View {
    
    @EnvironmentObject var store: Store<TodoState>
    
    let item: TodoItem

    var body: some View {
        let binding = Binding(
            get: { self.item.isFinished },
            set: { self.store.dispatch(event: .setItemDone(identifier: self.item.id, isDone: $0)) })
        
        return Toggle(isOn: binding) {
            Text(item.title)
        }
    }
}

#if DEBUG
struct TodoListItemView_Previews : PreviewProvider {
    static var previews: some View {
        TodoListItemView(item: TodoItem(id: UUID(), title: "Test", isFinished: false))
    }
}
#endif
