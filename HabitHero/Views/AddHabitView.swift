//
//  AddHabitView.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var store: HabitStore
    @State private var title = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Название привычки", text: $title)
            }
            .navigationTitle("Новая привычка")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Сохранить") {
                        if !title.isEmpty {
                            store.addHabit(title: title)
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}
