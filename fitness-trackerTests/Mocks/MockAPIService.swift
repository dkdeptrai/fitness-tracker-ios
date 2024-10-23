//
//  MockAPIService.swift
//  fitness-trackerTests
//
//  Created by Đình Khoa Nguyễn on 23/10/24.
//

import Foundation

class MockAPIService: APIServiceProtocol {
    
    var mockResult: Any?
    var error: Error?
    var capturedEndpoint: APIEndpoint?
    
    func fetch<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T {
        capturedEndpoint = endpoint
        
        if let error = error {
            throw error
        }
        
        guard let result = mockResult as? T else {
            throw APIError.decodingError(NSError(domain: "", code: -1))
        }
        
        return result;
    }
    
    func post<T: Encodable, U: Decodable>(_ endpoint: APIEndpoint, body: T) async throws -> U {
        capturedEndpoint = endpoint
        
        if let error = error {
            throw error
        }
        
        guard let result = mockResult as? U else {
            throw APIError.decodingError(NSError(domain: "", code: -1))
        }
        
        return result;
    }
    
    func put<T, U>(_ endpoint: APIEndpoint, body: T) async throws -> U where T : Encodable, U : Decodable {
        capturedEndpoint = endpoint
        
        if let error = error {
            throw error
        }
        
        guard let result = mockResult as? U else {
            throw APIError.decodingError(NSError(domain: "", code: -1))
        }
        
        return result;
    }
    
    func delete(_ endpoint: APIEndpoint) async throws {
        capturedEndpoint = endpoint
        
        if let error = error {
            throw error
        }
    }
    
}
