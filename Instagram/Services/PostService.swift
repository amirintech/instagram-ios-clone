//
//  PostService.swift
//  Instagram
//
//  Created by Amir on 08/01/2024.
//

import Foundation
import Firebase
    
struct PostService {
    static let collection = Firestore.firestore().collection("posts")
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await collection.whereField("userId", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap { try $0.data(as: Post.self) }
    }
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await collection.getDocuments()
        let posts = try snapshot.documents.compactMap { try $0.data(as: Post.self) }
        
        var fullPosts = [Post]()
        for i in 0 ..< posts.count {
            var post = posts[i]
            post.user = try await UserService.fetchUser(uid: post.userId)
            fullPosts.append(post)
        }
        
        return fullPosts
    }
}


// MARK: Likes 

extension PostService {
    static func like(post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await self.collection.document(post.id).collection("post-likes").document(uid).setData([:])
        async let _ = try await self.collection.document(post.id).updateData(["likes": post.likes])
        async let _ = Firestore.firestore().collection("users").document(uid).collection("user-likes").document(post.id).setData([:])
    }
    
    static func unlike(post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await self.collection.document(post.id).collection("post-likes").document(uid).delete()
        async let _ = try await self.collection.document(post.id).updateData(["likes": post.likes])
        async let _ = Firestore.firestore().collection("users").document(uid).collection("user-likes").document(post.id).delete()
    }
    
    static func didUserLike(post: Post) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).collection("user-likes").document(post.id).getDocument()
        
        return snapshot.exists
    }
}


