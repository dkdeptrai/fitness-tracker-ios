import Foundation

protocol APIServiceProtocol {
    func fetch<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T
    func post<T: Encodable, U: Decodable>(_ endpoint: APIEndpoint, body: T) async throws -> U
    func put<T: Encodable, U: Decodable>(_ endpoint: APIEndpoint, body: T) async throws -> U
    func delete(_ endpoint: APIEndpoint) async throws
}

class APIService: APIServiceProtocol {
    private let baseUrl: String
    private let session: URLSession
    private var authToken: String?
    
    init(baseUrl: String = ProcessInfo.processInfo.environment["API_BASE_URL"] ?? "", session: URLSession = .shared, authToken: String? = nil) {
        self.baseUrl = baseUrl
        self.session = session
        self.authToken = authToken
    }
    
    func setAuthToken(_ token: String?) {
        self.authToken = token
    }
    
    private func createRequest(_ endpoint: APIEndpoint) throws -> URLRequest {
        var components = URLComponents(string: baseUrl)
        components?.path += endpoint.path
        components?.queryItems = endpoint.queryItems
        
        guard let url = components?.url else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        // Set default headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Set auth token if available
        if let token = authToken {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        // Add custom headers
        endpoint.headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
    
    private func handleResponse(_ data: Data, _ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return
        case 401:
            throw APIError.unauthorized
        default:
            throw APIError.serverError(httpResponse.statusCode, data)
        }
    }
    
    func fetch<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T {
        let request = try createRequest(endpoint)
        
        do {
            let (data, response) = try await session.data(for: request)
            try handleResponse(data, response)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.networkError(error)
        }
    }
    
    func post<T: Encodable, U: Decodable>(_ endpoint: APIEndpoint, body: T) async throws -> U {
        var request = try createRequest(endpoint)
        
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        request.httpBody = try encoder.encode(body)
        
        do {
            let (data, response) = try await session.data(for: request)
            try handleResponse(data, response)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(U.self, from: data)
        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.networkError(error)
        }
    }
    
    func put<T: Encodable, U: Decodable>(_ endpoint: APIEndpoint, body: T) async throws -> U {
        var request = try createRequest(endpoint)
        
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        request.httpBody = try encoder.encode(body)
        
        do {
            let (data, response) = try await session.data(for: request)
            try handleResponse(data, response)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(U.self, from: data)
        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.networkError(error)
        }
    }
    
    func delete(_ endpoint: APIEndpoint) async throws {
        let request = try createRequest(endpoint)
        
        do {
            let (data, response) = try await session.data(for: request)
            try handleResponse(data, response)
        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.networkError(error)
        }
    }
}
