//
//  LoadingOverlayView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 26/11/24.
//

import Foundation
import SwiftUI

public struct LoadingOverlayView: View {
  @Binding var isPresented: Bool
  init(isPresented: Binding<Bool>) {
    self._isPresented = isPresented
  }
  public var body: some View {
    ZStack {
      if isPresented {
        Color.black.opacity(0.5)
          .ignoresSafeArea()
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle())
          .scaleEffect(2)
          .foregroundColor(.white)
      }
    }
  }
}
