//
//  Post.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let userId: String
    let caption: String
    let imageUrl: String
    let timestamp: Date
    var user: User?
    var likes: Int
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        Post(id: "101", userId: "1", caption: "Enjoying coding on iOS!", imageUrl: "post-img1", timestamp: Date(), user: User.MOCK_USERS[0], likes: 35),
        Post(id: "102", userId: "2", caption: "Designing beautiful interfaces", imageUrl: "post-img2", timestamp: Date(), user: User.MOCK_USERS[1], likes: 42),
        Post(id: "103", userId: "3", caption: "Building awesome software", imageUrl: "post-img3", timestamp: Date(), user: User.MOCK_USERS[2], likes: 27),
    ]
}
