//
//  WorkoutSummaryView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 23/10/24.
//

import SwiftUI

struct WorkoutSummaryView: View {
  var body: some View {
    HStack(alignment: .center) {
      Image(systemName: "flame")
        .resizable()
        .frame(width: 50, height: 50)
      VStack {
        Text("Summary")
        HStack {
          VStack {
            Text("Weight").fontWeight(.semibold)
            Text("100")
          }
          Spacer()
          VStack {
            Text("Sets").fontWeight(.semibold)
            Text("100")
          }
          Spacer()
          VStack {
            Text("Reps").fontWeight(.semibold)
            Text("100")
          }
        }.padding()
      }
    }
    .padding()
    .background(Color.accentColor)
    .cornerRadius(10)
  }
}

#Preview {
  WorkoutSummaryView()
}
