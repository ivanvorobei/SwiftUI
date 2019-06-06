import SwiftUI

public struct TimeTravelView<StateType, Content>: View where StateType: StateMachine, Content: View {
    
    let initialState: StateType
    
    private let content: Content
    
    @State var store: Store<StateType>? = nil
    
    public init(initialState: StateType, content: () -> Content) {
        self.initialState = initialState
        self.content = content()
    }
    
    public var body: some View {
        
        let store = self.store ?? Store(state: initialState)
        if (self.store == nil) {
            self.store = store
        }

        return VStack {
            content
            TimeTravelBarView()
        }
        .environmentObject(store)
    }
}

#if DEBUG
struct TimeTravelView_Previews : PreviewProvider {
    static var previews: some View {
        TimeTravelView(initialState: TodoState()) {
            TodoListView()
        }
    }
}
#endif
