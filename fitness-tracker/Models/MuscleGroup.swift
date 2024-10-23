//
//  MuscleGroup.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 22/10/24.
//

struct MuscleGroup: Codable, Identifiable {
    let id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}
