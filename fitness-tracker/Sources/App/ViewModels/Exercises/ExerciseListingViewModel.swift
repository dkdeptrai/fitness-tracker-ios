//
//  ExerciseListingViewModel.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 25/11/24.
//
import Foundation

class ExerciseListingViewModel: BaseViewModel {
  @Published var searchText: String = ""
  @Published var exercises = [Exercise]()
  @Published var isLoading: Bool = false

  private let apiService: ApiDataService<Exercise>

  override init() {
    self.apiService = ApiDataService(baseUrl: Config.apiBaseUrl)
  }

  @MainActor
  func fetchSearchResults() async {
    isLoading = true
    defer { isLoading = false }
    do {
      let fetchedExercises = try await apiService.fetchData(for: "exercises")
      self.exercises = fetchedExercises
    } catch {
      self.handleError(error)
    }
  }
}
