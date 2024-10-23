//
//  WorkoutView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 23/10/24.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Workout")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            ForEach(1...2, id: \.self) { workout in
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 100)
                    .cornerRadius(10)
            }
            HStack {
                Spacer()
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("Exercise")
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 20).padding(.horizontal, 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                })
                Spacer()
            }
            // Summary
            WorkoutSummaryView()
        }
        .padding()
    }
}

#Preview {
    WorkoutView()
}
