//
//  HomeView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 26/10/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Workout")
                        .fontWeight(.bold)
                }
                .padding(.vertical, 20).padding(.horizontal, 40)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(10)
            })
            .padding()
            .background(Color.accentColor)
            .cornerRadius(10)
        }
    }
}

#Preview {
    HomeView()
}
