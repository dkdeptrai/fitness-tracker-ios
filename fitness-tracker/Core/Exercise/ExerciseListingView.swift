//
//  ExerciseListingView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 23/10/24.
//

import SwiftUI

struct ExerciseListingView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack {
                    ForEach(0...10, id: \.self) { listing in
                        Rectangle()
                            .frame(height: 100)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
                
        }
    }
}

#Preview {
    ExerciseListingView()
}
