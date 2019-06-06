import Combine

final class AnySubscription: Subscription {
    private let cancellable: Cancellable

    init(_ cancel: @escaping () -> Void) {
        cancellable = AnyCancellable(cancel)
    }

    func request(_ demand: Subscribers.Demand) {}

    func cancel() {
        cancellable.cancel()
    }
}
