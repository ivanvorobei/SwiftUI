//
//  TaskItemView.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import SwiftUI

struct TaskItemView: View {
  @EnvironmentObject var userData: UserData

  let task: Task
  @Binding var isEditing: Bool

  var body: some View {
    return HStack {
      if self.isEditing {
        Image(systemName: "minus.circle")
          .foregroundColor(.red)
          .tapAction(count: 1) {
            self.delete()
          }
        NavigationButton(destination: TaskEditView(task: task).environmentObject(self.userData)) {
          Text(task.title)
        }
      } else {
        Button(action: { self.toggleDone() }) {
          Text(self.task.title)
        }
        Spacer()
        if task.isDone {
          Image(systemName: "checkmark").foregroundColor(.green)
        }
      }
    }
  }

  private func toggleDone() {
    guard !self.isEditing else { return }
    guard let index = self.userData.tasks.firstIndex(where: { $0.id == self.task.id }) else { return }
    self.userData.tasks[index].isDone.toggle()
  }

  private func delete() {
    self.userData.tasks.removeAll(where: { $0.id == self.task.id })
    if self.userData.tasks.isEmpty {
      self.isEditing = false
    }
  }
}
