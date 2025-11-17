//
//  ContentView.swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 01.11.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: HabitStore
    @State private var showingAddHabit = false

    var body: some View {
        NavigationView {
            Group {
                if store.habits.isEmpty {
                    VStack(spacing: 12) {
                        Text("Добро пожаловать в HabitHero!")
                            .font(.title2)
                            .multilineTextAlignment(.center)

                        Text("Нажми на кнопку «+», чтобы добавить свою первую привычку.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                } else {
                    List {
                        ForEach(store.habits) { habit in
                            HabitRowView(habit: habit)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.25,
                                                          dampingFraction: 0.7)) {
                                        store.incrementStreak(for: habit)
                                    }
                                }
                        }
                        .onDelete(perform: store.deleteHabit)
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("HabitHero")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddHabit = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView()
                    .environmentObject(store)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(HabitStore())
}
