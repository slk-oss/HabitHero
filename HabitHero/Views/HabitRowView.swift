//
//  HabitRowView .swift
//  HabitHero
//
//  Created by Сулейман Курбанов on 17.11.2025.
//

import SwiftUI

struct HabitRowView: View {
    let habit: Habit

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(habit.title)
                    .font(.headline)

                Text("Последнее обновление: \(formattedDate)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text("🔥 \(habit.streak)")
                .font(.title3.weight(.semibold))
                .minimumScaleFactor(0.7)
        }
        .padding(.vertical, 4)
    }

    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: habit.lastUpdated)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HabitRowView(
        habit: Habit(title: "Читать 10 минут")
    )
    .padding()
}
