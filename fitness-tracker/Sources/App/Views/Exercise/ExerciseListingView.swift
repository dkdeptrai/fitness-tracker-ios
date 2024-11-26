//
//  ExerciseListingView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 23/10/24.
//

import SwiftUI

struct ExerciseListingView: View {
  @StateObject private var viewModel = ExerciseListingViewModel()

  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack {
          ForEach(viewModel.exercises) { exercise in
            NavigationLink(destination: ExerciseRowView(exercise: exercise)) {
              ExerciseRowView(exercise: exercise)
            }
          }
        }
      }
      .padding(.horizontal)
      .toolbar {
        ToolbarItem(placement: .principal) {
          HStack {
            TextField("Search for exercises", text: $viewModel.searchText)
              .textFieldStyle(RoundedBorderTextFieldStyle())

            Button {
              Task {
                await viewModel.fetchSearchResults()
                print(viewModel.exercises)
              }
            } label: {
              Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            }
          }
        }
      }
    }
    .overlay(
      Group {
        if viewModel.isLoading {
          ProgressView("Loading...")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.5))
        }
      }
    )
    .overlay(
      ErrorDialog(message: $viewModel.errorMessage)
    )
  }
}

#Preview {
  ExerciseListingView()
}
