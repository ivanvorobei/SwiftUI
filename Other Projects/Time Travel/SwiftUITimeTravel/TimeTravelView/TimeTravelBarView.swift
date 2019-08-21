import SwiftUI

struct TimeTravelBarView : View {
    
    @EnvironmentObject var store: Store<TodoState>
    
    var body: some View {
        let indexBinding = Binding(
            get: { Double(self.store.currentStateIndex) },
            set: { self.store.currentStateIndex = Int($0) })

        return Slider(value: indexBinding, in: 0...Double(store.stateCount-1))
            .background(Color.white)
            .frame(height: 44.0, alignment: .bottom)
            .padding()
    }
}

#if DEBUG
struct TimeTravelBarView_Previews : PreviewProvider {
    static var previews: some View {
        TimeTravelBarView()
    }
}
#endif
