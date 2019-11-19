import SwiftUI

struct SearchUserRow: View {
    @EnvironmentObject var viewModel: SearchUserViewModel
    @State var user: User

    var body: some View {
        HStack {
            self.viewModel.userImages[user].map { image in
                Image(uiImage: image)
                .resizable()
                    .frame(width: 44, height: 44)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            }

            Text(user.login)
                .font(Font.system(size: 18).bold())

            Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .frame(height: 60)
            .onAppear { self.viewModel.getImage(for: self.user) }
    }
}
