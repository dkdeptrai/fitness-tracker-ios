//
//  LocalStorage.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 22/10/24.
//

import Foundation

protocol LocalStorageProtocol {
    func save<T: Encodable>(_ item: T, forKey key: String) throws
    func load<T: Decodable>(_ key: String) throws -> T?
    func remove(forKey key: String)
}

class LocalStorage: LocalStorageProtocol {
    private let defaults = UserDefaults.standard
    
    func save<T: Encodable>(_ item: T, forKey key: String) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(item)
        defaults.set(data, forKey: key)
    }
    
    func load<T: Decodable>(_ key: String) throws -> T? {
        guard let data = defaults.data(forKey: key) else { return nil }
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
    func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
}
