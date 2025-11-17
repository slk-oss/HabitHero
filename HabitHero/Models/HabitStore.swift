//
//  HabitStore.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import Foundation

@MainActor
final class HabitStore: ObservableObject {
    @Published var habits: [Habit] = [] {
        didSet {
            saveHabits()
        }
    }

    private let saveKey = "SavedHabits"

    init() {
        loadHabits()
    }

    func addHabit(title: String) {
        let newHabit = Habit(title: title)
        habits.append(newHabit)
    }

    func deleteHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }

    func incrementStreak(for habit: Habit) {
        guard let index = habits.firstIndex(of: habit) else { return }
        var updated = habits[index]
        updated.incrementStreak()
        habits[index] = updated
    }

    // MARK: - Persistence

    private func saveHabits() {
        do {
            let data = try JSONEncoder().encode(habits)
            UserDefaults.standard.set(data, forKey: saveKey)
        } catch {
            print("Failed to save habits: \(error)")
        }
    }

    private func loadHabits() {
        guard let data = UserDefaults.standard.data(forKey: saveKey) else { return }
        do {
            let decoded = try JSONDecoder().decode([Habit].self, from: data)
            habits = decoded
        } catch {
            print("Failed to load habits: \(error)")
        }
    }
}

