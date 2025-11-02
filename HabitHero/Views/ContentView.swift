//
//  ContentView.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = HabitStore()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.habits) { habit in
                    HStack {
                        Text(habit.title)
                        Spacer()
                        Text("🔥 \(habit.streak)")
                            .foregroundColor(.orange)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        store.incrementStreak(for: habit)
                    }
                }
                .onDelete(perform: store.deleteHabit)
            }
            .navigationTitle("HabitHero")
            .toolbar {
                Button(action: { showingAddHabit.toggle() }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(store: store)
            }
        }
    }
}

