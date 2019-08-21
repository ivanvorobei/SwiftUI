import SwiftUI
import Combine

public final class Store<StateType>: ObservableObject where StateType: StateMachine {
    
    private let initialState: StateType
    private var subsequentStates: [StateType] = []

    public let objectWillChange = PassthroughSubject<Void, Never>()
    
    public init(state: StateType) {
        initialState = state
    }
    
    var allStates: [StateType] {
        [[initialState], subsequentStates].flatMap({ $0 })
    }
    
    var stateCount: Int {
        1 + subsequentStates.count
    }
    
    var currentStateIndex: Int = 0 {
        didSet {
            withAnimation {
                objectWillChange.send(())
            }
        }
    }
    
    /// The current state of the store. This will update as time traveling occurs.
    public var state: StateType {
        allStates[currentStateIndex]
    }
    
    /// Dispatches an event to be applied to the current state.
    public func dispatch(event: StateType.Event) {
        var newState = state
        newState.update(with: event)
        subsequentStates.append(newState)
        currentStateIndex = stateCount - 1
    }
    
}
