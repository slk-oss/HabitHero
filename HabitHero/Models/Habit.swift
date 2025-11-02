//
//  Habit.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var streak: Int
    var lastUpdated: Date
    
    mutating func incrementStreak() {
        streak += 1
        lastUpdated = Date()
    }
}

