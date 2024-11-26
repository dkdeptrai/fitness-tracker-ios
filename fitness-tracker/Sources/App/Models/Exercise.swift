//
//  Exercise.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 22/10/24.
//

struct Exercise: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let createdByUser: Bool
    let muscleGroups: [MuscleGroup]
    let exerciseCategory: ExerciseCategory
    
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case createdByUser = "created_by_user"
        case muscleGroups = "muscle_groups"
        case exerciseCategory = "exercise_category"
    }
}
