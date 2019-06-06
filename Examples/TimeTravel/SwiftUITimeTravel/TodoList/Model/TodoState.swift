import SwiftUI

struct TodoState {
    var isCreatingItem: Bool = false
    var partialItemName: String = ""
    var todoItems: [TodoItem] = []
}

extension TodoState: StateMachine {
    
    enum Event {
        case startCreatingItem
        case cancelCreatingItem
        case changePartialItemName(String)
        case addItem
        case setItemDone(identifier: UUID, isDone: Bool)
    }
    
    mutating func update(with event: TodoState.Event) {
        switch event {
        case .addItem:
            todoItems.append(TodoItem(id: UUID(), title: partialItemName, isFinished: false))
            partialItemName = ""
            isCreatingItem = false
        case .changePartialItemName(let name):
            partialItemName = name
        case .cancelCreatingItem:
            isCreatingItem = false
        case .startCreatingItem:
            isCreatingItem = true
            partialItemName = ""
        case .setItemDone(let identifier, let isDone):
            if let index = todoItems.firstIndex(where: { $0.id == identifier }) {
                todoItems[index].isFinished = isDone
            }
        }
    }
    
}
