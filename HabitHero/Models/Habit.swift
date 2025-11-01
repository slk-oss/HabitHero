//
//  Habit.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var streak: Int = 0
}
