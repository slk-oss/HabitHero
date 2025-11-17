//
//  AddHabitView.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var store: HabitStore

    @State private var title: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section("Название привычки") {
                    TextField("Например: Читать 10 минут", text: $title)
                        .textInputAutocapitalization(.sentences)
                }
            }
            .navigationTitle("Новая привычка")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена", role: .cancel) {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Сохранить") {
                        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !trimmedTitle.isEmpty else { return }

                        store.addHabit(title: trimmedTitle)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddHabitView()
        .environmentObject(HabitStore())
}

