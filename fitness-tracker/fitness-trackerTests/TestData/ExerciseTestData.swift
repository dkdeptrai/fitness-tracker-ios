//
//  ExerciseTestData.swift
//  fitness-trackerTests
//
//  Created by Đình Khoa Nguyễn on 23/10/24.
//

extension Exercise {
    static let mockMuscleGroups = [
        MuscleGroup(id: 1, name: "Chest"),
        MuscleGroup(id: 2, name: "Back"),
        MuscleGroup(id: 3, name: "Legs"),
        MuscleGroup(id: 4, name: "Shoulders"),
        MuscleGroup(id: 5, name: "Arms"),
        MuscleGroup(id: 6, name: "Core")
    ]
    static let mockExerciseCategories = [
        ExerciseCategory(id: 1, name: "Strength"),
        ExerciseCategory(id: 2, name: "Endurance"),
        ExerciseCategory(id: 3, name: "Flexibility")
    ]
    static let mockData = Exercise(id: 1, name: "Bench Press", description: "A compound exercise that primarily targets the chest", createdByUser: false, muscleGroups: mockMuscleGroups, exerciseCategories: mockExerciseCategories)
    
    static let mockSearchResponse = ExerciseSearchResponse(
        results: [mockData],
        totalCount: 1
    )
}
