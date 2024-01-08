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
