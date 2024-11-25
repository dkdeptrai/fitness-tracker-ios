//
//  WorkoutView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 23/10/24.
//

import SwiftUI

struct WorkoutView: View {
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading) {
        Text("Workout")
          .font(.largeTitle)
          .fontWeight(.bold)

        ForEach(1...2, id: \.self) { workout in
          Rectangle()
            .foregroundColor(.accentColor)
            .frame(height: 100)
            .cornerRadius(10)
        }
        .padding(.top)

        Spacer()

        NavigationLink(destination: ExerciseListingView()) {
          HStack {
            Image(systemName: "plus")
            Text("Exercise")
              .fontWeight(.bold)
          }
          .padding(.vertical, 20)
          .frame(maxWidth: .infinity)
          .padding(.horizontal, 40)
          .background(Color.accentColor)
          .foregroundColor(.white)
          .cornerRadius(10)
        }

        // Summary  
        WorkoutSummaryComponent()
      }
    }
    .padding()
  }
}

#Preview {
  WorkoutView()
}
