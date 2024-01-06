//
//  User.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    var username: String
    var fullName: String?
    var profileImageUrl: String?
    var bio: String?
    
}

extension User {
    static var MOCK_USERS = [
        User(id: "1", email: "john@example.com", username: "JohnDoe", fullName: "John Doe", profileImageUrl: "profile-img1", bio: "iOS Developer"),
        User(id: "2", email: "jane@example.com", username: "JaneDoe", profileImageUrl: "profile-img2", bio: "Designer"),
        User(id: "3", email: "bob@example.com", username: "BobSmith", profileImageUrl: "profile-img3", bio: "Software Engineer")
    ]
}
