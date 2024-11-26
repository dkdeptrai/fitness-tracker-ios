//
//  ExerciseRowView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 26/11/24.
//

import Foundation
import SwiftUI

struct ExerciseRowView: View {
  var exercise: Exercise

  var body: some View {
    HStack {
      Text(exercise.name)
        .font(.headline)
      Spacer()
    }
  }
}
