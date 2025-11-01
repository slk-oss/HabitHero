//
//  AddHabitView.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var habitStore: HabitStore
    @State private var title = ""
    @State private var description = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Название привычки", text: $title)
                TextField("Описание", text: $description)
            }
            .navigationTitle("Новая привычка")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Сохранить") {
                        let newHabit = Habit(title: title, description: description)
                        habitStore.addHabit(newHabit)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена") { dismiss() }
                }
            }
        }
    }
}
