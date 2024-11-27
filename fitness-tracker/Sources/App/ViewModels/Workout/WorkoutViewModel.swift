//
//  WorkoutViewModel.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 27/11/24.
//

import Foundation

class WorkoutViewModel: BaseViewModel {
  @Published var workout: Workout?
  @Published var workoutExercises: [WorkoutExercise] = []
  @Published var isLoading: Bool = false
  
  private let apiService: ApiDataService<Workout>
  
  override init() {
    self.apiService = ApiDataService(baseUrl: Config.apiBaseUrl)
  }
  
  func createNewWorkout(name: String, profile_id: Int) {
    
    
  }
  
  func fetchCurrentWorkout() async {
    isLoading = true
    defer { isLoading = false }
    do {
      let fetchedWorkout = try await apiService.fetchData(byId: Int, for: "workouts")
    } catch {
      self.handleError(error)
    }
  }
}
