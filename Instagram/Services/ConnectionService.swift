//
//  ConnectionService.swift
//  Instagram
//
//  Created by Amir on 12/01/2024.
//

import Foundation

struct ConnectionService {
    static func follow(user: User) async throws {
        guard let uid = AuthService.currentUid else { return }
        
        // update current user following collection
        try await FirestoreConstants
            .usersCollection
            .document(uid)
            .collection("following")
            .document(user.id)
            .setData([:])
        
        // update target user followers collection
        try await FirestoreConstants
            .usersCollection
            .document(user.id)
            .collection("followers")
            .document(uid)
            .setData([:])
    }
    
    static func unfollow(user: User) async throws {
        guard let uid = AuthService.currentUid else { return }
        
        // update target user followers collection
        try await FirestoreConstants
            .usersCollection
            .document(user.id)
            .collection("followers")
            .document(uid)
            .delete()
        
        // update current user following collection
        try await FirestoreConstants
            .usersCollection
            .document(uid)
            .collection("following")
            .document(user.id)
            .delete()
    }
    
    static func isFollowing(user: User) async throws -> Bool {
        guard let uid = AuthService.currentUid else { return false }
        
        return try await FirestoreConstants
            .usersCollection
            .document(uid)
            .collection("following")
            .document(user.id)
            .getDocument()
            .exists
    }
}
