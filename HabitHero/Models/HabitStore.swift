//
//  HabitStore.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import Foundation
import SwiftUI

@MainActor
class HabitStore: ObservableObject {
    @Published var habits: [Habit] = [] {
        didSet {
            saveHabits()
        }
    }

    private let saveKey = "SavedHabits"

    init() {
        loadHabits()
    }

    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }

    func removeHabit(_ habit: Habit) {
        habits.removeAll { $0.id == habit.id }
    }

    private func saveHabits() {
        if let data = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }

    private func loadHabits() {
        guard let data = UserDefaults.standard.data(forKey: saveKey),
              let decoded = try? JSONDecoder().decode([Habit].self, from: data) else {
            return
        }
        habits = decoded
    }
}
