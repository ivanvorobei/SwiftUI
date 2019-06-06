import SwiftUI

struct CounterView : View {
    enum Action {
        case increment
        case decrement
    }

    @State var store = Store<Int, Action>(initial: 0) { count, action in
        switch action {
        case .increment:
            return count + 1

        case .decrement:
            return max(0, count - 1)
        }
    }

    var body: some View {
        VStack {
            Text("\(store.state)")

            HStack {
                Button(action: { self.store.dispatch(action: .decrement) }) {
                    Text("Decrement")
                }

                Button(action: { self.store.dispatch(action: .increment) }) {
                    Text("Increment")
                }
            }
        }
    }
}
