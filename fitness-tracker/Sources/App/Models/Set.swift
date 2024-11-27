//
//  WorkoutSet.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 22/10/24.
//

struct Set: Codable, Identifiable {
    let id: Int
    let exerciseId: Int
    var reps: Int
    var weight: Float
    
    enum CodingKeys: String, CodingKey {
        case id
        case exerciseId = "exercise_id"
        case reps, weight
    }
}
