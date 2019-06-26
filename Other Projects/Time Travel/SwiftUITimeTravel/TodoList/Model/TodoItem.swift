import SwiftUI

struct TodoItem: Identifiable {
    var id: UUID
    var title: String
    var isFinished: Bool
}
