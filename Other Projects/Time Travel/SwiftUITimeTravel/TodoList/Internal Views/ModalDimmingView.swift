import SwiftUI

struct ModalDimmingView : View {
    
    @EnvironmentObject var store: Store<TodoState>
    
    var body: some View {
        Color
            .black
//            .relativeWidth(1.0)
//            .relativeHeight(1.0)
            .opacity(0.3)
            .edgesIgnoringSafeArea([.bottom, .top])
            .transition(.opacity)
            .onTapGesture {
                self.store.dispatch(event: .cancelCreatingItem)
            }
    }
}

#if DEBUG
struct ModalDimmingView_Previews : PreviewProvider {
    static var previews: some View {
        ModalDimmingView()
    }
}
#endif
