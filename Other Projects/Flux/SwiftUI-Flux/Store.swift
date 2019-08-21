import SwiftUI
import Combine

final class Store<State, Action>: ObservableObject {
    typealias Reducer = (State, Action) -> State

    let objectWillChange = PassthroughSubject<State, Never>()

    var state: State {
        lock.lock()
        defer { lock.unlock() }
        return _state
    }

    private let lock = NSLock()
    private let reducer: Reducer
    private var _state: State

    init(initial state: State, reducer: @escaping Reducer) {
        _state = state
        self.reducer = reducer
    }

    func dispatch(action: Action) {
        lock.lock()

        let newState = reducer(_state, action)
        _state = newState

        lock.unlock()

        objectWillChange.send(newState)
    }
}
