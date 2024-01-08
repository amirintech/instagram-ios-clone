//
//  User.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    var username: String
    var fullName: String?
    var profileImageUrl: String?
    var bio: String?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS = [
        User(id: "1", email: "john@example.com", username: "JohnDoe", fullName: "John Doe", profileImageUrl: nil, bio: "iOS Developer"),
        User(id: "2", email: "jane@example.com", username: "JaneDoe", profileImageUrl: nil, bio: "Designer"),
        User(id: "3", email: "bob@example.com", username: "BobSmith", profileImageUrl: nil, bio: "Software Engineer")
    ]
}
