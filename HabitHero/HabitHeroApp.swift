//
//  HabitHeroApp.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import SwiftUI

@main
struct HabitHeroApp: App {
    @StateObject private var habitStore = HabitStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(habitStore)
        }
    }
}
