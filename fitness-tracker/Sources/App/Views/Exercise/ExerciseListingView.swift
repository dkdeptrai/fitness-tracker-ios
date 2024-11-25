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
          ForEach(0...10, id: \.self) { listing in
            Rectangle()
              .frame(height: 100)
              .cornerRadius(10)
          }
        }
      }
      .padding(.horizontal)
      .toolbar {
        ToolbarItem(placement: .principal) {
          HStack{
            TextField("Search for exercises", text: $viewModel.searchText)
              .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
              viewModel.fetchSearchResults()
            } label: {
              Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            }
          }
        }
      }
    }
  }
}

#Preview {
  ExerciseListingView()
}
