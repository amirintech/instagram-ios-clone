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

// MARK: User Stats
extension UserService {
    static func fetchStats(uid: String) async throws -> UserStats {
        async let followingCount =
        FirestoreConstants
            .usersCollection
            .document(uid)
            .collection("following")
            .getDocuments()
            .count
        
        async let followersCount =
        FirestoreConstants
            .usersCollection
            .document(uid)
            .collection("followers")
            .getDocuments()
            .count
        
        async let postsCount =
        FirestoreConstants
            .postsCollection
            .whereField("userId", isEqualTo: uid)
            .getDocuments()
            .count
        
        return try  await .init(followingCount: followingCount, followersCount: followersCount, postsCount: postsCount)
    }
}
