import Foundation

protocol DataService {
  associatedtype T: Codable
  func fetchData(for endpoint: String) async throws -> [T]
  func fetchData(byId id: Int, for endpoint: String) async throws -> T?
  func postData(to endpoint: String, item: T) async throws -> T?
  func putData(to endpoint: String, byId id: Int, item: T) async throws -> T?
  func deleteData(from endpoint: String, byId id: Int) async throws -> Bool
}

