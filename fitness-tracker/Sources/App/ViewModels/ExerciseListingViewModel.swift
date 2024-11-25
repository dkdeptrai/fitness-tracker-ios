//
//  ExerciseListingViewModel.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 25/11/24.
//
import Foundation

class ExerciseListingViewModel: ObservableObject {
  @Published var searchText: String = ""
  @Published var exercises = [Exercise]()

  func fetchSearchResults() {
    print("Fetching search results..." + searchText)
  }
}
