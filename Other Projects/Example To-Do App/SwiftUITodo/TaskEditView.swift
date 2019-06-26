//
//  TaskEditView.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import SwiftUI

struct TaskEditView: View {
  @EnvironmentObject var userData: UserData
  private let task: Task
  private var draftTitle: State<String>

  init(task: Task) {
    self.task = task
    self.draftTitle = .init(initialValue: task.title)
  }

  var body: some View {
    let inset = EdgeInsets(top: -8, leading: -10, bottom: -7, trailing: -10)
    return VStack(alignment: .leading, spacing: 0) {
      TextField(
        self.draftTitle.binding,
        placeholder: Text("Enter New Title..."),
        onEditingChanged: { _ in self.updateTask() },
        onCommit: {}
      )
      .background(
        RoundedRectangle(cornerRadius: 5)
          .fill(Color.clear)
          .border(Color(red: 0.7, green: 0.7, blue: 0.7), width: 1 / UIScreen.main.scale, cornerRadius: 5)
          .padding(inset)
      )
      .padding(EdgeInsets(
        top: 15 - inset.top,
        leading: 20 - inset.leading,
        bottom: 15 - inset.bottom,
        trailing: 20 - inset.trailing
      ))

      Spacer()
    }
    .navigationBarTitle(Text("Edit Task 📝"))
  }

  private func updateTask() {
    guard let index = self.userData.tasks.firstIndex(of: self.task) else { return }
    self.userData.tasks[index].title = self.draftTitle.value
  }
}
