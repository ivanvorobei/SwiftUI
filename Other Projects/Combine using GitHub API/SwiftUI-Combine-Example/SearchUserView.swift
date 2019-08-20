import SwiftUI

struct SearchUserView: View {
    @EnvironmentObject var viewModel: SearchUserViewModel
    @State var text = "ra1028"

    var body: some View {
        NavigationView {
            VStack {
                SearchUserBar(text: $text) {
                    self.viewModel.search(name: self.text)
                }

                List(viewModel.users) { user in
                    SearchUserRow(user: user)
                        .onTapGesture { print(user) }
                }
                }
                .navigationBarTitle(Text("Users"))
        }
    }
}
