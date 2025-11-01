//
//  ContentView.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var habitStore: HabitStore
    @State private var showingAddHabit = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(habitStore.habits) { habit in
                    VStack(alignment: .leading) {
                        Text(habit.title)
                            .font(.headline)
                        Text(habit.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("HabitHero")
            .toolbar {
                Button(action: { showingAddHabit = true }) {
                    Label("Add", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView()
                    .environmentObject(habitStore)
            }
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        offsets.map { habitStore.habits[$0] }.forEach(habitStore.removeHabit)
    }
}
