import SwiftUI

struct ContentView : View {
    var body: some View {
        TimeTravelView(initialState: TodoState()) {
            TodoListView()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
