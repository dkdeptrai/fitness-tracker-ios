//
//  ExerciseRowView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 26/11/24.
//

import Foundation
import SwiftUI

struct ExerciseRowView: View {
  var exercise: Exercise

  var body: some View {
    HStack {
      Text(exercise.name)
        .font(.headline)
        .padding(.vertical, 4)
      Spacer()
    }
    .background(Color.green.opacity(0.1))
    .overlay(
      Rectangle()
        .frame(height: 1)
        .foregroundColor(Color.green.opacity(0.5)),
      alignment: .bottom
    )
    
  }
}

#Preview {
  ExerciseRowView(
    exercise: Exercise(
      id: 1, name: "Bench Press",
      description:
        "The bench press is a compound exercise that builds strength and muscle in the chest, triceps, and shoulders.",
      createdByUser: true, muscleGroups: [MuscleGroup(id: 1, name: "Chest")],
      exerciseCategory: ExerciseCategory(id: 1, name: "Strength")))
}
