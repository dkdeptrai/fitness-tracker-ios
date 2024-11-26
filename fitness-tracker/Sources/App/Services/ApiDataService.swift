//
//  ApiDataService.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 25/11/24.
//

import Foundation

enum ApiDataServiceError: Error {
  case invalidURL
  case serverError
  case decodingError
  case unexpectedStatusCode(Int)
}

class ApiDataService<T: Codable>: DataService {
  let session: URLSession
  let baseUrl: String

  // MARK: - Initializers
  init(session: URLSession = .shared, baseUrl: String) {
    self.session = session
    self.baseUrl = baseUrl
  }

  private func createRequest(
    for endpoint: String, httpMethod: String, item: T? = nil
  ) throws -> URLRequest {
    guard let url = URL(string: "\(baseUrl)/\(endpoint)") else {
      throw ApiDataServiceError.invalidURL
    }

    var request = URLRequest(url: url)
    request.httpMethod = httpMethod
    if let item = item {
      request.httpBody = try JSONEncoder().encode(item)
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }

    return request
  }

  // MARK: - Fetch Data
  func fetchData(for endpoint: String) async throws -> [T] {
    let request = try createRequest(for: endpoint, httpMethod: "GET")

    do {
      let (data, response) = try await session.data(for: request)
      guard let httpResponse = response as? HTTPURLResponse else {
        throw ApiDataServiceError.serverError
      }

      if httpResponse.statusCode == 200 {
        let decodedData = try JSONDecoder().decode([T].self, from: data)
        return decodedData
      } else {
        throw ApiDataServiceError.unexpectedStatusCode(httpResponse.statusCode)
      }
    } catch {
      let errorMessage = ErrorHandler.handleError(error)
      print("Error fetching data: \(error)")
      throw error
    }
  }

  func fetchData(byId id: Int, for endpoint: String) async throws -> T? {
    guard let url = URL(string: "\(baseUrl)/\(endpoint)/\(id)") else {
      throw URLError(.badURL)
    }

    let request = try createRequest(for: "\(endpoint)/\(id)", httpMethod: "GET")

    do {
      let (data, response) = try await session.data(for: request)

      guard let httpResponse = response as? HTTPURLResponse else {
        throw ApiDataServiceError.serverError
      }

      if httpResponse.statusCode == 200 {
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
      } else {
        throw ApiDataServiceError.unexpectedStatusCode(httpResponse.statusCode)
      }
    } catch {
      let errorMessage = ErrorHandler.handleError(error)
      print("Error fetching data: \(error)")
      throw error
    }
  }

  // MARK: - Post Data
  func postData(to endpoint: String, item: T) async throws -> Bool {
    guard let url = URL(string: "\(baseUrl)/\(endpoint)") else {
      throw ApiDataServiceError.invalidURL
    }

    let request = try createRequest(
      for: endpoint, httpMethod: "POST", item: item)

    do {
      let (data, response) = try await session.data(for: request)

      guard let httpResponse = response as? HTTPURLResponse else {
        throw ApiDataServiceError.serverError
      }

      if httpResponse.statusCode == 201 {
        return true
      } else {
        throw ApiDataServiceError.unexpectedStatusCode(httpResponse.statusCode)
      }
    } catch {
      let errorMessage = ErrorHandler.handleError(error)
      print("Error posting data: \(error)")
      throw error
    }
  }

  // MARK: - Put Data
  func putData(to endpoint: String, byId id: Int, item: T) async throws
    -> Bool
  {
    let request = try createRequest(
      for: "\(endpoint)/\(id)", httpMethod: "PUT", item: item)

    do {
      let (_, response) = try await session.data(for: request)

      guard let httpResponse = response as? HTTPURLResponse else {
        throw ApiDataServiceError.serverError
      }
      if httpResponse.statusCode == 200 {
        return true
      } else {
        throw ApiDataServiceError.unexpectedStatusCode(httpResponse.statusCode)
      }
    } catch {
      let errorMessage = ErrorHandler.handleError(error)
      print("Error putting data: \(error)")
      throw error
    }
  }

  // MARK: - Delete Data
  func deleteData(from endpoint: String, byId id: Int) async throws -> Bool {
    guard let url = URL(string: "\(baseUrl)/\(endpoint)/\(id)") else {
      throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"
    do {

      let (_, response) = try await session.data(for: request)

      if let httpResponse = response as? HTTPURLResponse {
        return httpResponse.statusCode == 204
      } else {
        throw URLError(.badServerResponse)
      }
    } catch {
      let errorMessage = ErrorHandler.handleError(error)
      print("Error deleting data: \(error)")
      throw error
    }
  }
}
