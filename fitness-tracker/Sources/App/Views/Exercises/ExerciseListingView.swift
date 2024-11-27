//
//  ExerciseListingView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 23/10/24.
//

import SwiftUI

struct ExerciseListingView: View {
  @Environment(\.presentationMode) private var presentationMode
  @StateObject private var viewModel = ExerciseListingViewModel()
  
  var body: some View {
    NavigationStack {
      ScrollView {
        exerciseList()
          .padding(.vertical)
      }
      .overlay(
        LoadingOverlayView(isPresented: $viewModel.isLoading)
      )
      .overlay(
        ErrorDialog(message: $viewModel.errorMessage)
      )
    }
    .navigationTitle("Exercises")
    .searchable(text: $viewModel.searchText, prompt: "Search for exercises")
    .task {
      await viewModel.fetchSearchResults()
    }
  }
  
  func exerciseList() -> some View {
    return LazyVStack(spacing: 0) {
      ForEach(viewModel.exercises) { exercise in
        ExerciseRowView(exercise: exercise)
      }
    }
  }
}

#Preview {
  ExerciseListingView()
}


#Preview {
  ExerciseListingView()
}
