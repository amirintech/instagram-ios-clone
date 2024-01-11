//
//  UserService.swift
//  Instagram
//
//  Created by Amir on 07/01/2024.
//

import Foundation
import Firebase

struct UserService {
    static func fetchUser(uid: String) async throws -> User {
        return try await FirestoreConstants.usersCollection.document(uid).getDocument(as: User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await FirestoreConstants.usersCollection.getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
