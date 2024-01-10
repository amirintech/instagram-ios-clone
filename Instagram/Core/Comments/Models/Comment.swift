//
//  Comment.swift
//  Instagram
//
//  Created by Amir on 09/01/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Codable {
    @DocumentID var id: String?
    let commentOwnerId: String
    let postOwnerId: String
    let postId: String
    let commentText: String
    let timestamp: Timestamp
    
    var user: User?
}

extension Comment {
    static var MOCK_COMMENTS: [Comment] = [
        .init(
            id: "1",
            commentOwnerId: "user1",
            postOwnerId: "postOwner1",
            postId: "post1",
            commentText: "This is the first comment.",
            timestamp: Timestamp(date: Date()),
            user: .MOCK_USERS[0]
        ),
        .init(
            id: "2",
            commentOwnerId: "user2",
            postOwnerId: "postOwner2",
            postId: "post2",
            commentText: "Another comment here.",
            timestamp: Timestamp(date: Date()),
            user: .MOCK_USERS[0]
        ),
        .init(
            id: "3",
            commentOwnerId: "user3",
            postOwnerId: "postOwner3",
            postId: "post3",
            commentText: "Yet another comment.",
            timestamp: Timestamp(date: Date()),
            user: .MOCK_USERS[0]
        )
    ]
}
