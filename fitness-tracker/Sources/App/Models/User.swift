//
//  User.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 26/10/24.
//

struct User: Codable, Identifiable {
    let id: Int
    var email: String
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case id, email, password
    }
    
}
