import SwiftUI
import Combine

final class SearchUserViewModel: BindableObject {
    var willChange = PassthroughSubject<SearchUserViewModel, Never>()

    private(set) var users = [User]() {
        didSet {
            willChange.send(self)
        }
    }

    private(set) var userImages = [User: UIImage]() {
        didSet {
            willChange.send(self)
        }
    }

    private var cancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    func search(name: String) {
        guard !name.isEmpty else {
            return users = []
        }

        var urlComponents = URLComponents(string: "https://api.github.com/search/users")!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: name)
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let assign = Subscribers.Assign(object: self, keyPath: \.users)
        cancellable = assign

        URLSession.shared.send(request: request)
            .decode(type: SearchUserResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .receive(subscriber: assign)
    }

    func getImage(for user: User) {
        guard case .none = userImages[user] else {
            return
        }

        let request = URLRequest(url: user.avatar_url)
        URLSession.shared.send(request: request)
            .map { UIImage(data: $0) }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .receive(subscriber: Subscribers.Sink<UIImage?, Never>(receiveCompletion: {_ in}) { [weak self] image in
                self?.userImages[user] = image
            })
    }
}
