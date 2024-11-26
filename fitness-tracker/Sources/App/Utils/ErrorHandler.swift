//
//  ErrorHandler.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 26/11/24.
//

import Foundation

struct ErrorHandler {
  static func handleError(_ error: Error) -> String {
    switch error {
    case ApiDataServiceError.invalidURL:
      return "Invalid URL. Please check the endpoint."
    case ApiDataServiceError.serverError:
      return "The server encountered an error. Please try again later."
    case ApiDataServiceError.decodingError:
      return "Failed to process data. Please try again."
    case ApiDataServiceError.unexpectedStatusCode(let code):
      return "Unexpected response from the server: \(code)."
    case URLError.badURL:
      return "The URL is malformed. Please check your request."
    case URLError.badServerResponse:
      return "The server returned an invalid response."
    default:
      return "An unexpected error occurred: \(error.localizedDescription)"
    }
  }
}
