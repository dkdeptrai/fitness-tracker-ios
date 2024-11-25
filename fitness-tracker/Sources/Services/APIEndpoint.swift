import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct APIEndpoint {
    let path: String
    let method: HTTPMethod
    var queryItems: [URLQueryItem]?
    var headers: [String: String]?
    
    // Default initializer
    init(path: String,
         method: HTTPMethod = .get,
         queryItems: [URLQueryItem]? = nil,
         headers: [String: String]? = nil) {
        self.path = path
        self.method = method
        self.queryItems = queryItems
        self.headers = headers
    }
    
    // Workouts endpoints
    static let workouts = APIEndpoint(path: "/workouts", method: .get)
    static func workout(id: String) -> APIEndpoint {
        APIEndpoint(path: "/workouts/\(id)", method: .get)
    }
    static let createWorkout = APIEndpoint(path: "/workouts", method: .post)
    static func updateWorkout(id: String) -> APIEndpoint {
        APIEndpoint(path: "/workouts/\(id)", method: .put)
    }
    
    // Exercises endpoints
    static let exercises = APIEndpoint(path: "/exercises", method: .get)
    static func exercise(id: String) -> APIEndpoint {
        APIEndpoint(path: "/exercises/\(id)", method: .get)
    }
}
