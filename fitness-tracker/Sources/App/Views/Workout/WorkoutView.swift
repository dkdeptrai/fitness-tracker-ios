//
//  WorkoutView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 23/10/24.
//

import SwiftUI

struct WorkoutView: View {
  @State var textVal: Int = 1
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(alignment: .leading) {
          Text("Workout")
            .font(.largeTitle)
            .fontWeight(.bold)

          ForEach(1...textVal, id: \.self) { workout in
            Rectangle()
              .foregroundColor(.accentColor)
              .frame(height: 100)
              .cornerRadius(10)
          }

          NavigationLink(destination: ExerciseListingView()) {
            addExerciseButton()
          }

          WorkoutSummaryView()
        }
        .padding()
      }
    }
 
  }

  func addExerciseButton() -> some View {
    return HStack {
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
}

#Preview {
  WorkoutView()
}
