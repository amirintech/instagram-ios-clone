//
//  CommentService.swift
//  Instagram
//
//  Created by Amir on 10/01/2024.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct CommentService {
    static func upload(comment: Comment) async throws {
        guard let data = try? Firestore.Encoder().encode(comment) else { return }
        try await Firestore
            .firestore()
            .collection("posts")
            .document(comment.postId)
            .collection("post-comments")
            .addDocument(data: data)
    }
    
    static func fetchComments(for postId: String) async throws -> [Comment] {
        // fetch comments
        let snapshot = try await Firestore
                                    .firestore()
                                    .collection("posts")
                                    .document(postId)
                                    .collection("post-comments")
                                    .order(by: "timestamp", descending: true)
                                    .getDocuments()
        
        let comments = snapshot.documents.compactMap { try? $0.data(as: Comment.self) }
        
        // populate comments with users
        var commentsWithUsers: [Comment] = []
        for comment in comments {
            let user = try await Firestore
                                    .firestore()
                                    .collection("users")
                                    .document(comment.commentOwnerId)
                                    .getDocument()
                                    .data(as: User.self)
            
            var commentWithUser = comment
            commentWithUser.user = user
            commentsWithUsers.append(commentWithUser)
        }
        
        return commentsWithUsers
    }
}
