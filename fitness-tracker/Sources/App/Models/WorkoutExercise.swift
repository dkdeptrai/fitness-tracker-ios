//
//  WorkoutExercise.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 27/11/24.
//

struct WorkoutExercise: Codable, Identifiable {
  let id: Int
  var exercise: Exercise
  var sets: [Set]

  enum CodingKeys: String, CodingKey {
    case id
    case exercise
    case sets
  }
}
