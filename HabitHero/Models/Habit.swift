//
//  Habit.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var streak: Int
    var lastUpdated: Date

    init(id: UUID = UUID(),
         title: String,
         streak: Int = 0,
         lastUpdated: Date = Date()) {
        self.id = id
        self.title = title
        self.streak = streak
        self.lastUpdated = lastUpdated
    }

    mutating func incrementStreak() {
        streak += 1
        lastUpdated = Date()
    }
}
