//
//  HabitStore.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import SwiftUI
import Foundation

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
    
    func addHabit(title: String) {
        let newHabit = Habit(title: title, streak: 0, lastUpdated: Date())
        habits.append(newHabit)
    }
    
    func deleteHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }
    
    func incrementStreak(for habit: Habit) {
        if let index = habits.firstIndex(of: habit) {
            habits[index].incrementStreak()
        }
    }
    
    private func saveHabits() {
        if let data = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }
    
    private func loadHabits() {
        guard let data = UserDefaults.standard.data(forKey: saveKey),
              let decoded = try? JSONDecoder().decode([Habit].self, from: data) else { return }
        habits = decoded
    }
}

