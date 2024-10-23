//
//  Workout.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 22/10/24.
//

struct Workout: Codable, Identifiable {
    let id: Int
    var name: String
    var beginTime: String
    var endTime: String?
    var duration: Int?
    var calories: Int?
    var workoutSets: [WorkoutSet]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case beginTime = "begin_time"
        case endTime = "end_time"
        case duration, calories
        case workoutSets = "workout_sets"
    }
}
