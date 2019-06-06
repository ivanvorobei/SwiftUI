/// Conforming types serve as the state of a time travelable application
public protocol StateMachine {
    
    /// Events define things that can happen within your application that change its state.
    ///
    /// This might include things like text editing, button taps, or network responses.
    associatedtype Event
    
    /// Applies an event to the current state.
    mutating func update(with event: Event)
}
