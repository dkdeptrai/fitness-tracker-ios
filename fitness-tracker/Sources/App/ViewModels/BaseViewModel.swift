//
//  BaseViewModel.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 26/11/24.
//

import Foundation

class BaseViewModel: ObservableObject {
  @Published var errorMessage: String?

  func handleError(_ error: Error) {
    errorMessage = ErrorHandler.handleError(error)
  }
}
